## reject
Reject an OAuth2 grant when the user denies consent. Returns the `redirectUrl` the end user should be sent to with an `access_denied` error. You can pass Accept header of `application/json` to receive a JSON response instead of a redirect.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_session('') # The user session to authenticate with
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.oauth2.reject(
        '<GRANT_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteOauth2Reject:
        print(result.to_dict())
```
---