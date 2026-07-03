## listDocuments
Get a list of all the user&#039;s documents in a given collection. You can use the query params to filter your results.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_session('') # The user session to authenticate with

    var result = await Appwrite.databases.list_documents(
        '<DATABASE_ID>',
        '<COLLECTION_ID>',
        [], # optional
        '<TRANSACTION_ID>', # optional
        false, # optional
        0 # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDocumentList:
        print(result.to_dict())
```
---