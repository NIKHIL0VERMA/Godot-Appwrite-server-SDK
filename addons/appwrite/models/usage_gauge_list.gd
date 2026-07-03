class_name AppwriteUsageGaugeList
extends RefCounted
## usageGaugeList[br]


const _FIELD_MAP := {
    "interval": "interval",
    "metrics": "metrics",
}

var interval: String ## Time interval size (1h or 1d). Empty when the request omits `interval` — points then carry the request end time as their as-of marker.
var metrics: Array ## One entry per requested metric, each carrying its own points[] time series (latest-snapshot per bucket / dimension via argMax over time).

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteUsageGaugeList.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "metrics" and value is Array:
            m.set(key, value)
            continue
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