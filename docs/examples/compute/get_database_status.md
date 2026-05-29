Get real-time health and status information for a dedicated database. Returns health status, readiness, uptime, connection info, replica status, and volume information.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.compute.get_database_status(
        '<DATABASE_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDatabaseStatus:
        print(result.to_dict())
```