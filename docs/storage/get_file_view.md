## getFileView
Get a file content by its unique ID. This endpoint is similar to the download method but returns with no  &#039;Content-Disposition: attachment&#039; header.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_session('') # The user session to authenticate with

    var result = await Appwrite.storage.get_file_view(
        '<BUCKET_ID>',
        '<FILE_ID>',
        '<TOKEN>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is Variant:
        print(result.to_dict())
```
---