Update a project\&#039;s dev key by its unique ID. Use this endpoint to update a project\&#039;s dev key name or expiration time.&#039;
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.projects.update_dev_key(
        '<PROJECT_ID>',
        '<KEY_ID>',
        '<NAME>',
        '2020-10-15T06:38:00.000+00:00'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDevKey:
        print(result.to_dict())
```