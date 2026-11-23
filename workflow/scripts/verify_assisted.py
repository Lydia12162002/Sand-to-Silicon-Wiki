#!/usr/bin/env python3
"""Check sources, YAML, and local Markdown links. Stdlib + PyYAML required."""
import os,sys,re,json,hashlib,pathlib,yaml
root=pathlib.Path(__file__).resolve().parents[2]
m=json.loads((root/'sources/manifest.json').read_text(encoding='utf8'))
fail=[]; results=[]
for s in m['sources']:
 p=root/s['filepath']
 if not p.exists():
  results.append('SOURCE_LOCAL_NOT_PRESENT '+s['id']+' (local raw is intentionally not in public ZIP)')
  continue
 h=hashlib.sha256(p.read_bytes()).hexdigest()
 if h != s['checksum']:fail.append('SHA mismatch '+s['id'])
 else:results.append('SHA OK '+s['id'])
for p in sorted((root/'wiki').rglob('*.md')):
 t=p.read_text(encoding='utf8')
 if p.name=='log.md':continue
 fm=re.match(r'\A---\n(.*?)\n---\n',t,re.S)
 if not fm:fail.append('No frontmatter '+str(p.relative_to(root)));continue
 try:y=yaml.safe_load(fm.group(1))
 except Exception as e:fail.append('Bad yaml '+str(p)+': '+str(e));continue
 for k in ('title','category','sources','last_updated'):
  if k not in y:fail.append('missing '+k+' in '+str(p.relative_to(root)))
 for sid in y.get('sources',[]):
  if sid not in {s['id'] for s in m['sources']}:fail.append('Unknown '+sid+' in '+str(p.relative_to(root)))
 for url in re.findall(r'\]\(([^)]+)\)',t):
  if '://' in url or url.startswith('#') or url.startswith('mailto:'):continue
  target=(p.parent/url.split('#')[0]).resolve()
  if not target.exists():fail.append('Broken link '+str(p.relative_to(root))+' -> '+url)
print('\n'.join(results));print('FAILURES:',len(fail))
for e in fail:print('FAIL',e)
sys.exit(1 if fail else 0)
