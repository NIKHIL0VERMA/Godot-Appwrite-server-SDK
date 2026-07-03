## upsertDocument
Create or update a Document. Before using this route, you should create a new collection resource using either a [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection) API or directly from your database console.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_session('') # The user session to authenticate with

    var result = await Appwrite.databases.upsert_document(
        '<DATABASE_ID>',
        '<COLLECTION_ID>',
        '<DOCUMENT_ID>',
        {"username":"walter.obrien","email":"walter.obrien@example.com","fullName":"Walter O'Brien","age":30,"isAdmin":false}, # optional
        ["read("any")"], # optional
        '<TRANSACTION_ID>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDocument:
        print(result.to_dict())
```
---