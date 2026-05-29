Update a dedicated database configuration. All changes are applied with zero downtime. Resource changes (cpu, memory) are handled via rolling cutover. Storage expansion is done online. All other settings are applied in-place.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.compute.update_database(
        '<DATABASE_ID>',
        '<NAME>', # optional
        'ready', # optional
        '<SPECIFICATION>', # optional
        125, # optional
        128, # optional
        1, # optional
        'ssd', # optional
        false, # optional
        0, # optional
        10, # optional
        60, # optional
        [], # optional
        5, # optional
        false, # optional
        false, # optional
        "", # optional
        1, # optional
        1, # optional
        false, # optional
        50, # optional
        0, # optional
        false, # optional
        false, # optional
        0.0, # optional
        0, # optional
        false, # optional
        [], # optional
        1, # optional
        1024, # optional
        1 # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDedicatedDatabase:
        print(result.to_dict())
```