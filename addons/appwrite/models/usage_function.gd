class_name AppwriteUsageFunction
extends RefCounted
## UsageFunction[br]


const _FIELD_MAP := {
    "xrange": "range",
    "deploymentstotal": "deploymentsTotal",
    "deploymentsstoragetotal": "deploymentsStorageTotal",
    "buildstotal": "buildsTotal",
    "buildssuccesstotal": "buildsSuccessTotal",
    "buildsfailedtotal": "buildsFailedTotal",
    "buildsstoragetotal": "buildsStorageTotal",
    "buildstimetotal": "buildsTimeTotal",
    "buildstimeaverage": "buildsTimeAverage",
    "buildsmbsecondstotal": "buildsMbSecondsTotal",
    "executionstotal": "executionsTotal",
    "executionstimetotal": "executionsTimeTotal",
    "executionsmbsecondstotal": "executionsMbSecondsTotal",
    "deployments": "deployments",
    "deploymentsstorage": "deploymentsStorage",
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

var xrange: String ## The time range of the usage stats.
var deploymentstotal: int ## Total aggregated number of function deployments.
var deploymentsstoragetotal: int ## Total aggregated sum of function deployments storage.
var buildstotal: int ## Total aggregated number of function builds.
var buildssuccesstotal: int ## Total aggregated number of successful function builds.
var buildsfailedtotal: int ## Total aggregated number of failed function builds.
var buildsstoragetotal: int ## total aggregated sum of function builds storage.
var buildstimetotal: int ## Total aggregated sum of function builds compute time.
var buildstimeaverage: int ## Average builds compute time.
var buildsmbsecondstotal: int ## Total aggregated sum of function builds mbSeconds.
var executionstotal: int ## Total  aggregated number of function executions.
var executionstimetotal: int ## Total aggregated sum of function  executions compute time.
var executionsmbsecondstotal: int ## Total aggregated sum of function executions mbSeconds.
var deployments: Array ## Aggregated number of function deployments per period.
var deploymentsstorage: Array ## Aggregated number of  function deployments storage per period.
var builds: Array ## Aggregated number of function builds per period.
var buildsstorage: Array ## Aggregated sum of function builds storage per period.
var buildstime: Array ## Aggregated sum of function builds compute time per period.
var buildsmbseconds: Array ## Aggregated number of function builds mbSeconds per period.
var executions: Array ## Aggregated number of function executions per period.
var executionstime: Array ## Aggregated number of function executions compute time per period.
var executionsmbseconds: Array ## Aggregated number of function mbSeconds per period.
var buildssuccess: Array ## Aggregated number of successful builds per period.
var buildsfailed: Array ## Aggregated number of failed builds per period.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteUsageFunction.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

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