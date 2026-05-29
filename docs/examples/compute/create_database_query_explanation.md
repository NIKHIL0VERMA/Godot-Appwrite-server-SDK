Run EXPLAIN on a query against a dedicated database. Available for SQL-compatible engines. Returns the query execution plan including scan types, estimated cost, and resource usage. Optionally run EXPLAIN ANALYZE to get actual execution statistics.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.compute.create_database_query_explanation(
        '<DATABASE_ID>',
        '<QUERY>',
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteDedicatedDatabaseQueryExplanation:
        print(result.to_dict())
```