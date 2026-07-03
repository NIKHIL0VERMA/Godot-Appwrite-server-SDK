## getQueueUsage
Get the number of metrics that are waiting to be processed in the Appwrite internal queue server.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.health.get_queue_usage(
        0 # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteHealthQueue:
        print(result.to_dict())
```
---