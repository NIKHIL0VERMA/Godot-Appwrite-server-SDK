## listOAuth2Providers
Get a list of all OAuth2 providers supported by the server, along with the project&#039;s configuration for each. Credential fields are write-only and always returned empty.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.project.list_o_auth2_providers(
        [], # optional
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteOAuth2ProviderList:
        print(result.to_dict())
```
---