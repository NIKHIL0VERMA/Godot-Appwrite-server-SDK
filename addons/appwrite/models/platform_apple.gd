class_name AppwritePlatformApple
extends RefCounted
## Platform Apple[br]

const _PlatformType := preload("res://addons/appwrite/enums/platform_type.gd")

const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "xname": "name",
    "xtype": "type",
    "bundleidentifier": "bundleIdentifier",
}

var id: String ## Platform ID.
var createdat: String ## Platform creation date in ISO 8601 format.
var updatedat: String ## Platform update date in ISO 8601 format.
var xname: String ## Platform name.
var xtype: String ## Platform type. Possible values are: windows, apple, android, linux, web.
var bundleidentifier: String ## Apple bundle identifier.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwritePlatformApple.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "xtype" and value != null:
            if not _PlatformType.is_valid(value):
                push_error("Invalid enum value for xtype: %s" % value)
                return AppwriteException.new("Invalid enum value for xtype: %s" % value, 0, "invalid_enum_value", str(dict))
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