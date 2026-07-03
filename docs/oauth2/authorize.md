## authorize
Begin the OAuth2 authorization flow. When called without a session, the user is redirected to the consent screen without grant ID. When called with a session, the redirect URL includes param for grant ID. You can pass Accept header of `application/json` to receive a JSON response instead of a redirect.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_session('') # The user session to authenticate with
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.oauth2.authorize(
        '<CLIENT_ID>',
        'https://example.com',
        'code',
        '<SCOPE>',
        '<STATE>', # optional
        '<NONCE>', # optional
        '<CODE_CHALLENGE>', # optional
        's256', # optional
        '<PROMPT>', # optional
        0, # optional
        '<AUTHORIZATION_DETAILS>', # optional
        "" # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteOauth2Authorize:
        print(result.to_dict())
```
---