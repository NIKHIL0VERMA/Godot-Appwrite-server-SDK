Get a row by its unique ID. This endpoint response returns a JSON object with the row data.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.tablesDB.get_row(
        '<DATABASE_ID>',
        '<TABLE_ID>',
        '<ROW_ID>',
        [], # optional
        '<TRANSACTION_ID>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteRow:
        print(result.to_dict())
```