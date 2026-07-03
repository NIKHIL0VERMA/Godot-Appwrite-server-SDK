## createPolygonAttribute
Create a geometric polygon attribute.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.databases.create_polygon_attribute(
        '<DATABASE_ID>',
        '<COLLECTION_ID>',
        "",
        false,
        [[[1, 2], [3, 4], [5, 6], [1, 2]]] # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteAttributePolygon:
        print(result.to_dict())
```
---