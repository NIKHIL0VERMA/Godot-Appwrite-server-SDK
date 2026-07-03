## createMFAChallenge
Begin the process of MFA verification after sign-in. Finish the flow with [updateMfaChallenge](/docs/references/cloud/client-web/account#updateMfaChallenge) method.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_session('') # The user session to authenticate with

    var result = await Appwrite.account.create_mfa_challenge(
        Appwrite.AuthenticationFactor.EMAIL
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteMfaChallenge:
        print(result.to_dict())
```
---