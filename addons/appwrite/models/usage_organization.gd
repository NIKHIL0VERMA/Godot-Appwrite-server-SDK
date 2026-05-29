class_name AppwriteUsageOrganization
extends RefCounted
## Organization[br]


const _FIELD_MAP := {
    "bandwidth": "bandwidth",
    "users": "users",
    "executions": "executions",
    "databasesreads": "databasesReads",
    "databaseswrites": "databasesWrites",
    "imagetransformations": "imageTransformations",
    "imagetransformationstotal": "imageTransformationsTotal",
    "screenshotsgenerated": "screenshotsGenerated",
    "screenshotsgeneratedtotal": "screenshotsGeneratedTotal",
    "imaginecredits": "imagineCredits",
    "imaginecreditstotal": "imagineCreditsTotal",
    "userstotal": "usersTotal",
    "executionstotal": "executionsTotal",
    "executionsmbsecondstotal": "executionsMBSecondsTotal",
    "buildsmbsecondstotal": "buildsMBSecondsTotal",
    "filesstoragetotal": "filesStorageTotal",
    "buildsstoragetotal": "buildsStorageTotal",
    "deploymentsstoragetotal": "deploymentsStorageTotal",
    "databasesstoragetotal": "databasesStorageTotal",
    "databasesreadstotal": "databasesReadsTotal",
    "databaseswritestotal": "databasesWritesTotal",
    "backupsstoragetotal": "backupsStorageTotal",
    "storagetotal": "storageTotal",
    "authphonetotal": "authPhoneTotal",
    "authphoneestimate": "authPhoneEstimate",
    "projects": "projects",
    "realtimeconnections": "realtimeConnections",
    "realtimeconnectionstotal": "realtimeConnectionsTotal",
    "realtimemessages": "realtimeMessages",
    "realtimemessagestotal": "realtimeMessagesTotal",
    "realtimebandwidth": "realtimeBandwidth",
    "realtimebandwidthtotal": "realtimeBandwidthTotal",
}

var bandwidth: Array ## Aggregated stats for number of requests.
var users: Array ## Aggregated stats for consumed bandwidth.
var executions: Array ## Aggregated stats for function executions.
var databasesreads: Array ## Aggregated stats for database reads.
var databaseswrites: Array ## Aggregated stats for database writes.
var imagetransformations: Array ## Aggregated stats for file transformations.
var imagetransformationstotal: int ## Aggregated stats for total file transformations.
var screenshotsgenerated: Array ## Aggregated stats for file transformations.
var screenshotsgeneratedtotal: int ## Aggregated stats for total file transformations.
var imaginecredits: Array ## Aggregated stats for imagine credits.
var imaginecreditstotal: int ## Aggregated stats for total imagine credits.
var userstotal: int ## Aggregated stats for total users.
var executionstotal: int ## Aggregated stats for total executions.
var executionsmbsecondstotal: int ## Aggregated stats for function executions in mb seconds.
var buildsmbsecondstotal: int ## Aggregated stats for function builds in mb seconds.
var filesstoragetotal: int ## Aggregated stats for total file storage.
var buildsstoragetotal: int ## Aggregated stats for total builds storage.
var deploymentsstoragetotal: int ## Aggregated stats for total deployments storage.
var databasesstoragetotal: int ## Aggregated stats for total databases storage.
var databasesreadstotal: int ## Aggregated stats for total databases  reads.
var databaseswritestotal: int ## Aggregated stats for total databases  writes.
var backupsstoragetotal: int ## Aggregated stats for total backups storage.
var storagetotal: int ## Aggregated stats for total storage.
var authphonetotal: int ## Aggregated stats for total auth phone.
var authphoneestimate: int ## Aggregated stats for total auth phone estimation.
var projects: Array ## Aggregated stats for each projects.
var realtimeconnections: Array ## Aggregated stats for realtime connections.
var realtimeconnectionstotal: int ## Aggregated stats for total realtime connections.
var realtimemessages: Array ## Aggregated stats for realtime messages.
var realtimemessagestotal: int ## Aggregated stats for total realtime messages.
var realtimebandwidth: Array ## Aggregated stats for realtime bandwidth.
var realtimebandwidthtotal: int ## Aggregated stats for total realtime bandwidth.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteUsageOrganization.new()

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
        if key == "executions" and value is Array:
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
        if key == "imaginecredits" and value is Array:
            m.set(key, value)
            continue
        if key == "projects" and value is Array:
            m.set(key, value)
            continue
        if key == "realtimeconnections" and value is Array:
            m.set(key, value)
            continue
        if key == "realtimemessages" and value is Array:
            m.set(key, value)
            continue
        if key == "realtimebandwidth" and value is Array:
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