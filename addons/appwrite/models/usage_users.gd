class_name AppwriteUsageUsers
extends RefCounted
## UsageUsers[br]


const _FIELD_MAP := {
    "xrange": "range",
    "userstotal": "usersTotal",
    "sessionstotal": "sessionsTotal",
    "users": "users",
    "sessions": "sessions",
}

var xrange: String ## Time range of the usage stats.
var userstotal: int ## Total aggregated number of statistics of users.
var sessionstotal: int ## Total aggregated number of active sessions.
var users: Array ## Aggregated number of users per period.
var sessions: Array ## Aggregated number of active sessions  per period.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteUsageUsers.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "users" and value is Array:
            m.set(key, value)
            continue
        if key == "sessions" and value is Array:
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