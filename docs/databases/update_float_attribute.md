## updateFloatAttribute
Update a float attribute. Changing the `default` value will not update already existing documents.


---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.databases.update_float_attribute(
        '<DATABASE_ID>',
        '<COLLECTION_ID>',
        "",
        false,
        0.0,
        0.0, # optional
        0.0, # optional
        "" # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteAttributeFloat:
        print(result.to_dict())
```
---