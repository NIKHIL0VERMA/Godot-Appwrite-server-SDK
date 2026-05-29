Update a push notification by its unique ID. This endpoint only works on messages that are in draft status. Messages that are already processing, sent, or failed cannot be updated.

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.messaging.update_push(
        '<MESSAGE_ID>',
        [], # optional
        [], # optional
        [], # optional
        '<TITLE>', # optional
        '<BODY>', # optional
        {}, # optional
        '<ACTION>', # optional
        '<ID1:ID2>', # optional
        '<ICON>', # optional
        '<SOUND>', # optional
        '<COLOR>', # optional
        '<TAG>', # optional
        0, # optional
        false, # optional
        '2020-10-15T06:38:00.000+00:00', # optional
        false, # optional
        false, # optional
        'normal' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteMessage:
        print(result.to_dict())
```