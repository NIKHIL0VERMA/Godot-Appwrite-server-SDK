## updateDocument
Update a document by its unique ID. Using the patch method you can pass only specific fields that will get updated.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_session('') # The user session to authenticate with

    var result = await Appwrite.databases.update_document(
        '<DATABASE_ID>',
        '<COLLECTION_ID>',
        '<DOCUMENT_ID>',
        {"username":"walter.obrien","email":"walter.obrien@example.com","fullName":"Walter O'Brien","age":33,"isAdmin":false}, # optional
        ["read("any")"], # optional
        '<TRANSACTION_ID>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDocument:
        print(result.to_dict())
```
---