class_name AppwriteDedicatedDatabaseSlowQuery
extends RefCounted
## SlowQuery[br]


const _FIELD_MAP := {
    "query": "query",
    "durationms": "durationMs",
    "calls": "calls",
    "user": "user",
    "database": "database",
}

var query: String ## The SQL query text.
var durationms: float ## Query duration in milliseconds.
var calls: int ## Number of times this query has been executed.
var user: String ## Database user that executed the query.
var database: String ## Database name.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDedicatedDatabaseSlowQuery.new()

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