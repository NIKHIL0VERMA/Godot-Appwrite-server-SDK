Update a Twilio provider by its unique ID.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.messaging.update_twilio_provider(
        '<PROVIDER_ID>',
        '<NAME>', # optional
        false, # optional
        '<ACCOUNT_SID>', # optional
        '<AUTH_TOKEN>', # optional
        '<FROM>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteProvider:
        print(result.to_dict())
```