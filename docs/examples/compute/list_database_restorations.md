List all restorations for a dedicated database. Results can be filtered by status and type.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.compute.list_database_restorations(
        '<DATABASE_ID>',
        'pending', # optional
        'backup', # optional
        1, # optional
        0 # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDedicatedDatabaseRestorationList:
        print(result.to_dict())
```