## updateSessionDurationPolicy
Update maximum duration how long sessions created within a project should stay active for.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.project.update_session_duration_policy(
        5
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteProject:
        print(result.to_dict())
```
---