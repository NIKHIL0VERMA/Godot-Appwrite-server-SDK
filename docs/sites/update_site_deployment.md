## updateSiteDeployment
Update the site active deployment. Use this endpoint to switch the code deployment that should be used when visitor opens your site.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.sites.update_site_deployment(
        '<SITE_ID>',
        '<DEPLOYMENT_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteSite:
        print(result.to_dict())
```
---