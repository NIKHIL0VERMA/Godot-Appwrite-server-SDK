## revoke
Revoke an OAuth2 access token or refresh token.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_session('') # The user session to authenticate with
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.oauth2.revoke(
        '<TOKEN>',
        'access_token', # optional
        '<CLIENT_ID>', # optional
        '<CLIENT_SECRET>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is Variant:
        print(result.to_dict())
```
---