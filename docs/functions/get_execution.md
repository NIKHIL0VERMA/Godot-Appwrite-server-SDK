## getExecution
Get a function execution log by its unique ID.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_session('') # The user session to authenticate with

    var result = await Appwrite.functions.get_execution(
        '<FUNCTION_ID>',
        '<EXECUTION_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteExecution:
        print(result.to_dict())
```
---