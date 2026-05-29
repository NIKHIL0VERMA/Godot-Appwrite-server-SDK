class_name AppwriteUsageSites
extends RefCounted
## UsageSites[br]


const _FIELD_MAP := {
    "xrange": "range",
    "sitestotal": "sitesTotal",
    "sites": "sites",
    "deploymentstotal": "deploymentsTotal",
    "deploymentsstoragetotal": "deploymentsStorageTotal",
    "buildstotal": "buildsTotal",
    "buildsstoragetotal": "buildsStorageTotal",
    "buildstimetotal": "buildsTimeTotal",
    "buildsmbsecondstotal": "buildsMbSecondsTotal",
    "executionstotal": "executionsTotal",
    "executionstimetotal": "executionsTimeTotal",
    "executionsmbsecondstotal": "executionsMbSecondsTotal",
    "requeststotal": "requestsTotal",
    "requests": "requests",
    "inboundtotal": "inboundTotal",
    "inbound": "inbound",
    "outboundtotal": "outboundTotal",
    "outbound": "outbound",
    "deployments": "deployments",
    "deploymentsstorage": "deploymentsStorage",
    "buildssuccesstotal": "buildsSuccessTotal",
    "buildsfailedtotal": "buildsFailedTotal",
    "builds": "builds",
    "buildsstorage": "buildsStorage",
    "buildstime": "buildsTime",
    "buildsmbseconds": "buildsMbSeconds",
    "executions": "executions",
    "executionstime": "executionsTime",
    "executionsmbseconds": "executionsMbSeconds",
    "buildssuccess": "buildsSuccess",
    "buildsfailed": "buildsFailed",
}

var xrange: String ## Time range of the usage stats.
var sitestotal: int ## Total aggregated number of sites.
var sites: Array ## Aggregated number of sites per period.
var deploymentstotal: int ## Total aggregated number of sites deployments.
var deploymentsstoragetotal: int ## Total aggregated sum of sites deployment storage.
var buildstotal: int ## Total aggregated number of sites build.
var buildsstoragetotal: int ## total aggregated sum of sites build storage.
var buildstimetotal: int ## Total aggregated sum of sites build compute time.
var buildsmbsecondstotal: int ## Total aggregated sum of sites build mbSeconds.
var executionstotal: int ## Total  aggregated number of sites execution.
var executionstimetotal: int ## Total aggregated sum of sites  execution compute time.
var executionsmbsecondstotal: int ## Total aggregated sum of sites execution mbSeconds.
var requeststotal: int ## Total aggregated number of requests.
var requests: Array ## Aggregated number of requests per period.
var inboundtotal: int ## Total aggregated inbound bandwidth.
var inbound: Array ## Aggregated number of inbound bandwidth per period.
var outboundtotal: int ## Total aggregated outbound bandwidth.
var outbound: Array ## Aggregated number of outbound bandwidth per period.
var deployments: Array ## Aggregated number of sites deployment per period.
var deploymentsstorage: Array ## Aggregated number of  sites deployment storage per period.
var buildssuccesstotal: int ## Total aggregated number of successful site builds.
var buildsfailedtotal: int ## Total aggregated number of failed site builds.
var builds: Array ## Aggregated number of sites build per period.
var buildsstorage: Array ## Aggregated sum of sites build storage per period.
var buildstime: Array ## Aggregated sum of  sites build compute time per period.
var buildsmbseconds: Array ## Aggregated sum of sites build mbSeconds per period.
var executions: Array ## Aggregated number of  sites execution per period.
var executionstime: Array ## Aggregated number of sites execution compute time per period.
var executionsmbseconds: Array ## Aggregated number of sites mbSeconds per period.
var buildssuccess: Array ## Aggregated number of successful site builds per period.
var buildsfailed: Array ## Aggregated number of failed site builds per period.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteUsageSites.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "sites" and value is Array:
            m.set(key, value)
            continue
        if key == "requests" and value is Array:
            m.set(key, value)
            continue
        if key == "inbound" and value is Array:
            m.set(key, value)
            continue
        if key == "outbound" and value is Array:
            m.set(key, value)
            continue
        if key == "deployments" and value is Array:
            m.set(key, value)
            continue
        if key == "deploymentsstorage" and value is Array:
            m.set(key, value)
            continue
        if key == "builds" and value is Array:
            m.set(key, value)
            continue
        if key == "buildsstorage" and value is Array:
            m.set(key, value)
            continue
        if key == "buildstime" and value is Array:
            m.set(key, value)
            continue
        if key == "buildsmbseconds" and value is Array:
            m.set(key, value)
            continue
        if key == "executions" and value is Array:
            m.set(key, value)
            continue
        if key == "executionstime" and value is Array:
            m.set(key, value)
            continue
        if key == "executionsmbseconds" and value is Array:
            m.set(key, value)
            continue
        if key == "buildssuccess" and value is Array:
            m.set(key, value)
            continue
        if key == "buildsfailed" and value is Array:
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