## delete
Delete a message. If the message is not a draft or scheduled, but has been sent, this will not recall the message.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.messaging.delete(
        '<MESSAGE_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is Variant:
        print(result.to_dict())
```
---