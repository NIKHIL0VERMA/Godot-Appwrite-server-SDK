## getSession
Use this endpoint to get a logged in user&#039;s session using a Session ID. Inputting &#039;current&#039; will return the current session being used.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_session('') # The user session to authenticate with

    var result = await Appwrite.account.get_session(
        '<SESSION_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteSession:
        print(result.to_dict())
```
---