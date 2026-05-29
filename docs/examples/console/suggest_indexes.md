Suggests database indexes for table columns based on the provided table structure and existing columns. The API will also analyze the table&#039;s column types, names, and patterns to recommend optimal indexes that improve query performance for common database operations like filtering, sorting, and searching.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.console.suggest_indexes(
        '<DATABASE_ID>',
        '<TABLE_ID>',
        1, # optional
        1 # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteColumnIndexList:
        print(result.to_dict())
```