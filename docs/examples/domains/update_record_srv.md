Update an existing SRV record for the given domain.
    
Required parameters:
- domainId: Domain unique ID
- recordId: DNS record unique ID
- name: Record name (service name)
- value: Target hostname for this SRV record
- ttl: Time to live, in seconds
- priority: Record priority
- weight: Record weight
- port: Port number for the service
    
Optional parameters:
- comment: A comment for this record
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.domains.update_record_srv(
        '<DOMAIN_ID>',
        '<RECORD_ID>',
        '<NAME>',
        '<VALUE>',
        1,
        0,
        0,
        0,
        '<COMMENT>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDnsRecord:
        print(result.to_dict())
```