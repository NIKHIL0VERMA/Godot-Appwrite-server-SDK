## createToken
Exchange an OAuth2 authorization code, refresh token, or device code for access and refresh tokens.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_session('') # The user session to authenticate with
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.oauth2.create_token(
        '<GRANT_TYPE>',
        '<CODE>', # optional
        '<REFRESH_TOKEN>', # optional
        '<DEVICE_CODE>', # optional
        '<CLIENT_ID>', # optional
        '<CLIENT_SECRET>', # optional
        '<CODE_VERIFIER>', # optional
        'https://example.com', # optional
        "" # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteOauth2Token:
        print(result.to_dict())
```
---