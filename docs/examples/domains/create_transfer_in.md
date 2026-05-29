Initiate a domain transfer-in by providing an authorization code, registrant details, and a payment method. Authorizes the payment and returns a `clientSecret`. If 3D Secure is required, use the `clientSecret` on the client to complete the authentication challenge. Once authentication is complete (or if none is needed), call the Update Transfer In endpoint to capture the payment and submit the transfer.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.domains.create_transfer_in(
        "",
        '<ORGANIZATION_ID>',
        '<AUTH_CODE>',
        '<PAYMENT_METHOD_ID>',
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDomainPurchase:
        print(result.to_dict())
```