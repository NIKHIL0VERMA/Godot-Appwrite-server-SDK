Create a new function. You can pass a list of [permissions](https://appwrite.io/docs/permissions) to allow different project users or team with access to execute the function using the client API.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.functions.create(
        '<FUNCTION_ID>',
        '<NAME>',
        'node-14.5',
        ["any"], # optional
        [], # optional
        "", # optional
        1, # optional
        false, # optional
        false, # optional
        '<ENTRYPOINT>', # optional
        '<COMMANDS>', # optional
        [], # optional
        '<INSTALLATION_ID>', # optional
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
    
    if result is AppwriteFunction:
        print(result.to_dict())
```