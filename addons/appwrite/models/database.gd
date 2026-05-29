class_name AppwriteDatabase
extends RefCounted
## Database[br]

const _DatabaseType := preload("res://addons/appwrite/enums/database_type.gd")

const _FIELD_MAP := {
    "id": "$id",
    "xname": "name",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "enabled": "enabled",
    "xtype": "type",
    "policies": "policies",
    "archives": "archives",
}

var id: String ## Database ID.
var xname: String ## Database name.
var createdat: String ## Database creation date in ISO 8601 format.
var updatedat: String ## Database update date in ISO 8601 format.
var enabled: bool ## If database is enabled. Can be &#039;enabled&#039; or &#039;disabled&#039;. When disabled, the database is inaccessible to users, but remains accessible to Server SDKs using API keys.
var xtype: String ## Database type.
var policies: Array ## Database backup policies.
var archives: Array ## Database backup archives.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDatabase.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "xtype" and value != null:
            if not _DatabaseType.is_valid(value):
                push_error("Invalid enum value for xtype: %s" % value)
                return AppwriteException.new("Invalid enum value for xtype: %s" % value, 0, "invalid_enum_value", str(dict))
            m.set(key, value)
            continue
        if key == "policies" and value is Array:
            m.set(key, value)
            continue
        if key == "archives" and value is Array:
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