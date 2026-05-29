Initiate a domain transfer-out by generating an authorization code for the specified domain. The returned `authCode` should be provided to the gaining provider to complete the transfer. If the domain has auto-renewal enabled, it will be automatically disabled as part of this operation.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.domains.create_transfer_out(
        '<DOMAIN_ID>',
        '<ORGANIZATION_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDomainTransferOut:
        print(result.to_dict())
```