class_name AppwriteUsageGauge
extends RefCounted
## usageGauge[br]


const _FIELD_MAP := {
    "metric": "metric",
    "value": "value",
    "time": "time",
}

var metric: String ## The metric key.
var value: int ## The current snapshot value.
var time: String ## The snapshot timestamp.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteUsageGauge.new()

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