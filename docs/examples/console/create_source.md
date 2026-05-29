Create a new source.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.console.create_source(
        '<REF>', # optional
        'https://example.com', # optional
        '<UTM_SOURCE>', # optional
        '<UTM_CAMPAIGN>', # optional
        '<UTM_MEDIUM>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is Variant:
        print(result.to_dict())
```