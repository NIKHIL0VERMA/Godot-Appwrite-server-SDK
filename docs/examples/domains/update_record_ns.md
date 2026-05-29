Update an existing NS record for the given domain. This endpoint allows you to modify 
the properties of an NS (nameserver) record associated with your domain. You can update 
the record name (subdomain), target nameserver value, TTL, and add or modify comments 
for better record management.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.domains.update_record_ns(
        '<DOMAIN_ID>',
        '<RECORD_ID>',
        '<NAME>',
        '<VALUE>',
        1,
        '<COMMENT>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDnsRecord:
        print(result.to_dict())
```