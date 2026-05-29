List all scopes available for project API keys, along with a description for each scope.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.console.list_project_scopes(
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteConsoleKeyScopeList:
        print(result.to_dict())
```