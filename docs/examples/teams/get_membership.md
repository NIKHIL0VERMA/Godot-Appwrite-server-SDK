Get a team member by the membership unique id. All team members have read access for this resource. Hide sensitive attributes from the response by toggling membership privacy in the Console.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.teams.get_membership(
        '<TEAM_ID>',
        '<MEMBERSHIP_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteMembership:
        print(result.to_dict())
```