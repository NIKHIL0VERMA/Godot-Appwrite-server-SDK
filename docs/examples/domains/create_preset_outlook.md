Add Outlook DNS records to the domain. This will create the required MX records
for setting up Outlook email hosting for your domain.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.domains.create_preset_outlook(
        '<DOMAIN_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDnsRecordsList:
        print(result.to_dict())
```