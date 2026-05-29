List all OAuth2 providers supported by the Appwrite server, along with the parameters required to configure each provider. The response excludes mock providers but includes sandbox providers.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.console.list_o_auth2_providers(
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteConsoleOAuth2ProviderList:
        print(result.to_dict())
```