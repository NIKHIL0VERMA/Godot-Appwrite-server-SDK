class_name AppwriteOAuth2Apple
extends RefCounted
## OAuth2Apple[br]


const _FIELD_MAP := {
    "id": "$id",
    "enabled": "enabled",
    "serviceid": "serviceId",
    "keyid": "keyId",
    "teamid": "teamId",
    "p8file": "p8File",
}

var id: String ## OAuth2 provider ID.
var enabled: bool ## OAuth2 provider is active and can be used to create sessions.
var serviceid: String ## Apple OAuth2 service ID.
var keyid: String ## Apple OAuth2 key ID.
var teamid: String ## Apple OAuth2 team ID.
var p8file: String ## Apple OAuth2 .p8 private key file contents. The secret key wrapped by the PEM markers is 200 characters long.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteOAuth2Apple.new()

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