Create a manual backup of a dedicated database. The backup will be created asynchronously and its status can be checked via the get backup endpoint.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.compute.create_database_backup(
        '<DATABASE_ID>',
        'full' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDedicatedDatabaseBackup:
        print(result.to_dict())
```