Upgrade a dedicated database to a new engine version. Uses blue-green deployment for zero-downtime cutover.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.compute.create_database_upgrade(
        '<DATABASE_ID>',
        '<TARGET_VERSION>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDedicatedDatabase:
        print(result.to_dict())
```