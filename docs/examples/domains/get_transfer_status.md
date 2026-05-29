Retrieve the current transfer status for a domain. Returns the status, an optional reason, and a timestamp of the last status change.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.domains.get_transfer_status(
        '<DOMAIN_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDomainTransferStatus:
        print(result.to_dict())
```