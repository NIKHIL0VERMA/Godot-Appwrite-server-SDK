## createJWT
Use this endpoint to create a JSON Web Token for user by its unique ID. You can use the resulting JWT to authenticate on behalf of the user. The JWT secret will become invalid if the session it uses gets deleted.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.users.create_jwt(
        '<USER_ID>',
        '<SESSION_ID>', # optional
        0 # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteJwt:
        print(result.to_dict())
```
---