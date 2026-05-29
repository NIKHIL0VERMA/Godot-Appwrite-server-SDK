class_name AppwritePresence
extends RefCounted
## Presence[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "permissions": "$permissions",
    "userid": "userId",
    "status": "status",
    "source": "source",
    "expiresat": "expiresAt",
}

var id: String ## Presence ID.
var createdat: String ## Presence creation date in ISO 8601 format.
var updatedat: String ## Presence update date in ISO 8601 format.
var permissions: Array ## Presence permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).
var userid: String ## User ID.
var status: String ## Presence status.
var source: String ## Presence source.
var expiresat: String ## Presence expiry date in ISO 8601 format.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwritePresence.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "permissions" and value is Array:
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