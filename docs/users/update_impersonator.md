## updateImpersonator
Enable or disable whether a user can impersonate other users. When impersonation headers are used, the request runs as the target user for API behavior, while internal audit logs still attribute the action to the original impersonator and store the impersonated target details only in internal audit payload data.


---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.users.update_impersonator(
        '<USER_ID>',
        false
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteUser:
        print(result.to_dict())
```
---