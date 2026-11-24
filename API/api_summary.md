### What is a REST API?
a REST API(Representational State Transfer Application Programming Interface) is a bridge that allows two software applications to communicate over the internet using standard HTTP methons like GET and POST
### HTTP status codes observed 
200: OK (request succeeded)
404: Not Found (requested resource/endpoint doesn't exist
### jq Filter Breakdown
in jq, every pair followa the pattern
new_key: .original_key:
**Command used:**
```bash
cat API/github_profile.json | jq '{name:.name, repos:.public_repos, followers:.followers, joined:.created_at}'
 
