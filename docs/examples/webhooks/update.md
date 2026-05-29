Update a webhook by its unique ID. Use this endpoint to update the URL, events, or status of an existing webhook.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.webhooks.update(
        '<WEBHOOK_ID>',
        '<NAME>',
        "",
        [],
        false, # optional
        false, # optional
        '<AUTH_USERNAME>', # optional
        '<AUTH_PASSWORD>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteWebhook:
        print(result.to_dict())
```