class_name AppwriteLanguage
extends RefCounted
## Language[br]


const _FIELD_MAP := {
    "xname": "name",
    "code": "code",
    "nativename": "nativeName",
}

var xname: String ## Language name.
var code: String ## Language two-character ISO 639-1 codes.
var nativename: String ## Language native name.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteLanguage.new()

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