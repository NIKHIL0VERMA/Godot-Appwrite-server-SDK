Get a list of branches from a GitHub repository in your installation. This endpoint supports filtering by a search term and pagination using query strings such as `Query.limit()`, `Query.offset()`, `Query.cursorAfter()`, and `Query.cursorBefore()`. It returns branch names along with the total number of matches. The GitHub installation must be properly configured and have access to the requested repository for this endpoint to work.

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.vcs.list_repository_branches(
        '<INSTALLATION_ID>',
        '<PROVIDER_REPOSITORY_ID>',
        '<SEARCH>', # optional
        [] # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteBranchList:
        print(result.to_dict())
```