class_name AppwriteOAuth2Facebook
extends RefCounted
## OAuth2Facebook[br]


const _FIELD_MAP := {
    "id": "$id",
    "enabled": "enabled",
    "appid": "appId",
    "appsecret": "appSecret",
}

var id: String ## OAuth2 provider ID.
var enabled: bool ## OAuth2 provider is active and can be used to create sessions.
var appid: String ## Facebook OAuth2 app ID.
var appsecret: String ## Facebook OAuth2 app secret.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteOAuth2Facebook.new()

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