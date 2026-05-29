class_name AppwriteDedicatedDatabaseQueryExplanation
extends RefCounted
## QueryExplanation[br]


const _FIELD_MAP := {
    "plan": "plan",
    "raw": "raw",
}

var plan: Array ## Structured query execution plan. Contents are engine-specific.
var raw: String ## Raw EXPLAIN output from the database engine.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDedicatedDatabaseQueryExplanation.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "plan" and value is Array:
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