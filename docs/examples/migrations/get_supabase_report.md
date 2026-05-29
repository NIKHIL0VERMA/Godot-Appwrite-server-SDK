Generate a report of the data in a Supabase project before migrating. This endpoint analyzes the source project and returns information about the resources that can be migrated. 
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.migrations.get_supabase_report(
        [],
        'https://example.com',
        '<API_KEY>',
        '<DATABASE_HOST>',
        '<USERNAME>',
        '<PASSWORD>',
        0 # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteMigrationReport:
        print(result.to_dict())
```