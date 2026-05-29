Get detailed information about a specific GitHub repository from your installation. This endpoint returns repository details including its ID, name, visibility status, organization, and latest push date. The GitHub installation must be properly configured and have access to the requested repository for this endpoint to work.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.vcs.get_repository(
        '<INSTALLATION_ID>',
        '<PROVIDER_REPOSITORY_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteProviderRepository:
        print(result.to_dict())
```