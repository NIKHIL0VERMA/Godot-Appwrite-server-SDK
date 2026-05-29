Create a new site code deployment. Use this endpoint to upload a new version of your site code. To activate your newly uploaded code, you&#039;ll need to update the site&#039;s deployment to use your new deployment ID.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.sites.create_deployment(
        '<SITE_ID>',
        InputFile.from_path("file.png"),
        '<INSTALL_COMMAND>', # optional
        '<BUILD_COMMAND>', # optional
        '<OUTPUT_DIRECTORY>', # optional
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDeployment:
        print(result.to_dict())
```