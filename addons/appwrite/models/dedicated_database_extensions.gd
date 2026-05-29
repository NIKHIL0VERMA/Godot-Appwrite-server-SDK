class_name AppwriteDedicatedDatabaseExtensions
extends RefCounted
## Extensions[br]


const _FIELD_MAP := {
    "installed": "installed",
    "available": "available",
}

var installed: Array ## List of installed extensions.
var available: Array ## List of available extensions that can be installed.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDedicatedDatabaseExtensions.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "installed" and value is Array:
            m.set(key, value)
            continue
        if key == "available" and value is Array:
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