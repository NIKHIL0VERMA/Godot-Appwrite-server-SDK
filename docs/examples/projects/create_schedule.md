Create a new schedule for a resource.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.projects.create_schedule(
        '<PROJECT_ID>',
        'function',
        '<RESOURCE_ID>',
        "",
        false, # optional
        {} # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteSchedule:
        print(result.to_dict())
```