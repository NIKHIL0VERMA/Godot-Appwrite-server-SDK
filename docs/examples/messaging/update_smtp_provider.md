Update a SMTP provider by its unique ID.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.messaging.update_smtp_provider(
        '<PROVIDER_ID>',
        '<NAME>', # optional
        '<HOST>', # optional
        1, # optional
        '<USERNAME>', # optional
        '<PASSWORD>', # optional
        'none', # optional
        false, # optional
        '<MAILER>', # optional
        '<FROM_NAME>', # optional
        'email@example.com', # optional
        '<REPLY_TO_NAME>', # optional
        '<REPLY_TO_EMAIL>', # optional
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteProvider:
        print(result.to_dict())
```