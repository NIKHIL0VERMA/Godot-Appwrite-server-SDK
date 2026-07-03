## getSecret
Get an application client secret by its unique ID.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_session('') # The user session to authenticate with

    var result = await Appwrite.apps.get_secret(
        '<APP_ID>',
        '<SECRET_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteAppSecret:
        print(result.to_dict())
```
---