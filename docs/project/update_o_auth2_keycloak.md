## updateOAuth2Keycloak
Update the project OAuth2 Keycloak configuration.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.project.update_o_auth2_keycloak(
        '<CLIENT_ID>', # optional
        '<CLIENT_SECRET>', # optional
        '<ENDPOINT>', # optional
        '<REALM_NAME>', # optional
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteOAuth2Keycloak:
        print(result.to_dict())
```
---