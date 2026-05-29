Get a list of files and directories from a GitHub repository connected to your project. This endpoint returns the contents of a specified repository path, including file names, sizes, and whether each item is a file or directory. The GitHub installation must be properly configured and the repository must be accessible through your installation for this endpoint to work.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.vcs.get_repository_contents(
        '<INSTALLATION_ID>',
        '<PROVIDER_REPOSITORY_ID>',
        '<PROVIDER_ROOT_DIRECTORY>', # optional
        '<PROVIDER_REFERENCE>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteVcsContentList:
        print(result.to_dict())
```