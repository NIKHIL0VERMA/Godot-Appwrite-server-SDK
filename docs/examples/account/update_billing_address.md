Update a specific billing address using it&#039;s ID.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.account.update_billing_address(
        '<BILLING_ADDRESS_ID>',
        '<COUNTRY>',
        '<CITY>',
        '<STREET_ADDRESS>',
        '<ADDRESS_LINE2>', # optional
        '<STATE>', # optional
        '<POSTAL_CODE>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteBillingAddress:
        print(result.to_dict())
```