## updateRelationshipColumn
Update relationship column. [Learn more about relationship columns](https://appwrite.io/docs/databases-relationships#relationship-columns).


---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.tablesDB.update_relationship_column(
        '<DATABASE_ID>',
        '<TABLE_ID>',
        "",
        Appwrite.RelationMutate.CASCADE, # optional
        "" # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteColumnRelationship:
        print(result.to_dict())
```
---