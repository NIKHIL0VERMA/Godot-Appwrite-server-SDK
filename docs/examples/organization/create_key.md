Create a new organization API key.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.organization.create_key(
        '<KEY_ID>',
        '<NAME>',
        [],
        '2020-10-15T06:38:00.000+00:00' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteKey:
        print(result.to_dict())
```