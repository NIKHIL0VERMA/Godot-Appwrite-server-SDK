class_name AppwriteCollection
extends RefCounted
## Collection[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "permissions": "$permissions",
    "databaseid": "databaseId",
    "xname": "name",
    "enabled": "enabled",
    "documentsecurity": "documentSecurity",
    "attributes": "attributes",
    "indexes": "indexes",
    "bytesmax": "bytesMax",
    "bytesused": "bytesUsed",
}

var id: String ## Collection ID.
var createdat: String ## Collection creation date in ISO 8601 format.
var updatedat: String ## Collection update date in ISO 8601 format.
var permissions: Array ## Collection permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).
var databaseid: String ## Database ID.
var xname: String ## Collection name.
var enabled: bool ## Collection enabled. Can be &#039;enabled&#039; or &#039;disabled&#039;. When disabled, the collection is inaccessible to users, but remains accessible to Server SDKs using API keys.
var documentsecurity: bool ## Whether document-level permissions are enabled. [Learn more about permissions](https://appwrite.io/docs/permissions).
var attributes: Array ## Collection attributes.
var indexes: Array ## Collection indexes.
var bytesmax: int ## Maximum document size in bytes. Returns 0 when no limit applies.
var bytesused: int ## Currently used document size in bytes based on defined attributes.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteCollection.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "permissions" and value is Array:
            m.set(key, value)
            continue
        if key == "attributes" and value is Array:
            m.set(key, value)
            continue
        if key == "indexes" and value is Array:
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