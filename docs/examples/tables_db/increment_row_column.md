Increment a specific column of a row by a given value.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.tablesDB.increment_row_column(
        '<DATABASE_ID>',
        '<TABLE_ID>',
        '<ROW_ID>',
        "",
        0.0, # optional
        0.0, # optional
        '<TRANSACTION_ID>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteRow:
        print(result.to_dict())
```