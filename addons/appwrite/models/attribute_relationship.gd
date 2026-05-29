class_name AppwriteAttributeRelationship
extends RefCounted
## AttributeRelationship[br]

const _AttributeStatus := preload("res://addons/appwrite/enums/attribute_status.gd")

const _FIELD_MAP := {
    "key": "key",
    "xtype": "type",
    "status": "status",
    "error": "error",
    "required": "required",
    "array": "array",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "relatedcollection": "relatedCollection",
    "relationtype": "relationType",
    "twoway": "twoWay",
    "twowaykey": "twoWayKey",
    "ondelete": "onDelete",
    "side": "side",
}

var key: String ## Attribute Key.
var xtype: String ## Attribute type.
var status: String ## Attribute status. Possible values: `available`, `processing`, `deleting`, `stuck`, or `failed`
var error: String ## Error message. Displays error generated on failure of creating or deleting an attribute.
var required: bool ## Is attribute required?
var array: bool ## Is attribute an array?
var createdat: String ## Attribute creation date in ISO 8601 format.
var updatedat: String ## Attribute update date in ISO 8601 format.
var relatedcollection: String ## The ID of the related collection.
var relationtype: String ## The type of the relationship.
var twoway: bool ## Is the relationship two-way?
var twowaykey: String ## The key of the two-way relationship.
var ondelete: String ## How deleting the parent document will propagate to child documents.
var side: String ## Whether this is the parent or child side of the relationship

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteAttributeRelationship.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "status" and value != null:
            if not _AttributeStatus.is_valid(value):
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