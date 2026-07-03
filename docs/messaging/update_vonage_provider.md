## updateVonageProvider
Update a Vonage provider by its unique ID.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.messaging.update_vonage_provider(
        '<PROVIDER_ID>',
        '<NAME>', # optional
        false, # optional
        '<API_KEY>', # optional
        '<API_SECRET>', # optional
        '<FROM>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteProvider:
        print(result.to_dict())
```
---