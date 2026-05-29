class_name AppwriteDetectionRuntime
extends RefCounted
## DetectionRuntime[br]

const _DetectionRuntimeType := preload("res://addons/appwrite/enums/detection_runtime_type.gd")

const _FIELD_MAP := {
    "xtype": "type",
    "variables": "variables",
    "runtime": "runtime",
    "entrypoint": "entrypoint",
    "commands": "commands",
}

var xtype: String ## Repository detection type.
var variables: Array ## Environment variables found in .env files
var runtime: String ## Runtime
var entrypoint: String ## Function Entrypoint
var commands: String ## Function install and build commands

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDetectionRuntime.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "xtype" and value != null:
            if not _DetectionRuntimeType.is_valid(value):
                push_error("Invalid enum value for xtype: %s" % value)
                return AppwriteException.new("Invalid enum value for xtype: %s" % value, 0, "invalid_enum_value", str(dict))
            m.set(key, value)
            continue
        if key == "variables" and value is Array:
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