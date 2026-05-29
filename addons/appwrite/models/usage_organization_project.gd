class_name AppwriteUsageOrganizationProject
extends RefCounted
## OrganizationProject[br]


const _FIELD_MAP := {
    "projectid": "projectId",
    "bandwidth": "bandwidth",
    "users": "users",
    "executions": "executions",
    "databasesreads": "databasesReads",
    "databaseswrites": "databasesWrites",
    "executionsmbseconds": "executionsMBSeconds",
    "buildsmbseconds": "buildsMBSeconds",
    "storage": "storage",
    "authphonetotal": "authPhoneTotal",
    "authphoneestimate": "authPhoneEstimate",
    "databasesreadstotal": "databasesReadsTotal",
    "databaseswritestotal": "databasesWritesTotal",
    "imagetransformations": "imageTransformations",
    "imagetransformationstotal": "imageTransformationsTotal",
    "screenshotsgenerated": "screenshotsGenerated",
    "screenshotsgeneratedtotal": "screenshotsGeneratedTotal",
    "imaginecredits": "imagineCredits",
    "realtimeconnections": "realtimeConnections",
    "realtimemessages": "realtimeMessages",
    "realtimebandwidth": "realtimeBandwidth",
}

var projectid: String ## projectId
var bandwidth: Array ## Aggregated stats for number of requests.
var users: Array ## Aggregated stats for consumed bandwidth.
var executions: int ## Aggregated stats for function executions.
var databasesreads: Array ## Aggregated stats for database reads.
var databaseswrites: Array ## Aggregated stats for database writes.
var executionsmbseconds: int ## Aggregated stats for function executions in mb seconds.
var buildsmbseconds: int ## Aggregated stats for function builds in mb seconds.
var storage: int ## Aggregated stats for number of documents.
var authphonetotal: int ## Aggregated stats for phone authentication.
var authphoneestimate: float ## Aggregated stats for phone authentication estimated cost.
var databasesreadstotal: int ## Aggregated stats for total databases reads.
var databaseswritestotal: int ## Aggregated stats for total databases writes.
var imagetransformations: Array ## Aggregated stats for file transformations.
var imagetransformationstotal: int ## Aggregated stats for total file transformations.
var screenshotsgenerated: Array ## Aggregated stats for file transformations.
var screenshotsgeneratedtotal: int ## Aggregated stats for total file transformations.
var imaginecredits: int ## Aggregated stats for imagine credits.
var realtimeconnections: int ## Aggregated stats for realtime connections.
var realtimemessages: int ## Aggregated stats for realtime messages.
var realtimebandwidth: int ## Aggregated stats for realtime bandwidth.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteUsageOrganizationProject.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "bandwidth" and value is Array:
            m.set(key, value)
            continue
        if key == "users" and value is Array:
            m.set(key, value)
            continue
        if key == "databasesreads" and value is Array:
            m.set(key, value)
            continue
        if key == "databaseswrites" and value is Array:
            m.set(key, value)
            continue
        if key == "imagetransformations" and value is Array:
            m.set(key, value)
            continue
        if key == "screenshotsgenerated" and value is Array:
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