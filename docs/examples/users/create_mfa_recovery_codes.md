Generate recovery codes used as backup for MFA flow for User ID. Recovery codes can be used as a MFA verification type in [createMfaChallenge](/docs/references/cloud/client-web/account#createMfaChallenge) method by client SDK.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.users.create_mfa_recovery_codes(
        '<USER_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteMfaRecoveryCodes:
        print(result.to_dict())
```