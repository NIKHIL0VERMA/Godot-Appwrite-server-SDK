## updateMembershipStatus
Use this endpoint to allow a user to accept an invitation to join a team after being redirected back to your app from the invitation email received by the user.

If the request is successful, a session for the user is automatically created.


---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_session('') # The user session to authenticate with

    var result = await Appwrite.teams.update_membership_status(
        '<TEAM_ID>',
        '<MEMBERSHIP_ID>',
        '<USER_ID>',
        '<SECRET>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteMembership:
        print(result.to_dict())
```
---