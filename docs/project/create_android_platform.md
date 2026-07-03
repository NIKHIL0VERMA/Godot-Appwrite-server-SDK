## createAndroidPlatform
Create a new Android platform for your project. Use this endpoint to register a new Android platform where your users will run your application which will interact with the Appwrite API.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.project.create_android_platform(
        '<PLATFORM_ID>',
        '<NAME>',
        '<APPLICATION_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwritePlatformAndroid:
        print(result.to_dict())
```
---