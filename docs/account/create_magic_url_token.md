## createMagicURLToken
Sends the user an email with a secret key for creating a session. If the provided user ID has not been registered, a new user will be created. When the user clicks the link in the email, the user is redirected back to the URL you provided with the secret key and userId values attached to the URL query string. Use the query string parameters to submit a request to the [POST /v1/account/sessions/token](https://appwrite.io/docs/references/cloud/client-web/account#createSession) endpoint to complete the login process. The link sent to the user&#039;s email address is valid for 1 hour.

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

    var result = await Appwrite.account.create_magic_url_token(
        '<USER_ID>',
        'email@example.com',
        'https://example.com', # optional
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteToken:
        print(result.to_dict())
```
---