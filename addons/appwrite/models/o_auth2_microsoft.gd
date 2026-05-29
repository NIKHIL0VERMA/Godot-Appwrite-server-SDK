class_name AppwriteOAuth2Microsoft
extends RefCounted
## OAuth2Microsoft[br]


const _FIELD_MAP := {
    "id": "$id",
    "enabled": "enabled",
    "applicationid": "applicationId",
    "applicationsecret": "applicationSecret",
    "tenant": "tenant",
}

var id: String ## OAuth2 provider ID.
var enabled: bool ## OAuth2 provider is active and can be used to create sessions.
var applicationid: String ## Microsoft OAuth2 application ID.
var applicationsecret: String ## Microsoft OAuth2 application secret.
var tenant: String ## Microsoft Entra ID tenant identifier. Use &#039;common&#039;, &#039;organizations&#039;, &#039;consumers&#039; or a specific tenant ID.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteOAuth2Microsoft.new()

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