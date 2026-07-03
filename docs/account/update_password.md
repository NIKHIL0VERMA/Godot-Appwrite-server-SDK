## updatePassword
Update currently logged in user password. For validation, user is required to pass in the new password, and the old password. For users created with OAuth, Team Invites and Magic URL, oldPassword is optional.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_session('') # The user session to authenticate with

    var result = await Appwrite.account.update_password(
        'password',
        'password' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteUser:
        print(result.to_dict())
```
---