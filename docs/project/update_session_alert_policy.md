## updateSessionAlertPolicy
Updating this policy allows you to control if email alert is sent upon session creation. When enabled, and user signs into their account, they will be sent an email notification. There is an exception, the first session after a new sign up does not trigger an alert, even if the policy is enabled.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.project.update_session_alert_policy(
        false
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteProject:
        print(result.to_dict())
```
---