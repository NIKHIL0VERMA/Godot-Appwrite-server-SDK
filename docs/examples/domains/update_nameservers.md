Verify which NS records are used and update the domain accordingly. This will check the domain&#039;s
nameservers and update the domain&#039;s status based on whether the nameservers match the expected
Appwrite nameservers.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.domains.update_nameservers(
        '<DOMAIN_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDomain:
        print(result.to_dict())
```