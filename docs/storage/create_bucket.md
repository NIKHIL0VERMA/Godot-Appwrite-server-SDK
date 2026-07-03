## createBucket
Create a new storage bucket.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.storage.create_bucket(
        '<BUCKET_ID>',
        '<NAME>',
        ["read("any")"], # optional
        false, # optional
        false, # optional
        1, # optional
        [], # optional
        Appwrite.Compression.NONE, # optional
        false, # optional
        false, # optional
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteBucket:
        print(result.to_dict())
```
---