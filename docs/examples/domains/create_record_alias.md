Create a new ALIAS record for the given domain. This record type can be used to point your domain 
to another domain name that will serve as an alias. This is particularly useful when you want to 
map your domain to a target domain that may change its IP address.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.domains.create_record_alias(
        '<DOMAIN_ID>',
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