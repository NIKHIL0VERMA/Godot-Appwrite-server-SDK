## getDeploymentDownload
Get a function deployment content by its unique ID. The endpoint response return with a &#039;Content-Disposition: attachment&#039; header that tells the browser to start downloading the file to user downloads directory.

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.functions.get_deployment_download(
        '<FUNCTION_ID>',
        '<DEPLOYMENT_ID>',
        Appwrite.DeploymentDownloadType.SOURCE # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is Variant:
        print(result.to_dict())
```
---