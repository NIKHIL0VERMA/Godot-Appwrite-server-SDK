Restore a database from a backup or to a specific point in time (PITR). For backup restoration, provide a backupId. For PITR, provide a targetTime. PITR requires the database to have PITR enabled and is only available for enterprise databases.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.compute.create_database_restoration(
        '<DATABASE_ID>',
        'backup', # optional
        '<BACKUP_ID>', # optional
        0 # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDedicatedDatabaseRestoration:
        print(result.to_dict())
```