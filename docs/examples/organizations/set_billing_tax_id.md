Set an organization&#039;s billing tax ID.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.organizations.set_billing_tax_id(
        '<ORGANIZATION_ID>',
        '<TAX_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteOrganization:
        print(result.to_dict())
```