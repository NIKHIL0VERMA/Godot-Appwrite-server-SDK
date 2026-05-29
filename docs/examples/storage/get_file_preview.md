Get a file preview image. Currently, this method supports preview for image files (jpg, png, and gif), other supported formats, like pdf, docs, slides, and spreadsheets, will return the file icon image. You can also pass query string arguments for cutting and resizing your preview image. Preview is supported only for image files smaller than 10MB.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.storage.get_file_preview(
        '<BUCKET_ID>',
        '<FILE_ID>',
        0, # optional
        0, # optional
        'center', # optional
        -1, # optional
        0, # optional
        "", # optional
        0, # optional
        0, # optional
        -360, # optional
        "", # optional
        'jpg', # optional
        '<TOKEN>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is Variant:
        print(result.to_dict())
```