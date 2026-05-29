Update the function active deployment. Use this endpoint to switch the code deployment that should be used when visitor opens your function.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.functions.update_function_deployment(
        '<FUNCTION_ID>',
        '<DEPLOYMENT_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteFunction:
        print(result.to_dict())
```