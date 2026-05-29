Update the connection pooler configuration for a dedicated database. Configure pool mode, max connections, and pool sizes.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.compute.update_database_pooler(
        '<DATABASE_ID>',
        'transaction', # optional
        10, # optional
        1, # optional
        false, # optional
        '<POOLER_CPU_REQUEST>', # optional
        '<POOLER_CPU_LIMIT>', # optional
        '<POOLER_MEMORY_REQUEST>', # optional
        '<POOLER_MEMORY_LIMIT>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDedicatedDatabasePooler:
        print(result.to_dict())
```