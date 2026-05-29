class_name AppwriteOAuth2Google
extends RefCounted
## OAuth2Google[br]

const _OAuth2GooglePrompt := preload("res://addons/appwrite/enums/o_auth2_google_prompt.gd")

const _FIELD_MAP := {
    "id": "$id",
    "enabled": "enabled",
    "clientid": "clientId",
    "clientsecret": "clientSecret",
    "prompt": "prompt",
}

var id: String ## OAuth2 provider ID.
var enabled: bool ## OAuth2 provider is active and can be used to create sessions.
var clientid: String ## Google OAuth2 client ID.
var clientsecret: String ## Google OAuth2 client secret.
var prompt: Array[String] ## Google OAuth2 prompt values.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteOAuth2Google.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "prompt" and value is Array:
            var list := []
            for item in value:
                if not _OAuth2GooglePrompt.is_valid(item):
                    push_error("Invalid enum value: %s" % item)
                    return AppwriteException.new("Invalid enum value for prompt: %s" % value, 0, "invalid_enum_value", str(dict))
                list.append(item)
            m.set(key, list)
            continue
        if key == "prompt" and value is Array:
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