## updateRuleStatus
If not succeeded yet, retry verification process of a proxy rule domain. This endpoint triggers domain verification by checking DNS records. If verification is successful, a TLS certificate will be automatically provisioned for the domain asynchronously in the background.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.proxy.update_rule_status(
        '<RULE_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteProxyRule:
        print(result.to_dict())
```
---