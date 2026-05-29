Update a file by its unique ID. Only users with write permissions have access to update this resource.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.storage.update_file(
        '<BUCKET_ID>',
        '<FILE_ID>',
        '<NAME>', # optional
        ["read("any")"] # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteFile:
        print(result.to_dict())
```