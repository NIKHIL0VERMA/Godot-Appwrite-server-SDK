Check the Appwrite database servers are up and connection is successful.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.health.get_db(
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteHealthStatusList:
        print(result.to_dict())
```