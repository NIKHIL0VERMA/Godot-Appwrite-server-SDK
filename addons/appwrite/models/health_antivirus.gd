class_name AppwriteHealthAntivirus
extends RefCounted
## Health Antivirus[br]

const _HealthAntivirusStatus := preload("res://addons/appwrite/enums/health_antivirus_status.gd")

const _FIELD_MAP := {
    "version": "version",
    "status": "status",
}

var version: String ## Antivirus version.
var status: String ## Antivirus status. Possible values are: `disabled`, `offline`, `online`

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteHealthAntivirus.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "status" and value != null:
            if not _HealthAntivirusStatus.is_valid(value):
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