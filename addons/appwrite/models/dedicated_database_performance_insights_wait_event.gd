class_name AppwriteDedicatedDatabasePerformanceInsightsWaitEvent
extends RefCounted
## PerformanceInsightsWaitEvent[br]


const _FIELD_MAP := {
    "event": "event",
    "xtype": "type",
    "count": "count",
    "totalwaitms": "totalWaitMs",
}

var event: String ## Wait event name.
var xtype: String ## Wait event type or category.
var count: int ## Number of occurrences.
var totalwaitms: float ## Total wait time in milliseconds.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDedicatedDatabasePerformanceInsightsWaitEvent.new()

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