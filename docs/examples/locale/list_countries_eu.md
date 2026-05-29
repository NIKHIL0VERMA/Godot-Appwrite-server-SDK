List of all countries that are currently members of the EU. You can use the locale header to get the data in a supported language.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.locale.list_countries_eu(
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteCountryList:
        print(result.to_dict())
```