Create a geometric polygon column.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.tablesDB.create_polygon_column(
        '<DATABASE_ID>',
        '<TABLE_ID>',
        "",
        false,
        [[[1, 2], [3, 4], [5, 6], [1, 2]]] # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteColumnPolygon:
        print(result.to_dict())
```