Preview a schema change against a dedicated database. Returns the expected impact including affected collections, records, and a dry-run diff of the schema before and after the change.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.compute.create_database_schema_preview(
        '<DATABASE_ID>',
        '<SQL>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDedicatedDatabaseSchemaPreview:
        print(result.to_dict())
```