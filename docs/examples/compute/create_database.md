Create a new dedicated database with the chosen engine and configuration. Status will be &#039;provisioning&#039; until the database is ready.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.compute.create_database(
        '<DATABASE_ID>',
        '<NAME>',
        'postgres', # optional
        '17', # optional
        'fra', # optional
        'shared', # optional
        '<SPECIFICATION>', # optional
        'prisma', # optional
        125, # optional
        128, # optional
        1, # optional
        'ssd', # optional
        0, # optional
        false, # optional
        0, # optional
        'async', # optional
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
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDedicatedDatabase:
        print(result.to_dict())
```