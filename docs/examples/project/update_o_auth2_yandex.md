Update the project OAuth2 Yandex configuration.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.project.update_o_auth2_yandex(
        '<CLIENT_ID>', # optional
        '<CLIENT_SECRET>', # optional
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteOAuth2Yandex:
        print(result.to_dict())
```