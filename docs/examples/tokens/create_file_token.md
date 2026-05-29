Create a new token. A token is linked to a file. Token can be passed as a request URL search parameter.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.tokens.create_file_token(
        '<BUCKET_ID>',
        '<FILE_ID>',
        '2020-10-15T06:38:00.000+00:00' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteResourceToken:
        print(result.to_dict())
```