## getInsight
Get an insight by its unique ID, scoped to its parent report.


---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.advisor.get_insight(
        '<REPORT_ID>',
        '<INSIGHT_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteInsight:
        print(result.to_dict())
```
---