Create a new proxy rule for serving Appwrite&#039;s API on custom domain.

Rule ID is automatically generated as MD5 hash of a rule domain for performance purposes.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.proxy.create_api_rule(
        ""
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteProxyRule:
        print(result.to_dict())
```