List all VCS installations configured for the current project. This endpoint returns a list of installations including their provider, organization, and other configuration details.

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.vcs.list_installations(
        [], # optional
        '<SEARCH>', # optional
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteInstallationList:
        print(result.to_dict())
```