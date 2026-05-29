Create a longtext column.

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.tablesDB.create_longtext_column(
        '<DATABASE_ID>',
        '<TABLE_ID>',
        "",
        false,
        '<DEFAULT>', # optional
        false, # optional
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteColumnLongtext:
        print(result.to_dict())
```