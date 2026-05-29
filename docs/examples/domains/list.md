List all domains registered for this project. This endpoint supports pagination.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.domains.list(
        [], # optional
        '<SEARCH>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDomainsList:
        print(result.to_dict())
```