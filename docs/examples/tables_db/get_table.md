Get a table by its unique ID. This endpoint response returns a JSON object with the table metadata.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.tablesDB.get_table(
        '<DATABASE_ID>',
        '<TABLE_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteTable:
        print(result.to_dict())
```