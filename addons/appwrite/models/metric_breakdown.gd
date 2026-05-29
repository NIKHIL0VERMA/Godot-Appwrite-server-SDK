class_name AppwriteMetricBreakdown
extends RefCounted
## Metric Breakdown[br]


const _FIELD_MAP := {
    "resourceid": "resourceId",
    "xname": "name",
    "value": "value",
    "estimate": "estimate",
}

var resourceid: String ## Resource ID.
var xname: String ## Resource name.
var value: int ## The value of this metric at the timestamp.
var estimate: float ## The estimated value of this metric at the end of the period.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteMetricBreakdown.new()

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