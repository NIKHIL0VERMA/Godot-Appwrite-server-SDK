## createCollection
Create a new Collection. Before using this route, you should create a new database resource using either a [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection) API or directly from your database console.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.databases.create_collection(
        '<DATABASE_ID>',
        '<COLLECTION_ID>',
        '<NAME>',
        ["read("any")"], # optional
        false, # optional
        false, # optional
        [], # optional
        [] # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteCollection:
        print(result.to_dict())
```
---