class_name AppwriteUsageFunctions
extends RefCounted
## UsageFunctions[br]


const _FIELD_MAP := {
    "xrange": "range",
    "functionstotal": "functionsTotal",
    "deploymentstotal": "deploymentsTotal",
    "deploymentsstoragetotal": "deploymentsStorageTotal",
    "buildstotal": "buildsTotal",
    "buildsstoragetotal": "buildsStorageTotal",
    "buildstimetotal": "buildsTimeTotal",
    "buildsmbsecondstotal": "buildsMbSecondsTotal",
    "executionstotal": "executionsTotal",
    "executionstimetotal": "executionsTimeTotal",
    "executionsmbsecondstotal": "executionsMbSecondsTotal",
    "functions": "functions",
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
var functionstotal: int ## Total aggregated number of functions.
var deploymentstotal: int ## Total aggregated number of functions deployments.
var deploymentsstoragetotal: int ## Total aggregated sum of functions deployment storage.
var buildstotal: int ## Total aggregated number of functions build.
var buildsstoragetotal: int ## total aggregated sum of functions build storage.
var buildstimetotal: int ## Total aggregated sum of functions build compute time.
var buildsmbsecondstotal: int ## Total aggregated sum of functions build mbSeconds.
var executionstotal: int ## Total  aggregated number of functions execution.
var executionstimetotal: int ## Total aggregated sum of functions  execution compute time.
var executionsmbsecondstotal: int ## Total aggregated sum of functions execution mbSeconds.
var functions: Array ## Aggregated number of functions per period.
var deployments: Array ## Aggregated number of functions deployment per period.
var deploymentsstorage: Array ## Aggregated number of  functions deployment storage per period.
var buildssuccesstotal: int ## Total aggregated number of successful function builds.
var buildsfailedtotal: int ## Total aggregated number of failed function builds.
var builds: Array ## Aggregated number of functions build per period.
var buildsstorage: Array ## Aggregated sum of functions build storage per period.
var buildstime: Array ## Aggregated sum of  functions build compute time per period.
var buildsmbseconds: Array ## Aggregated sum of functions build mbSeconds per period.
var executions: Array ## Aggregated number of  functions execution per period.
var executionstime: Array ## Aggregated number of functions execution compute time per period.
var executionsmbseconds: Array ## Aggregated number of functions mbSeconds per period.
var buildssuccess: Array ## Aggregated number of successful function builds per period.
var buildsfailed: Array ## Aggregated number of failed function builds per period.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteUsageFunctions.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "functions" and value is Array:
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