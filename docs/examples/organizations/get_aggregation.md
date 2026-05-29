Get a specific aggregation using it&#039;s aggregation ID.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.organizations.get_aggregation(
        '<ORGANIZATION_ID>',
        '<AGGREGATION_ID>',
        0, # optional
        0 # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteAggregationTeam:
        print(result.to_dict())
```