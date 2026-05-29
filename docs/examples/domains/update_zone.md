Update the DNS zone for the given domain using the provided zone file content.
All parsed records are imported and then the main domain document is returned.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.domains.update_zone(
        '<DOMAIN_ID>',
        '<CONTENT>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDomain:
        print(result.to_dict())
```