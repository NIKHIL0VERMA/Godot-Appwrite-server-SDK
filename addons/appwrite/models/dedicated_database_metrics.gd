class_name AppwriteDedicatedDatabaseMetrics
extends RefCounted
## DatabaseMetrics[br]


const _FIELD_MAP := {
    "period": "period",
    "cpupercent": "cpuPercent",
    "memorypercent": "memoryPercent",
    "memoryusedbytes": "memoryUsedBytes",
    "memorymaxbytes": "memoryMaxBytes",
    "storageusedbytes": "storageUsedBytes",
    "connectionsactive": "connectionsActive",
    "connectionsmax": "connectionsMax",
    "iopsread": "iopsRead",
    "iopswrite": "iopsWrite",
    "qps": "qps",
}

var period: String ## Metrics aggregation period. Possible values: 1h (last hour), 24h (last 24 hours), 7d (last 7 days), 30d (last 30 days).
var cpupercent: float ## Average CPU usage percentage.
var memorypercent: float ## Average memory usage percentage.
var memoryusedbytes: int ## Memory used in bytes.
var memorymaxbytes: int ## Maximum memory available in bytes.
var storageusedbytes: int ## Storage used in bytes.
var connectionsactive: int ## Current active connections.
var connectionsmax: int ## Maximum connections configured.
var iopsread: float ## Average read IOPS.
var iopswrite: float ## Average write IOPS.
var qps: float ## Queries per second.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDedicatedDatabaseMetrics.new()

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