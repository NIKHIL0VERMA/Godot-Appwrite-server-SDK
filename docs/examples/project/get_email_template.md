Get a custom email template for the specified locale and type. This endpoint returns the template content, subject, and other configuration details.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.project.get_email_template(
        'verification',
        'af' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteEmailTemplate:
        print(result.to_dict())
```