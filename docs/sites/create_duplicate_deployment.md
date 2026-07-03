## createDuplicateDeployment
Create a new build for an existing site deployment. This endpoint allows you to rebuild a deployment with the updated site configuration, including its commands and output directory if they have been modified. The build process will be queued and executed asynchronously. The original deployment&#039;s code will be preserved and used for the new build.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.sites.create_duplicate_deployment(
        '<SITE_ID>',
        '<DEPLOYMENT_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDeployment:
        print(result.to_dict())
```
---