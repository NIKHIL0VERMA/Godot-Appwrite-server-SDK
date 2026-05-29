Create a new SRV record for the given domain. SRV records are used to define the location 
of servers for specific services. For example, they can be used to specify which server 
handles a specific service like SIP or XMPP for the domain.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.domains.create_record_srv(
        '<DOMAIN_ID>',
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