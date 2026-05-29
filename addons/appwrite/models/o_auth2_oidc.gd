class_name AppwriteOAuth2Oidc
extends RefCounted
## OAuth2Oidc[br]


const _FIELD_MAP := {
    "id": "$id",
    "enabled": "enabled",
    "clientid": "clientId",
    "clientsecret": "clientSecret",
    "wellknownurl": "wellKnownURL",
    "authorizationurl": "authorizationURL",
    "tokenurl": "tokenURL",
    "userinfourl": "userInfoURL",
}

var id: String ## OAuth2 provider ID.
var enabled: bool ## OAuth2 provider is active and can be used to create sessions.
var clientid: String ## OpenID Connect OAuth2 client ID.
var clientsecret: String ## OpenID Connect OAuth2 client secret.
var wellknownurl: String ## OpenID Connect well-known configuration URL. When set, authorization, token, and user info endpoints can be discovered automatically.
var authorizationurl: String ## OpenID Connect authorization endpoint URL.
var tokenurl: String ## OpenID Connect token endpoint URL.
var userinfourl: String ## OpenID Connect user info endpoint URL.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteOAuth2Oidc.new()

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