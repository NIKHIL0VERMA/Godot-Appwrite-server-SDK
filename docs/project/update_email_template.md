## updateEmailTemplate
Update a custom email template for the specified locale and type. Use this endpoint to modify the content of your email templates.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.project.update_email_template(
        Appwrite.ProjectEmailTemplateId.VERIFICATION,
        Appwrite.ProjectEmailTemplateLocale.AF, # optional
        '<SUBJECT>', # optional
        '<MESSAGE>', # optional
        '<SENDER_NAME>', # optional
        'email@example.com', # optional
        'email@example.com', # optional
        '<REPLY_TO_NAME>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteEmailTemplate:
        print(result.to_dict())
```
---