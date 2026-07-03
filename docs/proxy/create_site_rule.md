## createSiteRule
Create a new proxy rule for serving Appwrite Site on custom domain.

Rule ID is automatically generated as MD5 hash of a rule domain for performance purposes.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.proxy.create_site_rule(
        "",
        '<SITE_ID>',
        '<BRANCH>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteProxyRule:
        print(result.to_dict())
```
---