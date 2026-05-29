Create relationship column. [Learn more about relationship columns](https://appwrite.io/docs/databases-relationships#relationship-columns).

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.tablesDB.create_relationship_column(
        '<DATABASE_ID>',
        '<TABLE_ID>',
        '<RELATED_TABLE_ID>',
        'oneToOne',
        false, # optional
        "", # optional
        "", # optional
        'cascade' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteColumnRelationship:
        print(result.to_dict())
```