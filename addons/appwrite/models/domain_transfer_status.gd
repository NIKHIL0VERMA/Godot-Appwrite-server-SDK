class_name AppwriteDomainTransferStatus
extends RefCounted
## domainTransferStatus[br]

const _DomainTransferStatusEnum := preload("res://addons/appwrite/enums/domain_transfer_status_enum.gd")

const _FIELD_MAP := {
    "status": "status",
    "reason": "reason",
    "timestamp": "timestamp",
}

var status: String ## Transfer status.
var reason: String ## Additional transfer status information.
var timestamp: String ## Transfer status timestamp in ISO 8601 format.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDomainTransferStatus.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "status" and value != null:
            if not _DomainTransferStatusEnum.is_valid(value):
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