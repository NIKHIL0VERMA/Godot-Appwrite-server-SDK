Create a new HTTPS record for the given domain. This record is used to configure HTTPS 
settings for your domain, enabling secure communication over SSL/TLS.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.domains.create_record_https(
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