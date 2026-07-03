## createOAuth2Token
Allow the user to login to their account using the OAuth2 provider of their choice. Each OAuth2 provider should be enabled from the Appwrite console first. Use the success and failure arguments to provide a redirect URL&#039;s back to your app when login is completed. 

If authentication succeeds, `userId` and `secret` of a token will be appended to the success URL as query parameters. These can be used to create a new session using the [Create session](https://appwrite.io/docs/references/cloud/client-web/account#createSession) endpoint.

A user is limited to 10 active sessions at a time by default. [Learn more about session limits](https://appwrite.io/docs/authentication-security#limits).

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_session('') # The user session to authenticate with

    var result = await Appwrite.account.create_o_auth2_token(
        Appwrite.OAuthProvider.AMAZON,
        'https://example.com', # optional
        'https://example.com', # optional
        [] # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is Variant:
        print(result.to_dict())
```
---