class_name AppwriteDatabaseStatusReplica
extends RefCounted
## Replica[br]


const _FIELD_MAP := {
    "index": "index",
    "role": "role",
    "healthy": "healthy",
    "lagseconds": "lagSeconds",
}

var index: int ## StatefulSet pod index (0 = primary, 1+ = replicas).
var role: String ## Replica role: primary or replica.
var healthy: bool ## Whether the replica is healthy.
var lagseconds: float ## Replication lag in seconds (null for primary).

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDatabaseStatusReplica.new()

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