class_name AppwriteRow
extends RefCounted
## Row[br]


const _FIELD_MAP := {
    "id": "$id",
    "sequence": "$sequence",
    "tableid": "$tableId",
    "databaseid": "$databaseId",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "permissions": "$permissions",
}

var id: String ## Row ID.
var sequence: String ## Row sequence ID.
var tableid: String ## Table ID.
var databaseid: String ## Database ID.
var createdat: String ## Row creation date in ISO 8601 format.
var updatedat: String ## Row update date in ISO 8601 format.
var permissions: Array ## Row permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteRow.new()

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