## createDatetimeAttribute
Create a date time attribute according to the ISO 8601 standard.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.databases.create_datetime_attribute(
        '<DATABASE_ID>',
        '<COLLECTION_ID>',
        "",
        false,
        '2020-10-15T06:38:00.000+00:00', # optional
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteAttributeDatetime:
        print(result.to_dict())
```
---