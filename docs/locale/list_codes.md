## listCodes
List of all locale codes in [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes).

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_session('') # The user session to authenticate with

    var result = await Appwrite.locale.list_codes(
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteLocaleCodeList:
        print(result.to_dict())
```
---