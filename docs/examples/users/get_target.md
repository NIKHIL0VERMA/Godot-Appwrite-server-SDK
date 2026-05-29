Get a user&#039;s push notification target by ID.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.users.get_target(
        '<USER_ID>',
        '<TARGET_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteTarget:
        print(result.to_dict())
```