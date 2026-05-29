class_name AppwriteDatabaseStatus
extends RefCounted
## Status[br]


const _FIELD_MAP := {
    "health": "health",
    "ready": "ready",
    "engine": "engine",
    "version": "version",
    "uptime": "uptime",
    "connections": "connections",
    "replicas": "replicas",
    "volumes": "volumes",
}

var health: String ## Overall health status: healthy, degraded, or unhealthy.
var ready: bool ## Whether the database is ready to accept connections.
var engine: String ## Database engine: postgres, mysql, mariadb, or mongodb.
var version: String ## Database engine version.
var uptime: int ## Database uptime in seconds.
var connections: Dictionary ## Connection statistics.
var replicas: Array ## List of database replicas and their status.
var volumes: Array ## Storage volume information.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDatabaseStatus.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "replicas" and value is Array:
            m.set(key, value)
            continue
        if key == "volumes" and value is Array:
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