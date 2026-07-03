class_name AppwriteUsageMetric
extends RefCounted
## usageMetric[br]


const _FIELD_MAP := {
    "metric": "metric",
    "points": "points",
}

var metric: String ## Metric key this series describes.
var points: Array ## Data points for this metric, ordered by time ascending. With `interval`, each entry is one bucket; without, each entry is one row of the dimensional or aggregate breakdown.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteUsageMetric.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "points" and value is Array:
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