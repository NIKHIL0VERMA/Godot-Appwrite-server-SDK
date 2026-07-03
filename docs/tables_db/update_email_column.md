## updateEmailColumn
Update an email column. Changing the `default` value will not update already existing rows.


---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.tablesDB.update_email_column(
        '<DATABASE_ID>',
        '<TABLE_ID>',
        "",
        false,
        'email@example.com',
        "" # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteColumnEmail:
        print(result.to_dict())
```
---