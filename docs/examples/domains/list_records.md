List DNS records for a given domain. You can use this endpoint to list all the DNS records
associated with your domain.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.domains.list_records(
        '<DOMAIN_ID>',
        [] # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDnsRecordsList:
        print(result.to_dict())
```