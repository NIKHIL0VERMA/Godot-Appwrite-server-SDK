## get
Get a team by its ID. All team members have read access for this resource.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_session('') # The user session to authenticate with

    var result = await Appwrite.teams.xget(
        '<TEAM_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteTeam:
        print(result.to_dict())
```
---