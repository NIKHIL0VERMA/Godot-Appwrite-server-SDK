Get all Environment Variables that are relevant for the console.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.console.variables(
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteConsoleVariables:
        print(result.to_dict())
```