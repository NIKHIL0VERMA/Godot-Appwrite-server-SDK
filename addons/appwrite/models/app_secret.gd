class_name AppwriteAppSecret
extends RefCounted
## AppSecret[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "appid": "appId",
    "secret": "secret",
    "hint": "hint",
    "createdbyid": "createdById",
    "createdbyname": "createdByName",
    "lastaccessedat": "lastAccessedAt",
}

var id: String ## Secret ID.
var createdat: String ## Secret creation time in ISO 8601 format.
var updatedat: String ## Secret update time in ISO 8601 format.
var appid: String ## Application ID this secret belongs to.
var secret: String ## Hashed application client secret.
var hint: String ## Last few characters of the client secret, used to help identify it.
var createdbyid: String ## ID of the user who created the secret.
var createdbyname: String ## Name of the user who created the secret.
var lastaccessedat: String ## Time the secret was last used for authentication in ISO 8601 format. Null if never used.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteAppSecret.new()

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