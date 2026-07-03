## updateSession
Use this endpoint to extend a session&#039;s length. Extending a session is useful when session expiry is short. If the session was created using an OAuth provider, this endpoint refreshes the access token from the provider.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_session('') # The user session to authenticate with

    var result = await Appwrite.account.update_session(
        '<SESSION_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteSession:
        print(result.to_dict())
```
---