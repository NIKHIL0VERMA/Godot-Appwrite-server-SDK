Creates an index on the attributes listed. Your index should include all the attributes you will query in a single request.
Attributes can be `key`, `fulltext`, and `unique`.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.databases.create_index(
        '<DATABASE_ID>',
        '<COLLECTION_ID>',
        "",
        'key',
        [],
        [], # optional
        [] # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteIndex:
        print(result.to_dict())
```