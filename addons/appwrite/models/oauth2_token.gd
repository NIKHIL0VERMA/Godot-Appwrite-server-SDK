class_name AppwriteOauth2Token
extends RefCounted
## OAuth2 Token[br]


const _FIELD_MAP := {
    "access_token": "access_token",
    "token_type": "token_type",
    "expires_in": "expires_in",
    "refresh_token": "refresh_token",
    "scope": "scope",
    "authorization_details": "authorization_details",
    "id_token": "id_token",
}

var access_token: String ## OAuth2 access token.
var token_type: String ## OAuth2 token type.
var expires_in: int ## Access token lifetime in seconds.
var refresh_token: String ## OAuth2 refresh token.
var scope: String ## Space-separated scopes granted to the access token.
var authorization_details: String ## Granted RFC 9396 authorization details as a JSON string.
var id_token: String ## OpenID Connect ID token. Returned when the `openid` scope is granted.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteOauth2Token.new()

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