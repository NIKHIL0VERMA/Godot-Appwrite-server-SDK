class_name AppwriteDocument
extends RefCounted
## Document[br]


const _FIELD_MAP := {
    "id": "$id",
    "sequence": "$sequence",
    "collectionid": "$collectionId",
    "databaseid": "$databaseId",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "permissions": "$permissions",
}

var id: String ## Document ID.
var sequence: String ## Document sequence ID.
var collectionid: String ## Collection ID.
var databaseid: String ## Database ID.
var createdat: String ## Document creation date in ISO 8601 format.
var updatedat: String ## Document update date in ISO 8601 format.
var permissions: Array ## Document permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDocument.new()

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