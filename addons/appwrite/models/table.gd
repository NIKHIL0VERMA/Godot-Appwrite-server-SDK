class_name AppwriteTable
extends RefCounted
## Table[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "permissions": "$permissions",
    "databaseid": "databaseId",
    "xname": "name",
    "enabled": "enabled",
    "rowsecurity": "rowSecurity",
    "columns": "columns",
    "indexes": "indexes",
    "bytesmax": "bytesMax",
    "bytesused": "bytesUsed",
}

var id: String ## Table ID.
var createdat: String ## Table creation date in ISO 8601 format.
var updatedat: String ## Table update date in ISO 8601 format.
var permissions: Array ## Table permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).
var databaseid: String ## Database ID.
var xname: String ## Table name.
var enabled: bool ## Table enabled. Can be &#039;enabled&#039; or &#039;disabled&#039;. When disabled, the table is inaccessible to users, but remains accessible to Server SDKs using API keys.
var rowsecurity: bool ## Whether row-level permissions are enabled. [Learn more about permissions](https://appwrite.io/docs/permissions).
var columns: Array ## Table columns.
var indexes: Array ## Table indexes.
var bytesmax: int ## Maximum row size in bytes. Returns 0 when no limit applies.
var bytesused: int ## Currently used row size in bytes based on defined columns.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteTable.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "permissions" and value is Array:
            m.set(key, value)
            continue
        if key == "columns" and value is Array:
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