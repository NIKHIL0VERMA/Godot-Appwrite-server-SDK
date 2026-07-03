## createSubscriber
Create a new subscriber.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_jwt('<YOUR_JWT>') # Your secret JSON Web Token

    var result = await Appwrite.messaging.create_subscriber(
        '<TOPIC_ID>',
        '<SUBSCRIBER_ID>',
        '<TARGET_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteSubscriber:
        print(result.to_dict())
```
---