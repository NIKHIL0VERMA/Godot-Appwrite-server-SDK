Migrate a database between shared and dedicated types. Shared to dedicated creates an always-on StatefulSet with external access. Dedicated to shared converts to a serverless pod that scales to zero when idle. Data is preserved during migration.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.compute.create_database_migration(
        '<DATABASE_ID>',
        'shared'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDedicatedDatabase:
        print(result.to_dict())
```