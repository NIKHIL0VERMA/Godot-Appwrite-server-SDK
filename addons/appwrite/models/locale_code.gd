class_name AppwriteLocaleCode
extends RefCounted
## LocaleCode[br]


const _FIELD_MAP := {
    "code": "code",
    "xname": "name",
}

var code: String ## Locale codes in [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes)
var xname: String ## Locale name

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteLocaleCode.new()

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