Get a project\&#039;s dev key by its unique ID. Dev keys are project specific and allow you to bypass rate limits and get better error logging during development.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.projects.get_dev_key(
        '<PROJECT_ID>',
        '<KEY_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDevKey:
        print(result.to_dict())
```