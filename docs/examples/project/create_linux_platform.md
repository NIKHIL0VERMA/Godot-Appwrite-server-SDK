Create a new Linux platform for your project. Use this endpoint to register a new Linux platform where your users will run your application which will interact with the Appwrite API.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.project.create_linux_platform(
        '<PLATFORM_ID>',
        '<NAME>',
        '<PACKAGE_NAME>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwritePlatformLinux:
        print(result.to_dict())
```