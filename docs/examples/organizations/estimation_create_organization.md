Get estimation for creating an organization.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.organizations.estimation_create_organization(
        'tier-0',
        '<PAYMENT_METHOD_ID>', # optional
        [], # optional
        '<COUPON_ID>', # optional
        'appwrite' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteEstimation:
        print(result.to_dict())
```