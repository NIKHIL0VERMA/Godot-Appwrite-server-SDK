Create a new Telesign provider.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.messaging.create_telesign_provider(
        '<PROVIDER_ID>',
        '<NAME>',
        '+12065550100', # optional
        '<CUSTOMER_ID>', # optional
        '<API_KEY>', # optional
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteProvider:
        print(result.to_dict())
```