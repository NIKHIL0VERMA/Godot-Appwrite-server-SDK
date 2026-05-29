List allowed function specifications for this instance.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.functions.list_specifications(
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteSpecificationList:
        print(result.to_dict())
```