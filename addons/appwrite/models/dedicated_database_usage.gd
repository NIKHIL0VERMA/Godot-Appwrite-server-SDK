class_name AppwriteDedicatedDatabaseUsage
extends RefCounted
## DedicatedDatabase[br]


const _FIELD_MAP := {
    "id": "$id",
    "xrange": "range",
    "provisionedcpu": "provisionedCpu",
    "provisionedmemorybytes": "provisionedMemoryBytes",
    "provisionedstoragebytes": "provisionedStorageBytes",
    "provisionedconnections": "provisionedConnections",
    "computetotal": "computeTotal",
    "storagetotal": "storageTotal",
    "inboundtotal": "inboundTotal",
    "outboundtotal": "outboundTotal",
    "connectionstotal": "connectionsTotal",
    "coldstartstotal": "coldStartsTotal",
    "cputotal": "cpuTotal",
    "memorytotal": "memoryTotal",
    "qpstotal": "qpsTotal",
    "iopsreadtotal": "iopsReadTotal",
    "iopswritetotal": "iopsWriteTotal",
    "compute": "compute",
    "storage": "storage",
    "inbound": "inbound",
    "outbound": "outbound",
    "connections": "connections",
    "coldstarts": "coldStarts",
    "cpu": "cpu",
    "memory": "memory",
    "qps": "qps",
    "iopsread": "iopsRead",
    "iopswrite": "iopsWrite",
}

var id: String ## Database ID.
var xrange: String ## The time range of the usage stats.
var provisionedcpu: float ## Provisioned CPU cores for the database specification.
var provisionedmemorybytes: int ## Provisioned memory in bytes for the database specification.
var provisionedstoragebytes: int ## Provisioned storage in bytes for the database specification.
var provisionedconnections: int ## Maximum concurrent connections allowed by the database specification.
var computetotal: int ## Total aggregated compute time in milliseconds.
var storagetotal: int ## Total aggregated storage used in bytes.
var inboundtotal: int ## Total aggregated inbound network traffic in bytes.
var outboundtotal: int ## Total aggregated outbound network traffic in bytes.
var connectionstotal: int ## Total aggregated number of database connections.
var coldstartstotal: int ## Total aggregated number of cold starts.
var cputotal: float ## Latest CPU usage percent (0-100).
var memorytotal: float ## Latest memory usage percent (0-100).
var qpstotal: float ## Latest queries per second.
var iopsreadtotal: float ## Latest read IOPS.
var iopswritetotal: float ## Latest write IOPS.
var compute: Array ## Aggregated compute time per period in milliseconds.
var storage: Array ## Aggregated storage used per period in bytes.
var inbound: Array ## Aggregated inbound network traffic per period in bytes.
var outbound: Array ## Aggregated outbound network traffic per period in bytes.
var connections: Array ## Aggregated number of database connections per period.
var coldstarts: Array ## Aggregated number of cold starts per period.
var cpu: Array ## CPU usage percent per period.
var memory: Array ## Memory usage percent per period.
var qps: Array ## Queries per second per period.
var iopsread: Array ## Read IOPS per period.
var iopswrite: Array ## Write IOPS per period.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDedicatedDatabaseUsage.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "compute" and value is Array:
            m.set(key, value)
            continue
        if key == "storage" and value is Array:
            m.set(key, value)
            continue
        if key == "inbound" and value is Array:
            m.set(key, value)
            continue
        if key == "outbound" and value is Array:
            m.set(key, value)
            continue
        if key == "connections" and value is Array:
            m.set(key, value)
            continue
        if key == "coldstarts" and value is Array:
            m.set(key, value)
            continue
        if key == "cpu" and value is Array:
            m.set(key, value)
            continue
        if key == "memory" and value is Array:
            m.set(key, value)
            continue
        if key == "qps" and value is Array:
            m.set(key, value)
            continue
        if key == "iopsread" and value is Array:
            m.set(key, value)
            continue
        if key == "iopswrite" and value is Array:
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