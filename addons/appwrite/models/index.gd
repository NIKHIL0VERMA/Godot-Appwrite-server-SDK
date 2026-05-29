class_name AppwriteIndex
extends RefCounted
## Index[br]

const _IndexStatus := preload("res://addons/appwrite/enums/index_status.gd")

const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "key": "key",
    "xtype": "type",
    "status": "status",
    "error": "error",
    "attributes": "attributes",
    "lengths": "lengths",
    "orders": "orders",
}

var id: String ## Index ID.
var createdat: String ## Index creation date in ISO 8601 format.
var updatedat: String ## Index update date in ISO 8601 format.
var key: String ## Index key.
var xtype: String ## Index type.
var status: String ## Index status. Possible values: `available`, `processing`, `deleting`, `stuck`, or `failed`
var error: String ## Error message. Displays error generated on failure of creating or deleting an index.
var attributes: Array ## Index attributes.
var lengths: Array ## Index attributes length.
var orders: Array ## Index orders.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteIndex.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "status" and value != null:
            if not _IndexStatus.is_valid(value):
                push_error("Invalid enum value for status: %s" % value)
                return AppwriteException.new("Invalid enum value for status: %s" % value, 0, "invalid_enum_value", str(dict))
            m.set(key, value)
            continue
        if key == "attributes" and value is Array:
            m.set(key, value)
            continue
        if key == "lengths" and value is Array:
            m.set(key, value)
            continue
        if key == "orders" and value is Array:
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