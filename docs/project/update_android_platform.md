## updateAndroidPlatform
Update an Android platform by its unique ID. Use this endpoint to update the platform&#039;s name or application ID.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.project.update_android_platform(
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