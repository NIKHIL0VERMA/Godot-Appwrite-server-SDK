class_name AppwriteDedicatedDatabaseHAStatus
extends RefCounted
## HAStatus[br]


const _FIELD_MAP := {
    "enabled": "enabled",
    "replicacount": "replicaCount",
    "syncmode": "syncMode",
    "replicas": "replicas",
}

var enabled: bool ## Whether high availability is enabled.
var replicacount: int ## Number of configured replicas.
var syncmode: String ## Replication sync mode. Possible values: async (asynchronous, fastest), sync (synchronous, strong consistency), quorum (quorum-based, majority of replicas must confirm).
var replicas: Array ## List of replica statuses.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDedicatedDatabaseHAStatus.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "replicas" and value is Array:
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