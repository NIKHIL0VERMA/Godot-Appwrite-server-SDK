Get an analyzer report by its unique ID. The response includes the report&#039;s metadata and the nested insights it produced.

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.advisor.get_report(
        '<REPORT_ID>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteReport:
        print(result.to_dict())
```