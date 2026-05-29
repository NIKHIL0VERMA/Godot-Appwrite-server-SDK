class_name AppwriteOAuth2X
extends RefCounted
## OAuth2X[br]


const _FIELD_MAP := {
    "id": "$id",
    "enabled": "enabled",
    "customerkey": "customerKey",
    "secretkey": "secretKey",
}

var id: String ## OAuth2 provider ID.
var enabled: bool ## OAuth2 provider is active and can be used to create sessions.
var customerkey: String ## X OAuth2 customer key.
var secretkey: String ## X OAuth2 secret key.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteOAuth2X.new()

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