Get the registration price for a domain name.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.domains.get_price(
        "",
        0, # optional
        'new' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDomainPrice:
        print(result.to_dict())
```