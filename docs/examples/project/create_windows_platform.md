Create a new Windows platform for your project. Use this endpoint to register a new Windows platform where your users will run your application which will interact with the Appwrite API.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.project.create_windows_platform(
        '<PLATFORM_ID>',
        '<NAME>',
        '<PACKAGE_IDENTIFIER_NAME>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwritePlatformWindows:
        print(result.to_dict())
```