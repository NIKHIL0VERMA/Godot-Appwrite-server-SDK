Get a document by its unique ID. This endpoint response returns a JSON object with the document data.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.databases.get_document(
        '<DATABASE_ID>',
        '<COLLECTION_ID>',
        '<DOCUMENT_ID>',
        [], # optional
        '<TRANSACTION_ID>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDocument:
        print(result.to_dict())
```