## updateVerification
Use this endpoint to complete the user email verification process. Use both the **userId** and **secret** parameters that were attached to your app URL to verify the user email ownership. If confirmed this route will return a 200 status code.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_session('') # The user session to authenticate with

    var result = await Appwrite.account.update_verification(
        '<USER_ID>',
        '<SECRET>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteToken:
        print(result.to_dict())
```
---