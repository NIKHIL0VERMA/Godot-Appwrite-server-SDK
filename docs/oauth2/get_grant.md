## getGrant
Get an OAuth2 grant by its ID. Used by the consent screen to display the details of the authorization the user is being asked to approve. A grant can only be read by the user it belongs to, or by server SDK.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_session('') # The user session to authenticate with
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.oauth2.get_grant(
        '<GRANT_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteOauth2Grant:
        print(result.to_dict())
```
---