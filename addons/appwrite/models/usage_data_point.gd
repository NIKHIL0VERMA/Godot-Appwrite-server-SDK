class_name AppwriteUsageDataPoint
extends RefCounted
## usageDataPoint[br]


const _FIELD_MAP := {
    "time": "time",
    "value": "value",
    "path": "path",
    "method": "method",
    "status": "status",
    "service": "service",
    "country": "country",
    "region": "region",
    "hostname": "hostname",
    "osname": "osName",
    "clienttype": "clientType",
    "clientname": "clientName",
    "devicename": "deviceName",
    "teamid": "teamId",
    "resourceid": "resourceId",
    "resource": "resource",
}

var time: String ## Bucket start timestamp (ISO 8601). When `interval` is omitted this is the request end time, marking the aggregate as-of moment.
var value: int ## Aggregated value for the bucket.
var path: String ## API endpoint path when broken down by `path`.
var method: String ## HTTP method when broken down by `method`.
var status: String ## HTTP status code when broken down by `status`.
var service: String ## API service segment when broken down by `service`.
var country: String ## Country code when broken down by `country`.
var region: String ## Appwrite region when broken down by `region`.
var hostname: String ## Caller origin hostname when broken down by `hostname`.
var osname: String ## Operating system name when broken down by `osName`.
var clienttype: String ## Client type when broken down by `clientType`.
var clientname: String ## Client name when broken down by `clientName`.
var devicename: String ## Device classification when broken down by `deviceName`.
var teamid: String ## Owning team ID when broken down by `teamId`.
var resourceid: String ## External resource ID when broken down by `resourceId`.
var resource: String ## Resource type when broken down by `resource` (gauges only).

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteUsageDataPoint.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if value != null:
            m.set(key, value)
    return m

## Convert to Dictionary
func to_dict() -> Dictionary:
    var dict := {}

    for key in _FIELD_MAP:
        var value = get(key)

        dict[_FIELD_MAP[key]] = value
    return dict