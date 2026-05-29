Get an organization&#039;s payment method using it&#039;s payment method ID.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.organizations.get_payment_method(
        '<ORGANIZATION_ID>',
        '<PAYMENT_METHOD_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwritePaymentMethod:
        print(result.to_dict())
```