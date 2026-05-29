Submit feedback about downgrading from a paid plan to a lower tier. This helps the team understand user experience and improve the platform.

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.organizations.create_downgrade_feedback(
        '<ORGANIZATION_ID>',
        '<REASON>',
        '<MESSAGE>',
        '<FROM_PLAN_ID>',
        '<TO_PLAN_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDowngradeFeedback:
        print(result.to_dict())
```