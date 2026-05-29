Create a new site.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.sites.create(
        '<SITE_ID>',
        '<NAME>',
        'analog',
        'node-14.5',
        false, # optional
        false, # optional
        1, # optional
        '<INSTALL_COMMAND>', # optional
        '<BUILD_COMMAND>', # optional
        '<START_COMMAND>', # optional
        '<OUTPUT_DIRECTORY>', # optional
        'static', # optional
        '<INSTALLATION_ID>', # optional
        '<FALLBACK_FILE>', # optional
        '<PROVIDER_REPOSITORY_ID>', # optional
        '<PROVIDER_BRANCH>', # optional
        false, # optional
        '<PROVIDER_ROOT_DIRECTORY>', # optional
        [], # optional
        [], # optional
        "", # optional
        "", # optional
        0 # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteSite:
        print(result.to_dict())
```