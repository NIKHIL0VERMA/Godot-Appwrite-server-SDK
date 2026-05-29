List available function templates. You can use template details in [createFunction](/docs/references/cloud/server-nodejs/functions#create) method.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.functions.list_templates(
        [], # optional
        [], # optional
        1, # optional
        0, # optional
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteTemplateFunctionList:
        print(result.to_dict())
```