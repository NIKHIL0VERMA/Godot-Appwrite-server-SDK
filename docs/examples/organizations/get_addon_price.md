Get the price details for a billing addon for an organization.

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.organizations.get_addon_price(
        '<ORGANIZATION_ID>',
        'baa'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteAddonPrice:
        print(result.to_dict())
```