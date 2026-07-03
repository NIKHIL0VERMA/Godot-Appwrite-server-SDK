## updateSMTP
Update the SMTP configuration for your project. Use this endpoint to configure your project&#039;s SMTP provider with your custom settings for sending transactional emails.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.project.update_smtp(
        "", # optional
        0, # optional
        '<USERNAME>', # optional
        'password', # optional
        'email@example.com', # optional
        '<SENDER_NAME>', # optional
        'email@example.com', # optional
        '<REPLY_TO_NAME>', # optional
        Appwrite.ProjectSMTPSecure.TLS, # optional
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteProject:
        print(result.to_dict())
```
---