List available site templates. You can use template details in [createSite](/docs/references/cloud/server-nodejs/sites#create) method.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.sites.list_templates(
        [], # optional
        [], # optional
        1, # optional
        0 # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteTemplateSiteList:
        print(result.to_dict())
```