## listMemberships
Use this endpoint to list a team&#039;s members using the team&#039;s ID. All team members have read access to this endpoint. Hide sensitive attributes from the response by toggling membership privacy in the Console.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_session('') # The user session to authenticate with

    var result = await Appwrite.teams.list_memberships(
        '<TEAM_ID>',
        [], # optional
        '<SEARCH>', # optional
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteMembershipList:
        print(result.to_dict())
```
---