class_name AppwriteDatabaseStatusVolume
extends RefCounted
## Volume[br]


const _FIELD_MAP := {
    "path": "path",
    "usedpercent": "usedPercent",
    "available": "available",
    "mounted": "mounted",
}

var path: String ## Mount path of the volume.
var usedpercent: String ## Percentage of storage used.
var available: String ## Available storage space.
var mounted: bool ## Whether the volume is mounted.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDatabaseStatusVolume.new()

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