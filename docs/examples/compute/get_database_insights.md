Get query-level performance insights for a dedicated database. Returns top queries by execution time, wait events, and aggregate query statistics.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.compute.get_database_insights(
        '<DATABASE_ID>',
        '1h', # optional
        0 # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDedicatedDatabasePerformanceInsights:
        print(result.to_dict())
```