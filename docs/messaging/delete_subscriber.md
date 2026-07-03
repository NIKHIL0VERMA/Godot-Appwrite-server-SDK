## deleteSubscriber
Delete a subscriber by its unique ID.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_jwt('<YOUR_JWT>') # Your secret JSON Web Token

    var result = await Appwrite.messaging.delete_subscriber(
        '<TOPIC_ID>',
        '<SUBSCRIBER_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is Variant:
        print(result.to_dict())
```
---