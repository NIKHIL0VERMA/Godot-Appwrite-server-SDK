extends "../utils/service.gd"
## Service class.


## Query usage event metrics from the usage database. Returns individual event rows with full metadata. Pass Query objects as JSON strings to filter, paginate, and order results. Supported query methods: equal, greaterThanEqual, lessThanEqual, orderAsc, orderDesc, limit, offset. Supported filter attributes: metric, path, method, status, resource, resourceId, country, userAgent, time (these match the underlying column names — note that the response surfaces `resource` as `resourceType` and `country` as `countryCode`). When no time filter is supplied the endpoint defaults to the last 7 days. Default `limit(100)` is applied if none is given; user-supplied limits are capped at 500. The `total` field is capped at 5000 to keep counts predictable — pass `total=false` to skip the count entirely.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings as JSON. Supported: equal(&quot;metric&quot;, [...]), equal(&quot;path&quot;, [...]), equal(&quot;method&quot;, [...]), equal(&quot;status&quot;, [...]), equal(&quot;resource&quot;, [...]), equal(&quot;resourceId&quot;, [...]), equal(&quot;country&quot;, [...]), equal(&quot;userAgent&quot;, [...]), greaterThanEqual(&quot;time&quot;, &quot;...&quot;), lessThanEqual(&quot;time&quot;, &quot;...&quot;), orderAsc(&quot;time&quot;), orderDesc(&quot;time&quot;), limit(N), offset(N).[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteUsageEventList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_events(queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/usage/events'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteUsageEventList

    return await _call('get', _path, _headers, _params, model_script)


## Query usage gauge metrics (point-in-time resource snapshots) from the usage database. Returns individual gauge snapshots with metric, value, and timestamp. Pass Query objects as JSON strings to filter, paginate, and order results. Supported query methods: equal, greaterThanEqual, lessThanEqual, orderAsc, orderDesc, limit, offset. Supported filter attributes: metric, time. Use `orderDesc(&quot;time&quot;), limit(1)` to fetch the most recent snapshot. When no time filter is supplied the endpoint defaults to the last 7 days. Default `limit(100)` is applied if none is given; user-supplied limits are capped at 500. The `total` field is capped at 5000 to keep counts predictable — pass `total=false` to skip the count entirely.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings as JSON. Supported: equal(&quot;metric&quot;, [...]), greaterThanEqual(&quot;time&quot;, &quot;...&quot;), lessThanEqual(&quot;time&quot;, &quot;...&quot;), orderAsc(&quot;time&quot;), orderDesc(&quot;time&quot;), limit(N), offset(N).[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteUsageGaugeList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_gauges(queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/usage/gauges'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteUsageGaugeList

    return await _call('get', _path, _headers, _params, model_script)

