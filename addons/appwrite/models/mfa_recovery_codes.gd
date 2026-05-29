class_name AppwriteMfaRecoveryCodes
extends RefCounted
## MFA Recovery Codes[br]


const _FIELD_MAP := {
    "recoverycodes": "recoveryCodes",
}

var recoverycodes: Array ## Recovery codes.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteMfaRecoveryCodes.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "recoverycodes" and value is Array:
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