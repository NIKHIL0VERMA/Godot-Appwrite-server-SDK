class_name AppwriteDedicatedDatabaseConnection
extends RefCounted
## Connection[br]


const _FIELD_MAP := {
    "id": "$id",
    "username": "username",
    "database": "database",
    "role": "role",
    "createdat": "$createdAt",
}

var id: String ## Connection ID.
var username: String ## Connection username.
var database: String ## Database name.
var role: String ## Connection role. Common values: readonly, readwrite.
var createdat: String ## Connection creation date in ISO 8601 format.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDedicatedDatabaseConnection.new()

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