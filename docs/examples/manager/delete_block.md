Deletes resource blocks for a project.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint

    var result = await Appwrite.manager.delete_block(
        '<PROJECT_ID>',
        'projects',
        '<RESOURCE_ID>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteBlockDelete:
        print(result.to_dict())
```