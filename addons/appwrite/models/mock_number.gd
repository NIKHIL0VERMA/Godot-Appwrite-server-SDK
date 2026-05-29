class_name AppwriteMockNumber
extends RefCounted
## Mock Number[br]


const _FIELD_MAP := {
    "number": "number",
    "otp": "otp",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
}

var number: String ## Mock phone number for testing phone authentication. Useful for testing phone authentication without sending an SMS.
var otp: String ## Mock OTP for the number. 
var createdat: String ## Attribute creation date in ISO 8601 format.
var updatedat: String ## Attribute update date in ISO 8601 format.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteMockNumber.new()

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