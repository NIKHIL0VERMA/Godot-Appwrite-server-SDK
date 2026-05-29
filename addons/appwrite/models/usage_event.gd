class_name AppwriteUsageEvent
extends RefCounted
## usageEvent[br]


const _FIELD_MAP := {
    "metric": "metric",
    "value": "value",
    "time": "time",
    "path": "path",
    "method": "method",
    "status": "status",
    "resourcetype": "resourceType",
    "resourceid": "resourceId",
    "countrycode": "countryCode",
    "useragent": "userAgent",
}

var metric: String ## The metric key.
var value: int ## The metric value.
var time: String ## The event timestamp.
var path: String ## The API endpoint path.
var method: String ## The HTTP method.
var status: String ## HTTP status code. Stored as string to preserve unset state (empty string = not available).
var resourcetype: String ## The resource type.
var resourceid: String ## The resource ID.
var countrycode: String ## Country code in [ISO 3166-1](http://en.wikipedia.org/wiki/ISO_3166-1) two-character format.
var useragent: String ## The user agent string.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteUsageEvent.new()

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