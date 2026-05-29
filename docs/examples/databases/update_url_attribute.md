Update an url attribute. Changing the `default` value will not update already existing documents.

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.databases.update_url_attribute(
        '<DATABASE_ID>',
        '<COLLECTION_ID>',
        "",
        false,
        'https://example.com',
        "" # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteAttributeUrl:
        print(result.to_dict())
```