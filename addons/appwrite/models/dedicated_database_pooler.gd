class_name AppwriteDedicatedDatabasePooler
extends RefCounted
## PoolerConfig[br]


const _FIELD_MAP := {
    "enabled": "enabled",
    "mode": "mode",
    "maxconnections": "maxConnections",
    "defaultpoolsize": "defaultPoolSize",
    "port": "port",
    "readwritesplitting": "readWriteSplitting",
    "poolercpurequest": "poolerCpuRequest",
    "poolercpulimit": "poolerCpuLimit",
    "poolermemoryrequest": "poolerMemoryRequest",
    "poolermemorylimit": "poolerMemoryLimit",
}

var enabled: bool ## Whether connection pooling is enabled.
var mode: String ## Connection pool mode. Possible values: transaction (releases connections back to pool after each transaction), session (holds connections for the entire client session).
var maxconnections: int ## Maximum number of pooled connections.
var defaultpoolsize: int ## Default pool size per user.
var port: int ## Pooler listening port.
var readwritesplitting: bool ## Whether SELECTs are routed to HA replicas while writes and locked reads stay on the primary. Active only when HA is enabled.
var poolercpurequest: String ## Effective CPU request applied to the pooler sidecar container (Kubernetes quantity). Returns the proportional default (5% of DB CPU, floor 100m) unless overridden.
var poolercpulimit: String ## Effective CPU limit applied to the pooler sidecar container (Kubernetes quantity). Returns the proportional default (10% of DB CPU, floor 200m) unless overridden.
var poolermemoryrequest: String ## Effective memory request applied to the pooler sidecar container (Kubernetes quantity). Returns the proportional default (7.5% of DB memory, floor 64Mi) unless overridden.
var poolermemorylimit: String ## Effective memory limit applied to the pooler sidecar container (Kubernetes quantity). Returns the proportional default (15% of DB memory, floor 128Mi) unless overridden.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDedicatedDatabasePooler.new()

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