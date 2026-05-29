Create a new ephemeral API key. It&#039;s recommended to have multiple API keys with strict scopes for separate functions within your project.

You can also create a standard API key if you need a longer-lived key instead.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.project.create_ephemeral_key(
        [],
        600
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteEphemeralKey:
        print(result.to_dict())
```