Initiate payment for failed invoice to pay live from console
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.organizations.create_invoice_payment(
        '<ORGANIZATION_ID>',
        '<INVOICE_ID>',
        '<PAYMENT_METHOD_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteInvoice:
        print(result.to_dict())
```