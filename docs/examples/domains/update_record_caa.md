Update an existing CAA record for the given domain. A CAA (Certification Authority Authorization) 
record is used to specify which certificate authorities (CAs) are authorized to issue certificates 
for a domain.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.domains.update_record_caa(
        '<DOMAIN_ID>',
        '<RECORD_ID>',
        "",
        "",
        1,
        '<COMMENT>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDnsRecord:
        print(result.to_dict())
```