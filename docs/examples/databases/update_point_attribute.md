Update a point attribute. Changing the `default` value will not update already existing documents.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.databases.update_point_attribute(
        '<DATABASE_ID>',
        '<COLLECTION_ID>',
        "",
        false,
        [1, 2], # optional
        "" # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteAttributePoint:
        print(result.to_dict())
```