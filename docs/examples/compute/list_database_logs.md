List audit logs for a dedicated database. Returns DDL operations and security-relevant events.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.compute.list_database_logs(
        '<DATABASE_ID>',
        '<START_TIME>', # optional
        '<END_TIME>', # optional
        1 # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDedicatedDatabaseAuditLogList:
        print(result.to_dict())
```