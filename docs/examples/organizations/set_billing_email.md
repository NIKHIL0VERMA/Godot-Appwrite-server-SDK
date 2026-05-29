Set the current billing email for the organization.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.organizations.set_billing_email(
        '<ORGANIZATION_ID>',
        'email@example.com'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteOrganization:
        print(result.to_dict())
```