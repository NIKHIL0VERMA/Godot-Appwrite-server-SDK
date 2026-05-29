Update the team&#039;s preferences by its unique ID. The object you pass is stored as is and replaces any previous value. The maximum allowed prefs size is 64kB and throws an error if exceeded.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.teams.update_prefs(
        '<TEAM_ID>',
        {}
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwritePreferences:
        print(result.to_dict())
```