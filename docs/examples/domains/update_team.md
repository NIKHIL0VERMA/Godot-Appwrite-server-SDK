Update the team ID for a specific domain. This endpoint requires admin access.
    
Updating the team ID will transfer ownership and access control of the domain
and all its DNS records to the new team.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.domains.update_team(
        '<DOMAIN_ID>',
        '<TEAM_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDomain:
        print(result.to_dict())
```