## createDeviceAuthorization
Start the OAuth2 Device Authorization Grant. Returns the device code, user code, verification URL, expiration, and polling interval.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_session('') # The user session to authenticate with
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.oauth2.create_device_authorization(
        '<CLIENT_ID>', # optional
        '<SCOPE>', # optional
        '<AUTHORIZATION_DETAILS>', # optional
        "" # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteOauth2DeviceAuthorization:
        print(result.to_dict())
```
---