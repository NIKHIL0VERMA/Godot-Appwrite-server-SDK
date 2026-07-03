## upsertRows
Create or update Rows. Before using this route, you should create a new table resource using either a [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable) API or directly from your database console.


---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.tablesDB.upsert_rows(
        '<DATABASE_ID>',
        '<TABLE_ID>',
        [],
        '<TRANSACTION_ID>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteRowList:
        print(result.to_dict())
```
---