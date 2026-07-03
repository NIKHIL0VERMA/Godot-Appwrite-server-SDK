## updatePrefs
Update the user preferences by its unique ID. The object you pass is stored as is, and replaces any previous value. The maximum allowed prefs size is 64kB and throws error if exceeded.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.users.update_prefs(
        '<USER_ID>',
        {}
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwritePreferences:
        print(result.to_dict())
```
---