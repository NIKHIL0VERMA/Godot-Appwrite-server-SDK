Get a list of all frameworks that are currently available on the server instance.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.sites.list_frameworks(
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteFrameworkList:
        print(result.to_dict())
```