Create a new mock phone for your project. Use this endpoint to register a mock phone number and its sign-in OTP for your testers.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.project.create_mock_phone(
        '+12065550100',
        '<OTP>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteMockNumber:
        print(result.to_dict())
```