class_name AppwriteFrameworkAdapter
extends RefCounted
## Framework Adapter[br]


const _FIELD_MAP := {
    "key": "key",
    "installcommand": "installCommand",
    "buildcommand": "buildCommand",
    "outputdirectory": "outputDirectory",
    "fallbackfile": "fallbackFile",
}

var key: String ## Adapter key.
var installcommand: String ## Default command to download dependencies.
var buildcommand: String ## Default command to build site into output directory.
var outputdirectory: String ## Default output directory of build.
var fallbackfile: String ## Name of fallback file to use instead of 404 page. If null, Appwrite 404 page will be displayed.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteFrameworkAdapter.new()

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