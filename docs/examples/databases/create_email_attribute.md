Create an email attribute.

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.databases.create_email_attribute(
        '<DATABASE_ID>',
        '<COLLECTION_ID>',
        "",
        false,
        'email@example.com', # optional
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteAttributeEmail:
        print(result.to_dict())
```