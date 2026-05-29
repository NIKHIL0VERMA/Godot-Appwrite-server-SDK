Create a new AAAA record for the given domain. This endpoint allows you to add a new IPv6 DNS record 
to your domain. The record will be used to point a hostname to an IPv6 address.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.domains.create_record_aaaa(
        '<DOMAIN_ID>',
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