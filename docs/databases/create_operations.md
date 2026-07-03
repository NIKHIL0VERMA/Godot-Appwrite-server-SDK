## createOperations
Create multiple operations in a single transaction.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.databases.create_operations(
        '<TRANSACTION_ID>',
        [
	    {
	        "action": "create",
	        "databaseId": "<DATABASE_ID>",
	        "collectionId": "<COLLECTION_ID>",
	        "documentId": "<DOCUMENT_ID>",
	        "data": {
	            "name": "Walter O'Brien"
	        }
	    }
	] # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteTransaction:
        print(result.to_dict())
```
---