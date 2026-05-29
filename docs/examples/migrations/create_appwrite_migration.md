Migrate data from another Appwrite project to your current project. This endpoint allows you to migrate resources like databases, collections, documents, users, and files from an existing Appwrite project. 
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.migrations.create_appwrite_migration(
        [],
        'https://example.com',
        '<PROJECT_ID>',
        '<API_KEY>',
        'fail' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteMigration:
        print(result.to_dict())
```