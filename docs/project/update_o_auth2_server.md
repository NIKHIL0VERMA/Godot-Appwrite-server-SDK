## updateOAuth2Server
Update the OAuth2 server (OIDC provider) configuration.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.project.update_o_auth2_server(
        false,
        'https://example.com',
        [], # optional
        [], # optional
        60, # optional
        60, # optional
        60, # optional
        60, # optional
        false, # optional
        'https://example.com', # optional
        6, # optional
        'numeric', # optional
        60 # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteProject:
        print(result.to_dict())
```
---