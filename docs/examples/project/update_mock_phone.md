Update a mock phone by its unique number. Use this endpoint to update the mock phone&#039;s OTP.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.project.update_mock_phone(
        '+12065550100',
        '<OTP>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteMockNumber:
        print(result.to_dict())
```