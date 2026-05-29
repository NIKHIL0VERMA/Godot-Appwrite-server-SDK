Get a migration by its unique ID. This endpoint returns detailed information about a specific migration including its current status, progress, and any errors that occurred during the migration process. 
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.migrations.xget(
        '<MIGRATION_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteMigration:
        print(result.to_dict())
```