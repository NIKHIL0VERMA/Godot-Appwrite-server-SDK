## createMFAAuthenticator
Add an authenticator app to be used as an MFA factor. Verify the authenticator using the [verify authenticator](/docs/references/cloud/client-web/account#updateMfaAuthenticator) method.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_session('') # The user session to authenticate with

    var result = await Appwrite.account.create_mfa_authenticator(
        Appwrite.AuthenticatorType.TOTP
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteMfaType:
        print(result.to_dict())
```
---