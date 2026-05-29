Delete a project\&#039;s dev key by its unique ID. Once deleted, the key will no longer allow bypassing of rate limits and better logging of errors.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.projects.delete_dev_key(
        '<PROJECT_ID>',
        '<KEY_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is Variant:
        print(result.to_dict())
```