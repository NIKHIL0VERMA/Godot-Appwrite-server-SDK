class_name AppwriteAppsList
extends RefCounted
## Apps list[br]


const _FIELD_MAP := {
    "total": "total",
    "apps": "apps",
}

var total: int ## Total number of apps that matched your query.
var apps: Array ## List of apps.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteAppsList.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "apps" and value is Array:
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