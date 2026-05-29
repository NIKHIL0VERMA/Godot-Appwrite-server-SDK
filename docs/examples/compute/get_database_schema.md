Get the current schema for a dedicated database. Returns collections, fields, data types, constraints, and indexes.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.compute.get_database_schema(
        '<DATABASE_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDedicatedDatabaseSchema:
        print(result.to_dict())
```