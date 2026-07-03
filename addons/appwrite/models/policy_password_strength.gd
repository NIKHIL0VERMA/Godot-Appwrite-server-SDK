class_name AppwritePolicyPasswordStrength
extends RefCounted
## Policy Password Strength[br]


const _FIELD_MAP := {
    "id": "$id",
    "min": "min",
    "uppercase": "uppercase",
    "lowercase": "lowercase",
    "number": "number",
    "symbols": "symbols",
}

var id: String ## Policy ID.
var min: int ## Minimum password length required for user passwords.
var uppercase: bool ## Whether passwords must include at least one uppercase letter.
var lowercase: bool ## Whether passwords must include at least one lowercase letter.
var number: bool ## Whether passwords must include at least one number.
var symbols: bool ## Whether passwords must include at least one symbol.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwritePolicyPasswordStrength.new()

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