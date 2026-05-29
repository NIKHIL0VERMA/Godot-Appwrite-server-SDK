Migrate data from a Supabase project to your Appwrite project. This endpoint allows you to migrate resources like authentication, databases, and other supported services from a Supabase project. 
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.migrations.create_supabase_migration(
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
    
    if result is AppwriteMigration:
        print(result.to_dict())
```