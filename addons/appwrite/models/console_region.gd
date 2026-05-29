class_name AppwriteConsoleRegion
extends RefCounted
## Region[br]


const _FIELD_MAP := {
    "id": "$id",
    "xname": "name",
    "available": "available",
    "disabled": "disabled",
    "default": "default",
    "flag": "flag",
}

var id: String ## Region ID
var xname: String ## Region name
var available: bool ## Does the organization have access to this region.
var disabled: bool ## Does the backend support this region.
var default: bool ## Is this the region default.
var flag: String ## Region flag code.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteConsoleRegion.new()

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