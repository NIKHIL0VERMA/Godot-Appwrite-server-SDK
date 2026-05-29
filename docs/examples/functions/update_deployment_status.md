Cancel an ongoing function deployment build. If the build is already in progress, it will be stopped and marked as canceled. If the build hasn&#039;t started yet, it will be marked as canceled without executing. You cannot cancel builds that have already completed (status &#039;ready&#039;) or failed. The response includes the final build status and details.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.functions.update_deployment_status(
        '<FUNCTION_ID>',
        '<DEPLOYMENT_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDeployment:
        print(result.to_dict())
```