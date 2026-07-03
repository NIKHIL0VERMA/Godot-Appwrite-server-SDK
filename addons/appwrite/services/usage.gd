extends "../utils/service.gd"
## Service class.


## Aggregate usage event metrics. `metrics[]` (1-10) is required; the response always contains one entry per requested metric, each with its own `points[]` time series.[br]
##[br]
##**Two response shapes**:[br]
##- Omit `interval` for a flat top-N table — one point per dimension combination, no time axis. Useful for &quot;top 10 paths by bandwidth in the last 7 days&quot;.[br]
##- Pass `interval` (`1m`, `15m`, `30m`, `1h`, `1d`) for a time series — one point per (time bucket × dimension combination).[br]
##[br]
##`dimensions[]` breaks each point down by one or more attributes (service, path, status, country, …). Pass multiple metrics to render stacked charts in one round-trip. `resource` and `resourceId` filter the underlying events. `orderBy=value`+`orderDir=desc`+`limit=N` returns the top-N by aggregated value. When `startAt` is omitted, the default window adapts to `interval` (or 7d when interval is omitted).[br]
##[br]
## Parameters:[br]
## - [param metrics] [Array]: One to ten metric names. Single-metric callers pass a one-element array. Example: `metrics[]=executions` or `metrics[]=executions&amp;metrics[]=executions.compute` for stacked charts.[br]
## - [param resource] [String]: Resource type filter (singular form). Common values: function, site, database, bucket, file, webhook, team, user, project.[br]
## - [param resource_id] [String]: Resource id filter.[br]
## - [param interval] [String]: Time interval size. Omit (null) for a flat aggregate over the whole window. Allowed: 1m, 15m, 30m, 1h, 1d.[br]
## - [param dimensions] [Array]: Break-down dimensions (max 10). Allowed: path, method, status, service, resource, country, region, hostname, osName, clientType, clientName, deviceName, teamId, resourceId.[br]
## - [param start_at] [String]: Range start in ISO 8601. Defaults adapt to interval (7d for the no-interval aggregate).[br]
## - [param end_at] [String]: Range end in ISO 8601. Defaults to the current time.[br]
## - [param order_by] [String]: Column to order by. Allowed: time, value. Default time when an interval is set; otherwise value.[br]
## - [param order_dir] [String]: Sort direction: asc or desc. Default desc — paired with the default limit, returns the most recent / highest-value groups first.[br]
## - [param limit] [int]: Maximum rows to return (1-5000).[br]
## - [param offset] [int]: Pagination offset (0-100000).[br]
##[br]
## Returns:[br]
## - [AppwriteUsageEventList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_events(metrics: Array, resource: Variant = null, resource_id: Variant = null, interval: Variant = null, dimensions: Variant = null, start_at: Variant = null, end_at: Variant = null, order_by: Variant = null, order_dir: Variant = null, limit: Variant = null, offset: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if resource != null and not resource is String:
        return AppwriteException.new("Invalid type for parameter 'resource'. Expected String.", 0, "argument_error", "")
    if resource_id != null and not resource_id is String:
        return AppwriteException.new("Invalid type for parameter 'resource_id'. Expected String.", 0, "argument_error", "")
    if interval != null and not interval is String:
        return AppwriteException.new("Invalid type for parameter 'interval'. Expected String.", 0, "argument_error", "")
    if dimensions != null and not dimensions is Array:
        return AppwriteException.new("Invalid type for parameter 'dimensions'. Expected Array.", 0, "argument_error", "")
    if start_at != null and not start_at is String:
        return AppwriteException.new("Invalid type for parameter 'start_at'. Expected String.", 0, "argument_error", "")
    if end_at != null and not end_at is String:
        return AppwriteException.new("Invalid type for parameter 'end_at'. Expected String.", 0, "argument_error", "")
    if order_by != null and not order_by is String:
        return AppwriteException.new("Invalid type for parameter 'order_by'. Expected String.", 0, "argument_error", "")
    if order_dir != null and not order_dir is String:
        return AppwriteException.new("Invalid type for parameter 'order_dir'. Expected String.", 0, "argument_error", "")
    if limit != null and not limit is int:
        return AppwriteException.new("Invalid type for parameter 'limit'. Expected int.", 0, "argument_error", "")
    if offset != null and not offset is int:
        return AppwriteException.new("Invalid type for parameter 'offset'. Expected int.", 0, "argument_error", "")

    var _path := '/usage/events'

    var _params := {}
    _params['metrics'] = metrics
    if resource != null:
        _params['resource'] = resource
    if resource_id != null:
        _params['resourceId'] = resource_id
    if interval != null:
        _params['interval'] = interval
    if dimensions != null:
        _params['dimensions'] = dimensions
    if start_at != null:
        _params['startAt'] = start_at
    if end_at != null:
        _params['endAt'] = end_at
    if order_by != null:
        _params['orderBy'] = order_by
    if order_dir != null:
        _params['orderDir'] = order_dir
    if limit != null:
        _params['limit'] = limit
    if offset != null:
        _params['offset'] = offset

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteUsageEventList


    return await _call('get', _path, _headers, _params, model_script)


## Aggregate usage gauge snapshots. Gauges are point-in-time values (storage totals, resource counts, …); each point carries the latest snapshot in its interval via `argMax(value, time)`. `metrics[]` (1-10) is required; the response always contains one entry per requested metric, each with its own `points[]` time series.[br]
##[br]
##**Two response shapes**:[br]
##- Omit `interval` for a flat top-N table — `argMax(value, time)` per dimension combination over the whole window, no time axis. Useful for &quot;top 10 resources by current storage&quot;.[br]
##- Pass `interval` (`1m`, `15m`, `30m`, `1h`, `1d`) for a time series — one snapshot per (time bucket × dimension combination).[br]
##[br]
##`dimensions[]` breaks each point down further. Supported on gauges: `resourceId`, `teamId`, `service`, `resource`. `service` and `resource` enable per-service / per-resource-type panels (e.g. storage-by-service: group `files.storage`, `deployments.storage`, `builds.storage`, `databases.storage` by `service`). Pass multiple metrics to render stacked charts in one round-trip. `resourceId` and `teamId` parameters filter the underlying rows. `orderBy=value`+`orderDir=desc`+`limit=N` returns the top-N. When `startAt` is omitted, the default window adapts to interval (or 7d when interval is omitted).[br]
##[br]
## Parameters:[br]
## - [param metrics] [Array]: One to ten metric names. Single-metric callers pass a one-element array. Example: `metrics[]=files.storage` or `metrics[]=files.storage&amp;metrics[]=deployments.storage` for stacked charts.[br]
## - [param resource_id] [String]: Resource id filter.[br]
## - [param team_id] [String]: Team id filter.[br]
## - [param interval] [String]: Time interval size. Omit (null) for a flat aggregate over the whole window. Allowed: 1m, 15m, 30m, 1h, 1d.[br]
## - [param dimensions] [Array]: Break-down dimensions. Allowed: resourceId, teamId, service, resource.[br]
## - [param start_at] [String]: Range start in ISO 8601. Defaults to endAt - 7d.[br]
## - [param end_at] [String]: Range end in ISO 8601. Defaults to the current time.[br]
## - [param order_by] [String]: Column to order by. Allowed: time, value. Default time.[br]
## - [param order_dir] [String]: Sort direction: asc or desc. Default desc — paired with the default limit, this returns the most recent groups first. Pass asc for chronological charting.[br]
## - [param limit] [int]: Maximum rows to return (1-5000).[br]
## - [param offset] [int]: Pagination offset (0-100000).[br]
##[br]
## Returns:[br]
## - [AppwriteUsageGaugeList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_gauges(metrics: Array, resource_id: Variant = null, team_id: Variant = null, interval: Variant = null, dimensions: Variant = null, start_at: Variant = null, end_at: Variant = null, order_by: Variant = null, order_dir: Variant = null, limit: Variant = null, offset: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if resource_id != null and not resource_id is String:
        return AppwriteException.new("Invalid type for parameter 'resource_id'. Expected String.", 0, "argument_error", "")
    if team_id != null and not team_id is String:
        return AppwriteException.new("Invalid type for parameter 'team_id'. Expected String.", 0, "argument_error", "")
    if interval != null and not interval is String:
        return AppwriteException.new("Invalid type for parameter 'interval'. Expected String.", 0, "argument_error", "")
    if dimensions != null and not dimensions is Array:
        return AppwriteException.new("Invalid type for parameter 'dimensions'. Expected Array.", 0, "argument_error", "")
    if start_at != null and not start_at is String:
        return AppwriteException.new("Invalid type for parameter 'start_at'. Expected String.", 0, "argument_error", "")
    if end_at != null and not end_at is String:
        return AppwriteException.new("Invalid type for parameter 'end_at'. Expected String.", 0, "argument_error", "")
    if order_by != null and not order_by is String:
        return AppwriteException.new("Invalid type for parameter 'order_by'. Expected String.", 0, "argument_error", "")
    if order_dir != null and not order_dir is String:
        return AppwriteException.new("Invalid type for parameter 'order_dir'. Expected String.", 0, "argument_error", "")
    if limit != null and not limit is int:
        return AppwriteException.new("Invalid type for parameter 'limit'. Expected int.", 0, "argument_error", "")
    if offset != null and not offset is int:
        return AppwriteException.new("Invalid type for parameter 'offset'. Expected int.", 0, "argument_error", "")

    var _path := '/usage/gauges'

    var _params := {}
    _params['metrics'] = metrics
    if resource_id != null:
        _params['resourceId'] = resource_id
    if team_id != null:
        _params['teamId'] = team_id
    if interval != null:
        _params['interval'] = interval
    if dimensions != null:
        _params['dimensions'] = dimensions
    if start_at != null:
        _params['startAt'] = start_at
    if end_at != null:
        _params['endAt'] = end_at
    if order_by != null:
        _params['orderBy'] = order_by
    if order_dir != null:
        _params['orderDir'] = order_dir
    if limit != null:
        _params['limit'] = limit
    if offset != null:
        _params['offset'] = offset

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteUsageGaugeList


    return await _call('get', _path, _headers, _params, model_script)

