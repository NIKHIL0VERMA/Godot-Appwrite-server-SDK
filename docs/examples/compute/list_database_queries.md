List slow queries for a dedicated database. Returns queries that exceeded the specified threshold.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.compute.list_database_queries(
        '<DATABASE_ID>',
        1, # optional
        0 # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDedicatedDatabaseSlowQueryList:
        print(result.to_dict())
```