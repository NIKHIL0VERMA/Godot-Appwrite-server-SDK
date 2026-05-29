Modify the roles of a team member. Only team members with the owner role have access to this endpoint. Learn more about [roles and permissions](https://appwrite.io/docs/permissions).

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.teams.update_membership(
        '<TEAM_ID>',
        '<MEMBERSHIP_ID>',
        []
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteMembership:
        print(result.to_dict())
```