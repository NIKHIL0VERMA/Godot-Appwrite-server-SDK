class_name AppwriteOauth2Grant
extends RefCounted
## OAuth2 Grant[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "userid": "userId",
    "appid": "appId",
    "scopes": "scopes",
    "resources": "resources",
    "authorizationdetails": "authorizationDetails",
    "prompt": "prompt",
    "redirecturi": "redirectUri",
    "authtime": "authTime",
    "expire": "expire",
}

var id: String ## Grant ID.
var createdat: String ## Grant creation time in ISO 8601 format.
var updatedat: String ## Grant update date in ISO 8601 format.
var userid: String ## ID of the user the grant belongs to.
var appid: String ## ID of the OAuth2 client (app) the grant was requested for.
var scopes: Array ## Requested OAuth2 scopes the user is being asked to consent to.
var resources: Array ## Requested RFC 8707 resource indicators the user is being asked to consent to.
var authorizationdetails: String ## Requested authorization_details the user is being asked to consent to, as a JSON string. Each entry has a `type` plus project-defined fields.
var prompt: String ## OIDC prompt directive the consent screen should honor. Space-separated list of: login, consent, select_account.
var redirecturi: String ## Redirect URI the user will be sent to after the flow completes.
var authtime: int ## Unix timestamp of when the user last authenticated.
var expire: String ## Grant expiration time in ISO 8601 format.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteOauth2Grant.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "scopes" and value is Array:
            m.set(key, value)
            continue
        if key == "resources" and value is Array:
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