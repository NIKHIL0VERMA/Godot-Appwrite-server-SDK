Create or update a Row. Before using this route, you should create a new table resource using either a [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable) API or directly from your database console.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.tablesDB.upsert_row(
        '<DATABASE_ID>',
        '<TABLE_ID>',
        '<ROW_ID>',
        {"username":"walter.obrien","email":"walter.obrien@example.com","fullName":"Walter O'Brien","age":33,"isAdmin":false}, # optional
        ["read("any")"], # optional
        '<TRANSACTION_ID>' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteRow:
        print(result.to_dict())
```