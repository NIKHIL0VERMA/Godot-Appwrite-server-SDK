## listEvents
Aggregate usage event metrics. `metrics[]` (1-10) is required; the response always contains one entry per requested metric, each with its own `points[]` time series.

**Two response shapes**:
- Omit `interval` for a flat top-N table — one point per dimension combination, no time axis. Useful for &quot;top 10 paths by bandwidth in the last 7 days&quot;.
- Pass `interval` (`1m`, `15m`, `30m`, `1h`, `1d`) for a time series — one point per (time bucket × dimension combination).

`dimensions[]` breaks each point down by one or more attributes (service, path, status, country, …). Pass multiple metrics to render stacked charts in one round-trip. `resource` and `resourceId` filter the underlying events. `orderBy=value`+`orderDir=desc`+`limit=N` returns the top-N by aggregated value. When `startAt` is omitted, the default window adapts to `interval` (or 7d when interval is omitted).

---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_key('<YOUR_API_KEY>') # Your secret API key

    var result = await Appwrite.usage.list_events(
        [],
        '<RESOURCE>', # optional
        '<RESOURCE_ID>', # optional
        '1m', # optional
        [], # optional
        '2020-10-15T06:38:00.000+00:00', # optional
        '2020-10-15T06:38:00.000+00:00', # optional
        'time', # optional
        'asc', # optional
        1, # optional
        0 # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteUsageEventList:
        print(result.to_dict())
```
---