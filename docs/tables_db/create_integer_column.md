## createIntegerColumn
Create an integer column. Optionally, minimum and maximum values can be provided.


---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.tablesDB.create_integer_column(
        '<DATABASE_ID>',
        '<TABLE_ID>',
        "",
        false,
        0, # optional
        0, # optional
        0, # optional
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteColumnInteger:
        print(result.to_dict())
```
---