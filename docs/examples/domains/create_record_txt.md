Create a new TXT record for the given domain. TXT records can be used 
to provide additional information about your domain, such as domain 
verification records, SPF records, or DKIM records.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.domains.create_record_txt(
        '<DOMAIN_ID>',
        '<NAME>',
        1,
        '<VALUE>', # optional
        '<COMMENT>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDnsRecord:
        print(result.to_dict())
```