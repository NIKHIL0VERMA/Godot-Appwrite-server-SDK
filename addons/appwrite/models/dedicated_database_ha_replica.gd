class_name AppwriteDedicatedDatabaseHAReplica
extends RefCounted
## HAReplica[br]


const _FIELD_MAP := {
    "id": "$id",
    "role": "role",
    "status": "status",
    "lagseconds": "lagSeconds",
}

var id: String ## Replica identifier.
var role: String ## Replica role. Possible values: primary (accepts reads and writes), replica (read-only follower).
var status: String ## Replica health status. Possible values: healthy (fully synced), degraded (lagging behind primary), unhealthy (replication broken or unreachable).
var lagseconds: float ## Replication lag in seconds.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDedicatedDatabaseHAReplica.new()

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