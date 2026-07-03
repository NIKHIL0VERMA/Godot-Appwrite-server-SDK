## updateEmail
Update an email message by its unique ID. This endpoint only works on messages that are in draft status. Messages that are already processing, sent, or failed cannot be updated.


---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.messaging.update_email(
        '<MESSAGE_ID>',
        [], # optional
        [], # optional
        [], # optional
        '<SUBJECT>', # optional
        '<CONTENT>', # optional
        false, # optional
        false, # optional
        [], # optional
        [], # optional
        '2020-10-15T06:38:00.000+00:00', # optional
        [] # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteMessage:
        print(result.to_dict())
```
---