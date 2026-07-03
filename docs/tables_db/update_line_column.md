## updateLineColumn
Update a line column. Changing the `default` value will not update already existing rows.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.tablesDB.update_line_column(
        '<DATABASE_ID>',
        '<TABLE_ID>',
        "",
        false,
        [[1, 2], [3, 4], [5, 6]], # optional
        "" # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteColumnLine:
        print(result.to_dict())
```
---