Update an existing AAAA record for the given domain. This endpoint allows you to modify
the properties of an existing AAAA record, including its name (subdomain), IPv6 address,
TTL, and optional comment.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.domains.update_record_aaaa(
        '<DOMAIN_ID>',
        '<RECORD_ID>',
        '<NAME>',
        "",
        1,
        '<COMMENT>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDnsRecord:
        print(result.to_dict())
```