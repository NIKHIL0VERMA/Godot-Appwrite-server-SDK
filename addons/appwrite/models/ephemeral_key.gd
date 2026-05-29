class_name AppwriteEphemeralKey
extends RefCounted
## Ephemeral Key[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "xname": "name",
    "expire": "expire",
    "scopes": "scopes",
    "secret": "secret",
    "accessedat": "accessedAt",
    "sdks": "sdks",
}

var id: String ## Key ID.
var createdat: String ## Key creation date in ISO 8601 format.
var updatedat: String ## Key update date in ISO 8601 format.
var xname: String ## Key name.
var expire: String ## Key expiration date in ISO 8601 format.
var scopes: Array ## Allowed permission scopes.
var secret: String ## Secret key.
var accessedat: String ## Most recent access date in ISO 8601 format. This attribute is only updated again after 24 hours.
var sdks: Array ## List of SDK user agents that used this key.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteEphemeralKey.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "scopes" and value is Array:
            m.set(key, value)
            continue
        if key == "sdks" and value is Array:
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