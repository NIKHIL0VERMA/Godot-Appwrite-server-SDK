Get a VCS installation by its unique ID. This endpoint returns the installation&#039;s details including its provider, organization, and configuration. 
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.vcs.get_installation(
        '<INSTALLATION_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteInstallation:
        print(result.to_dict())
```