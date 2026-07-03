## createPolicy
Create a new backup policy.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.backups.create_policy(
        '<POLICY_ID>',
        Appwrite.[BackupServices.DATABASES],
        1,
        "",
        '<NAME>', # optional
        '<RESOURCE_ID>', # optional
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteBackupPolicy:
        print(result.to_dict())
```
---