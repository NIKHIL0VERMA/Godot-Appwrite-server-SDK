Get comprehensive usage statistics for your project. View metrics including network requests, bandwidth, storage, function executions, database usage, and user activity. Specify a time range with startDate and endDate, and optionally set the data granularity with period (1h or 1d). The response includes both total counts and detailed breakdowns by resource, along with historical data over the specified period.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.project.get_usage(
        '2020-10-15T06:38:00.000+00:00',
        '2020-10-15T06:38:00.000+00:00',
        '1h' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteUsageProject:
        print(result.to_dict())
```