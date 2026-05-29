class_name AppwriteUsageBuckets
extends RefCounted
## UsageBuckets[br]


const _FIELD_MAP := {
    "xrange": "range",
    "filestotal": "filesTotal",
    "filesstoragetotal": "filesStorageTotal",
    "files": "files",
    "storage": "storage",
    "imagetransformations": "imageTransformations",
    "imagetransformationstotal": "imageTransformationsTotal",
}

var xrange: String ## Time range of the usage stats.
var filestotal: int ## Total aggregated number of bucket files.
var filesstoragetotal: int ## Total aggregated number of bucket files storage (in bytes).
var files: Array ## Aggregated  number of bucket files per period.
var storage: Array ## Aggregated  number of bucket storage files (in bytes) per period.
var imagetransformations: Array ## Aggregated number of files transformations per period.
var imagetransformationstotal: int ## Total aggregated number of files transformations.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteUsageBuckets.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "files" and value is Array:
            m.set(key, value)
            continue
        if key == "storage" and value is Array:
            m.set(key, value)
            continue
        if key == "imagetransformations" and value is Array:
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