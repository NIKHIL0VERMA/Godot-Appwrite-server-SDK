## listRows
Get a list of all the user&#039;s rows in a given table. You can use the query params to filter your results.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_session('') # The user session to authenticate with

    var result = await Appwrite.tablesDB.list_rows(
        '<DATABASE_ID>',
        '<TABLE_ID>',
        [], # optional
        '<TRANSACTION_ID>', # optional
        false, # optional
        0 # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteRowList:
        print(result.to_dict())
```
---