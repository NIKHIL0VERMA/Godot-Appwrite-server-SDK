Update an existing ALIAS record for the specified domain. This endpoint allows you to modify
the properties of an existing ALIAS record including its name, target domain, TTL, and comment.
    
The ALIAS record type is similar to a CNAME record but can be used at the zone apex (root domain).
It provides a way to map one domain name to another.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.domains.update_record_alias(
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