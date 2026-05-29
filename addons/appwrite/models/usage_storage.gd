class_name AppwriteUsageStorage
extends RefCounted
## StorageUsage[br]


const _FIELD_MAP := {
    "xrange": "range",
    "bucketstotal": "bucketsTotal",
    "filestotal": "filesTotal",
    "filesstoragetotal": "filesStorageTotal",
    "buckets": "buckets",
    "files": "files",
    "storage": "storage",
}

var xrange: String ## Time range of the usage stats.
var bucketstotal: int ## Total aggregated number of buckets
var filestotal: int ## Total aggregated number of files.
var filesstoragetotal: int ## Total aggregated number of files storage (in bytes).
var buckets: Array ## Aggregated number of buckets per period.
var files: Array ## Aggregated number of files per period.
var storage: Array ## Aggregated number of files storage (in bytes) per period .

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteUsageStorage.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "buckets" and value is Array:
            m.set(key, value)
            continue
        if key == "files" and value is Array:
            m.set(key, value)
            continue
        if key == "storage" and value is Array:
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