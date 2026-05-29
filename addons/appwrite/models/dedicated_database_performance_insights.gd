class_name AppwriteDedicatedDatabasePerformanceInsights
extends RefCounted
## PerformanceInsights[br]


const _FIELD_MAP := {
    "topqueries": "topQueries",
    "waitevents": "waitEvents",
    "totalcalls": "totalCalls",
    "totaltimems": "totalTimeMs",
    "avgtimems": "avgTimeMs",
}

var topqueries: Array ## Top queries by total execution time.
var waitevents: Array ## Active wait events.
var totalcalls: int ## Total number of query calls.
var totaltimems: float ## Total query execution time in milliseconds.
var avgtimems: float ## Average query execution time in milliseconds.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDedicatedDatabasePerformanceInsights.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "topqueries" and value is Array:
            m.set(key, value)
            continue
        if key == "waitevents" and value is Array:
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