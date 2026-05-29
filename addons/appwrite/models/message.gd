class_name AppwriteMessage
extends RefCounted
## Message[br]

const _MessageStatus := preload("res://addons/appwrite/enums/message_status.gd")

const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "providertype": "providerType",
    "topics": "topics",
    "users": "users",
    "targets": "targets",
    "scheduledat": "scheduledAt",
    "deliveredat": "deliveredAt",
    "deliveryerrors": "deliveryErrors",
    "deliveredtotal": "deliveredTotal",
    "data": "data",
    "status": "status",
}

var id: String ## Message ID.
var createdat: String ## Message creation time in ISO 8601 format.
var updatedat: String ## Message update date in ISO 8601 format.
var providertype: String ## Message provider type.
var topics: Array ## Topic IDs set as recipients.
var users: Array ## User IDs set as recipients.
var targets: Array ## Target IDs set as recipients.
var scheduledat: String ## The scheduled time for message.
var deliveredat: String ## The time when the message was delivered.
var deliveryerrors: Array ## Delivery errors if any.
var deliveredtotal: int ## Number of recipients the message was delivered to.
var data: Dictionary ## Data of the message.
var status: String ## Status of delivery.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteMessage.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "topics" and value is Array:
            m.set(key, value)
            continue
        if key == "users" and value is Array:
            m.set(key, value)
            continue
        if key == "targets" and value is Array:
            m.set(key, value)
            continue
        if key == "deliveryerrors" and value is Array:
            m.set(key, value)
            continue
        if key == "status" and value != null:
            if not _MessageStatus.is_valid(value):
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