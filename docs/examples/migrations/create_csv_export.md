Export documents to a CSV file from your Appwrite database. This endpoint allows you to export documents to a CSV file stored in a secure internal bucket. You&#039;ll receive an email with a download link when the export is complete.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.migrations.create_csv_export(
        '<ID1:ID2>',
        '<FILENAME>',
        [], # optional
        [], # optional
        '<DELIMITER>', # optional
        '<ENCLOSURE>', # optional
        '<ESCAPE>', # optional
        false, # optional
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteMigration:
        print(result.to_dict())
```