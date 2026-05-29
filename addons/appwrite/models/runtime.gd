class_name AppwriteRuntime
extends RefCounted
## Runtime[br]


const _FIELD_MAP := {
    "id": "$id",
    "key": "key",
    "xname": "name",
    "version": "version",
    "base": "base",
    "image": "image",
    "logo": "logo",
    "supports": "supports",
}

var id: String ## Runtime ID.
var key: String ## Parent runtime key.
var xname: String ## Runtime Name.
var version: String ## Runtime version.
var base: String ## Base Docker image used to build the runtime.
var image: String ## Image name of Docker Hub.
var logo: String ## Name of the logo image.
var supports: Array ## List of supported architectures.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteRuntime.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "supports" and value is Array:
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