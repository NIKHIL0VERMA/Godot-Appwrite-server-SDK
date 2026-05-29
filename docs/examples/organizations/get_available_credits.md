Get total available valid credits for an organization.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.organizations.get_available_credits(
        '<ORGANIZATION_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteCreditAvailable:
        print(result.to_dict())
```