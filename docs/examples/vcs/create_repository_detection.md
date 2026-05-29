Analyze a GitHub repository to automatically detect the programming language and runtime environment. This endpoint scans the repository&#039;s files and language statistics to determine the appropriate runtime settings for your function. The GitHub installation must be properly configured and the repository must be accessible through your installation for this endpoint to work.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.vcs.create_repository_detection(
        '<INSTALLATION_ID>',
        '<PROVIDER_REPOSITORY_ID>',
        'runtime',
        '<PROVIDER_ROOT_DIRECTORY>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDetectionRuntime:
        print(result.to_dict())
```