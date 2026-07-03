## update
Update a token by its unique ID. Use this endpoint to update a token&#039;s expiry date.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.tokens.update(
        '<TOKEN_ID>',
        '2020-10-15T06:38:00.000+00:00' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteResourceToken:
        print(result.to_dict())
```
---