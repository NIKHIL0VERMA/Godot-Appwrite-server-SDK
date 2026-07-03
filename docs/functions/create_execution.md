## createExecution
Trigger a function execution. The returned object will return you the current execution status. You can ping the `Get Execution` endpoint to get updates on the current execution status. Once this endpoint is called, your function execution process will start asynchronously.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_session('') # The user session to authenticate with

    var result = await Appwrite.functions.create_execution(
        '<FUNCTION_ID>',
        '<BODY>', # optional
        false, # optional
        '<PATH>', # optional
        Appwrite.ExecutionMethod.GET, # optional
        {}, # optional
        '<SCHEDULED_AT>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteExecution:
        print(result.to_dict())
```
---