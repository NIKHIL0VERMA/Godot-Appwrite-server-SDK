Query usage gauge metrics (point-in-time resource snapshots) from the usage database. Returns individual gauge snapshots with metric, value, and timestamp. Pass Query objects as JSON strings to filter, paginate, and order results. Supported query methods: equal, greaterThanEqual, lessThanEqual, orderAsc, orderDesc, limit, offset. Supported filter attributes: metric, time. Use `orderDesc(&quot;time&quot;), limit(1)` to fetch the most recent snapshot. When no time filter is supplied the endpoint defaults to the last 7 days. Default `limit(100)` is applied if none is given; user-supplied limits are capped at 500. The `total` field is capped at 5000 to keep counts predictable — pass `total=false` to skip the count entirely.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.usage.list_gauges(
        [], # optional
        false # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteUsageGaugeList:
        print(result.to_dict())
```