## getOAuth2Provider
Get a single OAuth2 provider configuration. Credential fields (client secret, p8 file, key/team IDs) are write-only and always returned empty.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.project.get_o_auth2_provider(
        Appwrite.ProjectOAuthProviderId.AMAZON
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteOAuth2Github:
        print(result.to_dict())
```
---