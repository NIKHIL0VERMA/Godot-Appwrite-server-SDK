Suggest valid Appwrite query JSON objects for a supported list resource from free-text user intent. The endpoint picks a validator based on `resource` — for system resources it uses the static validator and its allowed attributes, and for user-owned table rows it loads the table schema and validates against those attributes at request time. The returned queries are guaranteed to parse and pass the relevant queries validator.

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.console.suggest_queries(
        'activities',
        '<INPUT>',
        '<DATABASE_ID>', # optional
        '<TABLE_ID>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is Variant:
        print(result.to_dict())
```