Return a list of all available plans.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.console.get_plans(
        'appwrite' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteBillingPlanList:
        print(result.to_dict())
```