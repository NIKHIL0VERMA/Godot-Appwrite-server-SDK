Create or update a presence log by its user ID.

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.presences.upsert(
        '<PRESENCE_ID>',
        '<USER_ID>',
        '<STATUS>',
        ["read("any")"], # optional
        '2020-10-15T06:38:00.000+00:00', # optional
        {} # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwritePresence:
        print(result.to_dict())
```