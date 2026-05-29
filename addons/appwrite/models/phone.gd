class_name AppwritePhone
extends RefCounted
## Phone[br]


const _FIELD_MAP := {
    "code": "code",
    "countrycode": "countryCode",
    "countryname": "countryName",
}

var code: String ## Phone code.
var countrycode: String ## Country two-character ISO 3166-1 alpha code.
var countryname: String ## Country name.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwritePhone.new()

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