Get usage metrics for a dedicated database including CPU, memory, storage, connections, and query statistics.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.compute.get_database_usage(
        '<DATABASE_ID>',
        '24h' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDedicatedDatabaseUsage:
        print(result.to_dict())
```