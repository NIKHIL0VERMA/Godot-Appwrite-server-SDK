Update the team&#039;s name by its unique ID.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.teams.update_name(
        '<TEAM_ID>',
        '<NAME>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteTeam:
        print(result.to_dict())
```