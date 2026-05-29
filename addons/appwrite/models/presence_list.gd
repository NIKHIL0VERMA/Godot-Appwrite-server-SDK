class_name AppwritePresenceList
extends RefCounted
## Presences List[br]


const _FIELD_MAP := {
    "total": "total",
    "presences": "presences",
}

var total: int ## Total number of presences that matched your query.
var presences: Array ## List of presences.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwritePresenceList.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "presences" and value is Array:
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