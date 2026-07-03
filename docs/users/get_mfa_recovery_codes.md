## getMFARecoveryCodes
Get recovery codes that can be used as backup for MFA flow by User ID. Before getting codes, they must be generated using [createMfaRecoveryCodes](/docs/references/cloud/client-web/account#createMfaRecoveryCodes) method.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.users.get_mfa_recovery_codes(
        '<USER_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteMfaRecoveryCodes:
        print(result.to_dict())
```
---