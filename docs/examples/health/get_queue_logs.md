Get the number of logs that are waiting to be processed in the Appwrite internal queue server.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.health.get_queue_logs(
        0 # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteHealthQueue:
        print(result.to_dict())
```