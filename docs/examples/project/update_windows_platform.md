Update a Windows platform by its unique ID. Use this endpoint to update the platform&#039;s name or package identifier name.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.project.update_windows_platform(
        '<PLATFORM_ID>',
        '<NAME>',
        '<PACKAGE_IDENTIFIER_NAME>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwritePlatformWindows:
        print(result.to_dict())
```