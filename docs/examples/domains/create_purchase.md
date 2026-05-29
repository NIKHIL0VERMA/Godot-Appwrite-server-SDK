Initiate a domain purchase by providing registrant details and a payment method. Authorizes the payment and returns a `clientSecret`. If 3D Secure is required, use the `clientSecret` on the client to complete the authentication challenge. Once authentication is complete (or if none is needed), call the Update Purchase endpoint to capture the payment and finalize the purchase.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.domains.create_purchase(
        "",
        '<ORGANIZATION_ID>',
        '<FIRST_NAME>',
        '<LAST_NAME>',
        'email@example.com',
        '+12065550100',
        '<BILLING_ADDRESS_ID>',
        '<PAYMENT_METHOD_ID>',
        '<ADDRESS_LINE3>', # optional
        '<COMPANY_NAME>', # optional
        1, # optional
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDomainPurchase:
        print(result.to_dict())
```