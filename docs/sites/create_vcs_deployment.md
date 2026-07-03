## createVcsDeployment
Create a deployment when a site is connected to VCS.

This endpoint lets you create deployment from a branch, commit, or a tag.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.sites.create_vcs_deployment(
        '<SITE_ID>',
        Appwrite.VCSReferenceType.BRANCH,
        '<REFERENCE>',
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDeployment:
        print(result.to_dict())
```
---