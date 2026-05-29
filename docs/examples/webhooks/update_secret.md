Update the webhook signing key. This endpoint can be used to regenerate the signing key used to sign and validate payload deliveries for a specific webhook.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.webhooks.update_secret(
        '<WEBHOOK_ID>',
        '<SECRET>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteWebhook:
        print(result.to_dict())
```