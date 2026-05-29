Suggests column names and their size limits based on the provided table name. The API will also analyze other tables in the same database to provide context-aware suggestions, ensuring consistency across schema design. Users may optionally provide custom context to further refine the suggestions.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.console.suggest_columns(
        '<DATABASE_ID>',
        '<TABLE_ID>',
        '<CONTEXT>', # optional
        1, # optional
        1 # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteColumnList:
        print(result.to_dict())
```