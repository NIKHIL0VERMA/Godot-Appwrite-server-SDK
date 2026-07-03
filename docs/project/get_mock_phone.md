## getMockPhone
Get a mock phone by its unique number. This endpoint returns the mock phone&#039;s OTP.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.project.get_mock_phone(
        '+12065550100'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteMockNumber:
        print(result.to_dict())
```
---