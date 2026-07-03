## createIndex
Creates an index on the attributes listed. Your index should include all the attributes you will query in a single request.
Attributes can be `key`, `fulltext`, and `unique`.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.databases.create_index(
        '<DATABASE_ID>',
        '<COLLECTION_ID>',
        "",
        Appwrite.DatabasesIndexType.KEY,
        [],
        Appwrite.[OrderBy.ASC], # optional
        [] # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteIndex:
        print(result.to_dict())
```
---