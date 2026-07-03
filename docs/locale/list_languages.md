## listLanguages
List of all languages classified by ISO 639-1 including 2-letter code, name in English, and name in the respective language.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_session('') # The user session to authenticate with

    var result = await Appwrite.locale.list_languages(
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteLanguageList:
        print(result.to_dict())
```
---