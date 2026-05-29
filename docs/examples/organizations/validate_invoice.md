Validates the payment linked with the invoice and updates the invoice status if the payment status is changed.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.organizations.validate_invoice(
        '<ORGANIZATION_ID>',
        '<INVOICE_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteInvoice:
        print(result.to_dict())
```