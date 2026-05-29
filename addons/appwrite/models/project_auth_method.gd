class_name AppwriteProjectAuthMethod
extends RefCounted
## ProjectAuthMethod[br]

const _ProjectAuthMethodId := preload("res://addons/appwrite/enums/project_auth_method_id.gd")

const _FIELD_MAP := {
    "id": "$id",
    "enabled": "enabled",
}

var id: String ## Auth method ID.
var enabled: bool ## Auth method status.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteProjectAuthMethod.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "id" and value != null:
            if not _ProjectAuthMethodId.is_valid(value):
                push_error("Invalid enum value for id: %s" % value)
                return AppwriteException.new("Invalid enum value for id: %s" % value, 0, "invalid_enum_value", str(dict))
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