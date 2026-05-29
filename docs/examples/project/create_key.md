Create a new API key. It&#039;s recommended to have multiple API keys with strict scopes for separate functions within your project.

You can also create an ephemeral API key if you need a short-lived key instead.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.project.create_key(
        '<KEY_ID>',
        '<NAME>',
        [],
        '2020-10-15T06:38:00.000+00:00' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteKey:
        print(result.to_dict())
```