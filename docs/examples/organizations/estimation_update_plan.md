Get estimation for updating the organization plan.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.organizations.estimation_update_plan(
        '<ORGANIZATION_ID>',
        'tier-0',
        [], # optional
        '<COUPON_ID>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteEstimationUpdatePlan:
        print(result.to_dict())
```