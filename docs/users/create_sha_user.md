## createSHAUser
Create a new user. Password provided must be hashed with the [SHA](https://en.wikipedia.org/wiki/Secure_Hash_Algorithm) algorithm. Use the [POST /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to create users with a plain text password.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.users.create_sha_user(
        '<USER_ID>',
        'email@example.com',
        'password',
        Appwrite.PasswordHash.SHA1, # optional
        '<NAME>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteUser:
        print(result.to_dict())
```
---