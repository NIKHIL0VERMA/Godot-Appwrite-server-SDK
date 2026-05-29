Create a new CNAME record for the given domain.
    
A CNAME record maps a subdomain to another domain name, allowing you to create aliases 
for your domain. For example, you can create a CNAME record to point &#039;blog.example.com&#039; 
to &#039;example.wordpress.com&#039;.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.domains.create_record_cname(
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