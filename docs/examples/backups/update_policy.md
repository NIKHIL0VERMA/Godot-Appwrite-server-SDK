Update an existing policy using it&#039;s ID.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.backups.update_policy(
        '<POLICY_ID>',
        '<NAME>', # optional
        1, # optional
        "", # optional
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteBackupPolicy:
        print(result.to_dict())
```