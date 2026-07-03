## createToken
Returns a token with a secret key for creating a session. Use the user ID and secret and submit a request to the [PUT /account/sessions/token](https://appwrite.io/docs/references/cloud/client-web/account#createSession) endpoint to complete the login process.


---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.users.create_token(
        '<USER_ID>',
        4, # optional
        60 # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteToken:
        print(result.to_dict())
```
---