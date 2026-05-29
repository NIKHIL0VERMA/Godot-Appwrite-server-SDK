Get a single DNS record for a given domain by record ID.
    
This endpoint allows you to retrieve a specific DNS record associated with a domain
using its unique identifier. The record contains information about the DNS configuration
such as type, value, and TTL settings.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.domains.get_record(
        '<DOMAIN_ID>',
        '<RECORD_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDnsRecord:
        print(result.to_dict())
```