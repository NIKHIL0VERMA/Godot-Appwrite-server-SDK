## updatePhoneVerification
Update the user phone verification status by its unique ID.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.users.update_phone_verification(
        '<USER_ID>',
        false
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteUser:
        print(result.to_dict())
```
---