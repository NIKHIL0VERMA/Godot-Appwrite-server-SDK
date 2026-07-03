## create
Create a new application.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_session('') # The user session to authenticate with

    var result = await Appwrite.apps.create(
        '<APP_ID>',
        '<NAME>',
        [],
        '<DESCRIPTION>', # optional
        'https://example.com', # optional
        'https://example.com', # optional
        'https://example.com', # optional
        'https://example.com', # optional
        [], # optional
        '<TAGLINE>', # optional
        [], # optional
        [], # optional
        'https://example.com', # optional
        'https://example.com', # optional
        [], # optional
        false, # optional
        'public', # optional
        false, # optional
        '<TEAM_ID>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteApp:
        print(result.to_dict())
```
---