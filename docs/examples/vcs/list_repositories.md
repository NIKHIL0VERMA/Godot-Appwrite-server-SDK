Get a list of GitHub repositories available through your installation. This endpoint returns repositories with their basic information, detected runtime environments, and latest push dates. You can optionally filter repositories using a search term. Each repository&#039;s runtime is automatically detected based on its contents and language statistics. The GitHub installation must be properly configured for this endpoint to work.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.vcs.list_repositories(
        '<INSTALLATION_ID>',
        'runtime',
        '<SEARCH>', # optional
        [] # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteProviderRepositoryRuntimeList:
        print(result.to_dict())
```