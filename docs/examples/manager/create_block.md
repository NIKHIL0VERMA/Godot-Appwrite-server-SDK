Creates a new resource block.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint

    var result = await Appwrite.manager.create_block(
        '<PROJECT_ID>',
        'projects',
        '<RESOURCE_ID>', # optional
        '<REASON>', # optional
        '2020-10-15T06:38:00.000+00:00' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteBlock:
        print(result.to_dict())
```