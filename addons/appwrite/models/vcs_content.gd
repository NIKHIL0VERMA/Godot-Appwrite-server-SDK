class_name AppwriteVcsContent
extends RefCounted
## VcsContents[br]


const _FIELD_MAP := {
    "size": "size",
    "isdirectory": "isDirectory",
    "xname": "name",
}

var size: int ## Content size in bytes. Only files have size, and for directories, 0 is returned.
var isdirectory: bool ## If a content is a directory. Directories can be used to check nested contents.
var xname: String ## Name of directory or file.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteVcsContent.new()

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