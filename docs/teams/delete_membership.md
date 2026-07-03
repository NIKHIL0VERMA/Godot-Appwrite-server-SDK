## deleteMembership
This endpoint allows a user to leave a team or for a team owner to delete the membership of any other team member. You can also use this endpoint to delete a user membership even if it is not accepted.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_session('') # The user session to authenticate with

    var result = await Appwrite.teams.delete_membership(
        '<TEAM_ID>',
        '<MEMBERSHIP_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is Variant:
        print(result.to_dict())
```
---