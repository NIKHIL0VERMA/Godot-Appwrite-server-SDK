## updateRows
Update all rows that match your queries, if no queries are submitted then all rows are updated. You can pass only specific fields to be updated.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.tablesDB.update_rows(
        '<DATABASE_ID>',
        '<TABLE_ID>',
        {"username":"walter.obrien","email":"walter.obrien@example.com","fullName":"Walter O'Brien","age":33,"isAdmin":false}, # optional
        [], # optional
        '<TRANSACTION_ID>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteRowList:
        print(result.to_dict())
```
---