class_name AppwriteMfaType
extends RefCounted
## MFAType[br]


const _FIELD_MAP := {
    "secret": "secret",
    "uri": "uri",
}

var secret: String ## Secret token used for TOTP factor.
var uri: String ## URI for authenticator apps.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteMfaType.new()

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