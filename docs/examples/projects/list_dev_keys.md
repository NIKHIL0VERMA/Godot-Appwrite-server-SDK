List all the project\&#039;s dev keys. Dev keys are project specific and allow you to bypass rate limits and get better error logging during development.&#039;
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.projects.list_dev_keys(
        '<PROJECT_ID>',
        [] # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDevKeyList:
        print(result.to_dict())
```