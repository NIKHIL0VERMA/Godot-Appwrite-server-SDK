## createTemplateDeployment
Create a deployment based on a template.

Use this endpoint with combination of [listTemplates](https://appwrite.io/docs/products/sites/templates) to find the template details.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.sites.create_template_deployment(
        '<SITE_ID>',
        '<REPOSITORY>',
        '<OWNER>',
        '<ROOT_DIRECTORY>',
        Appwrite.TemplateReferenceType.BRANCH,
        '<REFERENCE>',
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDeployment:
        print(result.to_dict())
```
---