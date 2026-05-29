class_name AppwriteColumnRelationship
extends RefCounted
## ColumnRelationship[br]

const _ColumnStatus := preload("res://addons/appwrite/enums/column_status.gd")

const _FIELD_MAP := {
    "key": "key",
    "xtype": "type",
    "status": "status",
    "error": "error",
    "required": "required",
    "array": "array",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "relatedtable": "relatedTable",
    "relationtype": "relationType",
    "twoway": "twoWay",
    "twowaykey": "twoWayKey",
    "ondelete": "onDelete",
    "side": "side",
}

var key: String ## Column Key.
var xtype: String ## Column type.
var status: String ## Column status. Possible values: `available`, `processing`, `deleting`, `stuck`, or `failed`
var error: String ## Error message. Displays error generated on failure of creating or deleting an column.
var required: bool ## Is column required?
var array: bool ## Is column an array?
var createdat: String ## Column creation date in ISO 8601 format.
var updatedat: String ## Column update date in ISO 8601 format.
var relatedtable: String ## The ID of the related table.
var relationtype: String ## The type of the relationship.
var twoway: bool ## Is the relationship two-way?
var twowaykey: String ## The key of the two-way relationship.
var ondelete: String ## How deleting the parent document will propagate to child documents.
var side: String ## Whether this is the parent or child side of the relationship

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteColumnRelationship.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "status" and value != null:
            if not _ColumnStatus.is_valid(value):
                push_error("Invalid enum value for status: %s" % value)
                return AppwriteException.new("Invalid enum value for status: %s" % value, 0, "invalid_enum_value", str(dict))
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