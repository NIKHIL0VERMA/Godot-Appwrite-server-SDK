## updateLabels
Update the user labels by its unique ID. 

Labels can be used to grant access to resources. While teams are a way for user&#039;s to share access to a resource, labels can be defined by the developer to grant access without an invitation. See the [Permissions docs](https://appwrite.io/docs/permissions) for more info.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.users.update_labels(
        '<USER_ID>',
        []
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteUser:
        print(result.to_dict())
```
---