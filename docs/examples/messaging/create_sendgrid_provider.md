Create a new Sendgrid provider.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.messaging.create_sendgrid_provider(
        '<PROVIDER_ID>',
        '<NAME>',
        '<API_KEY>', # optional
        '<FROM_NAME>', # optional
        'email@example.com', # optional
        '<REPLY_TO_NAME>', # optional
        'email@example.com', # optional
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteProvider:
        print(result.to_dict())
```