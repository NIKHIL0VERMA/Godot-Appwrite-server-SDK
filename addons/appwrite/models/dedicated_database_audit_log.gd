class_name AppwriteDedicatedDatabaseAuditLog
extends RefCounted
## AuditLog[br]


const _FIELD_MAP := {
    "timestamp": "timestamp",
    "user": "user",
    "database": "database",
    "action": "action",
    "object": "object",
    "statement": "statement",
    "clientaddress": "clientAddress",
}

var timestamp: String ## When the event occurred.
var user: String ## Database user that performed the action.
var database: String ## Database name.
var action: String ## The action performed (e.g., CREATE TABLE, DROP INDEX).
var object: String ## The database object affected.
var statement: String ## The full SQL statement.
var clientaddress: String ## Client IP address.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDedicatedDatabaseAuditLog.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

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