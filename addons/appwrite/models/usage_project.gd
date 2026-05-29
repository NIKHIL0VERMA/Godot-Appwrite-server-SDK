class_name AppwriteUsageProject
extends RefCounted
## Project[br]


const _FIELD_MAP := {
    "executionstotal": "executionsTotal",
    "documentstotal": "documentsTotal",
    "documentsdbdocumentstotal": "documentsdbDocumentsTotal",
    "rowstotal": "rowsTotal",
    "databasestotal": "databasesTotal",
    "documentsdbtotal": "documentsdbTotal",
    "databasesstoragetotal": "databasesStorageTotal",
    "documentsdbdatabasesstoragetotal": "documentsdbDatabasesStorageTotal",
    "userstotal": "usersTotal",
    "filesstoragetotal": "filesStorageTotal",
    "functionsstoragetotal": "functionsStorageTotal",
    "buildsstoragetotal": "buildsStorageTotal",
    "deploymentsstoragetotal": "deploymentsStorageTotal",
    "bucketstotal": "bucketsTotal",
    "executionsmbsecondstotal": "executionsMbSecondsTotal",
    "buildsmbsecondstotal": "buildsMbSecondsTotal",
    "databasesreadstotal": "databasesReadsTotal",
    "databaseswritestotal": "databasesWritesTotal",
    "documentsdbdatabasesreadstotal": "documentsdbDatabasesReadsTotal",
    "documentsdbdatabaseswritestotal": "documentsdbDatabasesWritesTotal",
    "requests": "requests",
    "network": "network",
    "users": "users",
    "executions": "executions",
    "executionsbreakdown": "executionsBreakdown",
    "bucketsbreakdown": "bucketsBreakdown",
    "databasesstoragebreakdown": "databasesStorageBreakdown",
    "executionsmbsecondsbreakdown": "executionsMbSecondsBreakdown",
    "buildsmbsecondsbreakdown": "buildsMbSecondsBreakdown",
    "functionsstoragebreakdown": "functionsStorageBreakdown",
    "authphonetotal": "authPhoneTotal",
    "authphoneestimate": "authPhoneEstimate",
    "authphonecountrybreakdown": "authPhoneCountryBreakdown",
    "databasesreads": "databasesReads",
    "databaseswrites": "databasesWrites",
    "documentsdbdatabasesreads": "documentsdbDatabasesReads",
    "documentsdbdatabaseswrites": "documentsdbDatabasesWrites",
    "documentsdbdatabasesstorage": "documentsdbDatabasesStorage",
    "imagetransformations": "imageTransformations",
    "imagetransformationstotal": "imageTransformationsTotal",
    "vectorsdbdatabasestotal": "vectorsdbDatabasesTotal",
    "vectorsdbcollectionstotal": "vectorsdbCollectionsTotal",
    "vectorsdbdocumentstotal": "vectorsdbDocumentsTotal",
    "vectorsdbdatabasesstoragetotal": "vectorsdbDatabasesStorageTotal",
    "vectorsdbdatabasesreadstotal": "vectorsdbDatabasesReadsTotal",
    "vectorsdbdatabaseswritestotal": "vectorsdbDatabasesWritesTotal",
    "vectorsdbdatabases": "vectorsdbDatabases",
    "vectorsdbcollections": "vectorsdbCollections",
    "vectorsdbdocuments": "vectorsdbDocuments",
    "vectorsdbdatabasesstorage": "vectorsdbDatabasesStorage",
    "vectorsdbdatabasesreads": "vectorsdbDatabasesReads",
    "vectorsdbdatabaseswrites": "vectorsdbDatabasesWrites",
    "embeddingstext": "embeddingsText",
    "embeddingstexttokens": "embeddingsTextTokens",
    "embeddingstextduration": "embeddingsTextDuration",
    "embeddingstexterrors": "embeddingsTextErrors",
    "embeddingstexttotal": "embeddingsTextTotal",
    "embeddingstexttokenstotal": "embeddingsTextTokensTotal",
    "embeddingstextdurationtotal": "embeddingsTextDurationTotal",
    "embeddingstexterrorstotal": "embeddingsTextErrorsTotal",
    "functionsexecutions": "functionsExecutions",
    "functionsexecutionstotal": "functionsExecutionsTotal",
    "sitesexecutions": "sitesExecutions",
    "sitesexecutionstotal": "sitesExecutionsTotal",
    "networktotal": "networkTotal",
    "backupsstoragetotal": "backupsStorageTotal",
    "screenshotsgenerated": "screenshotsGenerated",
    "screenshotsgeneratedtotal": "screenshotsGeneratedTotal",
    "imaginecredits": "imagineCredits",
    "imaginecreditstotal": "imagineCreditsTotal",
    "realtimeconnectionstotal": "realtimeConnectionsTotal",
    "realtimemessagestotal": "realtimeMessagesTotal",
    "realtimebandwidthtotal": "realtimeBandwidthTotal",
    "realtimeconnections": "realtimeConnections",
    "realtimemessages": "realtimeMessages",
    "realtimebandwidth": "realtimeBandwidth",
}

var executionstotal: int ## Total aggregated number of function executions.
var documentstotal: int ## Total aggregated  number of documents in legacy/tablesdb.
var documentsdbdocumentstotal: int ## Total aggregated  number of documents in documentsdb.
var rowstotal: int ## Total aggregated  number of rows.
var databasestotal: int ## Total aggregated number of databases.
var documentsdbtotal: int ## Total aggregated number of documentsdb.
var databasesstoragetotal: int ## Total aggregated sum of databases storage size (in bytes).
var documentsdbdatabasesstoragetotal: int ## Total aggregated sum of documentsdb databases storage size (in bytes).
var userstotal: int ## Total aggregated number of users.
var filesstoragetotal: int ## Total aggregated sum of files storage size (in bytes).
var functionsstoragetotal: int ## Total aggregated sum of functions storage size (in bytes).
var buildsstoragetotal: int ## Total aggregated sum of builds storage size (in bytes).
var deploymentsstoragetotal: int ## Total aggregated sum of deployments storage size (in bytes).
var bucketstotal: int ## Total aggregated number of buckets.
var executionsmbsecondstotal: int ## Total aggregated number of function executions mbSeconds.
var buildsmbsecondstotal: int ## Total aggregated number of function builds mbSeconds.
var databasesreadstotal: int ## Aggregated stats for total databases reads.
var databaseswritestotal: int ## Aggregated stats for total databases writes.
var documentsdbdatabasesreadstotal: int ## Total number of documentsdb databases reads.
var documentsdbdatabaseswritestotal: int ## Total number of documentsdb databases writes.
var requests: Array ## Aggregated  number of requests per period.
var network: Array ## Aggregated number of consumed bandwidth per period.
var users: Array ## Aggregated number of users per period.
var executions: Array ## Aggregated number of executions per period.
var executionsbreakdown: Array ## Aggregated breakdown in totals of executions by functions.
var bucketsbreakdown: Array ## Aggregated breakdown in totals of usage by buckets.
var databasesstoragebreakdown: Array ## An array of the aggregated breakdown of storage usage by databases.
var executionsmbsecondsbreakdown: Array ## Aggregated breakdown in totals of execution mbSeconds by functions.
var buildsmbsecondsbreakdown: Array ## Aggregated breakdown in totals of build mbSeconds by functions.
var functionsstoragebreakdown: Array ## Aggregated breakdown in totals of functions storage size (in bytes).
var authphonetotal: int ## Aggregated stats for total auth phone.
var authphoneestimate: int ## Aggregated stats for total auth phone estimation.
var authphonecountrybreakdown: Array ## Aggregated breakdown in totals of phone auth by country.
var databasesreads: Array ## Aggregated stats for database reads.
var databaseswrites: Array ## Aggregated stats for database writes.
var documentsdbdatabasesreads: Array ## An array of aggregated number of documentsdb database reads.
var documentsdbdatabaseswrites: Array ## An array of aggregated number of documentsdb database writes.
var documentsdbdatabasesstorage: Array ## An array of aggregated sum of documentsdb databases storage size (in bytes) per period.
var imagetransformations: Array ## An array of aggregated number of image transformations.
var imagetransformationstotal: int ## Total aggregated number of image transformations.
var vectorsdbdatabasestotal: int ## Total aggregated number of VectorsDB databases.
var vectorsdbcollectionstotal: int ## Total aggregated number of VectorsDB collections.
var vectorsdbdocumentstotal: int ## Total aggregated number of VectorsDB documents.
var vectorsdbdatabasesstoragetotal: int ## Total aggregated VectorsDB storage (bytes).
var vectorsdbdatabasesreadstotal: int ## Total aggregated number of VectorsDB reads.
var vectorsdbdatabaseswritestotal: int ## Total aggregated number of VectorsDB writes.
var vectorsdbdatabases: Array ## Aggregated VectorsDB databases per period.
var vectorsdbcollections: Array ## Aggregated VectorsDB collections per period.
var vectorsdbdocuments: Array ## Aggregated VectorsDB documents per period.
var vectorsdbdatabasesstorage: Array ## Aggregated VectorsDB storage per period.
var vectorsdbdatabasesreads: Array ## Aggregated VectorsDB reads per period.
var vectorsdbdatabaseswrites: Array ## Aggregated VectorsDB writes per period.
var embeddingstext: Dictionary ## Aggregated number of text embedding calls per period.
var embeddingstexttokens: Dictionary ## Aggregated number of tokens processed by text embeddings per period.
var embeddingstextduration: Dictionary ## Aggregated duration spent generating text embeddings per period.
var embeddingstexterrors: Dictionary ## Aggregated number of errors while generating text embeddings per period.
var embeddingstexttotal: Dictionary ## Total aggregated number of text embedding calls.
var embeddingstexttokenstotal: Dictionary ## Total aggregated number of tokens processed by text.
var embeddingstextdurationtotal: Dictionary ## Total aggregated duration spent generating text embeddings.
var embeddingstexterrorstotal: Dictionary ## Total aggregated number of errors while generating text embeddings.
var functionsexecutions: Array ## Aggregated number of function executions per period.
var functionsexecutionstotal: int ## Total aggregated number of function executions.
var sitesexecutions: Array ## Aggregated number of site executions per period.
var sitesexecutionstotal: int ## Total aggregated number of site executions.
var networktotal: int ## Aggregated stats for total network bandwidth.
var backupsstoragetotal: int ## Aggregated stats for total backups storage.
var screenshotsgenerated: Array ## An array of aggregated number of screenshots generated.
var screenshotsgeneratedtotal: int ## Total aggregated number of screenshots generated.
var imaginecredits: Array ## An array of aggregated number of Imagine credits in the given period.
var imaginecreditstotal: int ## Total aggregated number of Imagine credits.
var realtimeconnectionstotal: int ## Current aggregated number of open Realtime connections.
var realtimemessagestotal: int ## Total number of Realtime messages sent to clients.
var realtimebandwidthtotal: int ## Total consumed Realtime bandwidth (in bytes).
var realtimeconnections: Array ## Aggregated number of open Realtime connections per period.
var realtimemessages: Array ## Aggregated number of Realtime messages sent to clients per period.
var realtimebandwidth: Array ## Aggregated consumed Realtime bandwidth (in bytes) per period.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteUsageProject.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "requests" and value is Array:
            m.set(key, value)
            continue
        if key == "network" and value is Array:
            m.set(key, value)
            continue
        if key == "users" and value is Array:
            m.set(key, value)
            continue
        if key == "executions" and value is Array:
            m.set(key, value)
            continue
        if key == "executionsbreakdown" and value is Array:
            m.set(key, value)
            continue
        if key == "bucketsbreakdown" and value is Array:
            m.set(key, value)
            continue
        if key == "databasesstoragebreakdown" and value is Array:
            m.set(key, value)
            continue
        if key == "executionsmbsecondsbreakdown" and value is Array:
            m.set(key, value)
            continue
        if key == "buildsmbsecondsbreakdown" and value is Array:
            m.set(key, value)
            continue
        if key == "functionsstoragebreakdown" and value is Array:
            m.set(key, value)
            continue
        if key == "authphonecountrybreakdown" and value is Array:
            m.set(key, value)
            continue
        if key == "databasesreads" and value is Array:
            m.set(key, value)
            continue
        if key == "databaseswrites" and value is Array:
            m.set(key, value)
            continue
        if key == "documentsdbdatabasesreads" and value is Array:
            m.set(key, value)
            continue
        if key == "documentsdbdatabaseswrites" and value is Array:
            m.set(key, value)
            continue
        if key == "documentsdbdatabasesstorage" and value is Array:
            m.set(key, value)
            continue
        if key == "imagetransformations" and value is Array:
            m.set(key, value)
            continue
        if key == "vectorsdbdatabases" and value is Array:
            m.set(key, value)
            continue
        if key == "vectorsdbcollections" and value is Array:
            m.set(key, value)
            continue
        if key == "vectorsdbdocuments" and value is Array:
            m.set(key, value)
            continue
        if key == "vectorsdbdatabasesstorage" and value is Array:
            m.set(key, value)
            continue
        if key == "vectorsdbdatabasesreads" and value is Array:
            m.set(key, value)
            continue
        if key == "vectorsdbdatabaseswrites" and value is Array:
            m.set(key, value)
            continue
        if key == "functionsexecutions" and value is Array:
            m.set(key, value)
            continue
        if key == "sitesexecutions" and value is Array:
            m.set(key, value)
            continue
        if key == "screenshotsgenerated" and value is Array:
            m.set(key, value)
            continue
        if key == "imaginecredits" and value is Array:
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