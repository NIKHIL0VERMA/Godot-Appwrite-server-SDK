Create a new MX record for the given domain. MX records are used to define the mail servers responsible 
for accepting email messages for the domain. Multiple MX records can be created with different priorities.
The priority parameter determines the order in which mail servers are used, with lower values indicating 
higher priority.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.domains.create_record_mx(
        '<DOMAIN_ID>',
        '<NAME>',
        '<VALUE>',
        1,
        0,
        '<COMMENT>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDnsRecord:
        print(result.to_dict())
```