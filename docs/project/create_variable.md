## createVariable
Create a new project environment variable. These variables can be accessed by all functions and sites in the project.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.project.create_variable(
        '<VARIABLE_ID>',
        '<KEY>',
        '<VALUE>',
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteVariable:
        print(result.to_dict())
```
---