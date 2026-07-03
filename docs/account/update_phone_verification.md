## updatePhoneVerification
Use this endpoint to complete the user phone verification process. Use the **userId** and **secret** that were sent to your user&#039;s phone number to verify the user email ownership. If confirmed this route will return a 200 status code.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_session('') # The user session to authenticate with

    var result = await Appwrite.account.update_phone_verification(
        '<USER_ID>',
        '<SECRET>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteToken:
        print(result.to_dict())
```
---