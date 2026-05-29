class_name AppwriteOAuth2Keycloak
extends RefCounted
## OAuth2Keycloak[br]


const _FIELD_MAP := {
    "id": "$id",
    "enabled": "enabled",
    "clientid": "clientId",
    "clientsecret": "clientSecret",
    "endpoint": "endpoint",
    "realmname": "realmName",
}

var id: String ## OAuth2 provider ID.
var enabled: bool ## OAuth2 provider is active and can be used to create sessions.
var clientid: String ## Keycloak OAuth2 client ID.
var clientsecret: String ## Keycloak OAuth2 client secret.
var endpoint: String ## Keycloak OAuth2 endpoint domain.
var realmname: String ## Keycloak OAuth2 realm name.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteOAuth2Keycloak.new()

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