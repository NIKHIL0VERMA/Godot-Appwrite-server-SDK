class_name AppwriteDedicatedDatabasePerformanceInsightsQuery
extends RefCounted
## PerformanceInsightsQuery[br]


const _FIELD_MAP := {
    "query": "query",
    "calls": "calls",
    "totaltimems": "totalTimeMs",
    "meantimems": "meanTimeMs",
    "rows": "rows",
}

var query: String ## The SQL query text.
var calls: int ## Number of times this query has been executed.
var totaltimems: float ## Total execution time in milliseconds.
var meantimems: float ## Mean execution time in milliseconds.
var rows: int ## Total rows returned or affected.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDedicatedDatabasePerformanceInsightsQuery.new()

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