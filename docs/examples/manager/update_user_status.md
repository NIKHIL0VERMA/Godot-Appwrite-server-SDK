Updates a console user status using a user ID or email address.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint

    var result = await Appwrite.manager.update_user_status(
        false,
        '<USER_ID>', # optional
        '<EMAIL>', # optional
        '<REASON>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteUser:
        print(result.to_dict())
```