Lists all resource blocks for a project.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint

    var result = await Appwrite.manager.list_blocks(
        '<PROJECT_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteBlockList:
        print(result.to_dict())
```