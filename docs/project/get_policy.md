## getPolicy
Get a policy by its unique ID. This endpoint returns the current configuration for the requested project policy.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.project.get_policy(
        Appwrite.ProjectPolicyId.PASSWORD_DICTIONARY
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwritePolicyPasswordDictionary:
        print(result.to_dict())
```
---