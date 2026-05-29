Get a key by its unique ID. This endpoint returns details about a specific API key in your account including it&#039;s scopes.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.account.get_key(
        '<KEY_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteKey:
        print(result.to_dict())
```