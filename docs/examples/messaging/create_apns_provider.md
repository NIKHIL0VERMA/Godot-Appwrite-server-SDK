Create a new Apple Push Notification service provider.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.messaging.create_apns_provider(
        '<PROVIDER_ID>',
        '<NAME>',
        '<AUTH_KEY>', # optional
        '<AUTH_KEY_ID>', # optional
        '<TEAM_ID>', # optional
        '<BUNDLE_ID>', # optional
        false, # optional
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteProvider:
        print(result.to_dict())
```