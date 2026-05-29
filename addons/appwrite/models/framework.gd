class_name AppwriteFramework
extends RefCounted
## Framework[br]


const _FIELD_MAP := {
    "key": "key",
    "xname": "name",
    "buildruntime": "buildRuntime",
    "runtimes": "runtimes",
    "adapters": "adapters",
}

var key: String ## Framework key.
var xname: String ## Framework Name.
var buildruntime: String ## Default runtime version.
var runtimes: Array ## List of supported runtime versions.
var adapters: Array ## List of supported adapters.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteFramework.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "runtimes" and value is Array:
            m.set(key, value)
            continue
        if key == "adapters" and value is Array:
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