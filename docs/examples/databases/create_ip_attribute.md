Create IP address attribute.

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.databases.create_ip_attribute(
        '<DATABASE_ID>',
        '<COLLECTION_ID>',
        "",
        false,
        "", # optional
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteAttributeIp:
        print(result.to_dict())
```