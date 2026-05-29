class_name AppwriteMfaFactors
extends RefCounted
## MFAFactors[br]


const _FIELD_MAP := {
    "totp": "totp",
    "phone": "phone",
    "email": "email",
    "recoverycode": "recoveryCode",
}

var totp: bool ## Can TOTP be used for MFA challenge for this account.
var phone: bool ## Can phone (SMS) be used for MFA challenge for this account.
var email: bool ## Can email be used for MFA challenge for this account.
var recoverycode: bool ## Can recovery code be used for MFA challenge for this account.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteMfaFactors.new()

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