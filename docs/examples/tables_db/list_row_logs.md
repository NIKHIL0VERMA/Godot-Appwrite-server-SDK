Get the row activity logs list by its unique ID.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.tablesDB.list_row_logs(
        '<DATABASE_ID>',
        '<TABLE_ID>',
        '<ROW_ID>',
        [] # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteLogList:
        print(result.to_dict())
```