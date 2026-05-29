Finalize a domain transfer-in initiated with Create Transfer In. Verifies that any required 3D Secure authentication is complete, submits the transfer with the authorization code, captures the payment, and sends a confirmation email. Returns a 402 error if authentication is still pending.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.domains.update_transfer_in(
        '<INVOICE_ID>',
        '<ORGANIZATION_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDomainPurchase:
        print(result.to_dict())
```