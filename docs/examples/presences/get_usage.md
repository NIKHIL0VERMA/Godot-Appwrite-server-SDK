Get presence usage metrics, including the current total of online users and historical online user counts for the selected time range.

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.presences.get_usage(
        '24h' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteUsagePresence:
        print(result.to_dict())
```