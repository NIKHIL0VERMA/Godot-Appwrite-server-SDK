class_name AppwriteAggregationTeam
extends RefCounted
## Team[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "permissions": "$permissions",
    "from": "from",
    "to": "to",
    "usagestorage": "usageStorage",
    "usagetotalstorage": "usageTotalStorage",
    "usagefilesstorage": "usageFilesStorage",
    "usagedeploymentsstorage": "usageDeploymentsStorage",
    "usagebuildsstorage": "usageBuildsStorage",
    "usagedatabasesstorage": "usageDatabasesStorage",
    "usageusers": "usageUsers",
    "usageexecutions": "usageExecutions",
    "usagebandwidth": "usageBandwidth",
    "usagerealtime": "usageRealtime",
    "usagerealtimemessages": "usageRealtimeMessages",
    "usagerealtimebandwidth": "usageRealtimeBandwidth",
    "additionalmembers": "additionalMembers",
    "additionalmemberamount": "additionalMemberAmount",
    "additionalstorageamount": "additionalStorageAmount",
    "additionalusersamount": "additionalUsersAmount",
    "additionalexecutionsamount": "additionalExecutionsAmount",
    "additionalbandwidthamount": "additionalBandwidthAmount",
    "additionalrealtimeamount": "additionalRealtimeAmount",
    "plan": "plan",
    "amount": "amount",
    "breakdown": "breakdown",
    "resources": "resources",
}

var id: String ## Aggregation ID.
var createdat: String ## Aggregation creation time in ISO 8601 format.
var updatedat: String ## Aggregation update date in ISO 8601 format.
var permissions: Array ## Aggregation permissions. [Learn more about permissions](/docs/permissions).
var from: String ## Beginning date of the invoice
var to: String ## End date of the invoice
var usagestorage: int ## Total storage usage
var usagetotalstorage: int ## Total storage usage with builds storage
var usagefilesstorage: int ## Total files storage usage
var usagedeploymentsstorage: int ## Total deployments storage usage
var usagebuildsstorage: int ## Total builds storage usage
var usagedatabasesstorage: int ## Total databases storage usage
var usageusers: int ## Total active users for the billing period
var usageexecutions: int ## Total number of executions for the billing period
var usagebandwidth: int ## Total bandwidth usage for the billing period
var usagerealtime: int ## Peak concurrent realtime connections for the billing period
var usagerealtimemessages: int ## Total realtime messages sent for the billing period
var usagerealtimebandwidth: int ## Total realtime bandwidth usage for the billing period
var additionalmembers: int ## Additional members
var additionalmemberamount: int ## Additional members cost
var additionalstorageamount: int ## Additional storage usage cost
var additionalusersamount: int ## Additional users usage cost.
var additionalexecutionsamount: int ## Additional executions usage cost
var additionalbandwidthamount: int ## Additional bandwidth usage cost
var additionalrealtimeamount: int ## Additional realtime usage cost
var plan: String ## Billing plan
var amount: int ## Aggregated amount
var breakdown: Array ## Aggregation project breakdown
var resources: Array ## Usage resources

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteAggregationTeam.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "permissions" and value is Array:
            m.set(key, value)
            continue
        if key == "breakdown" and value is Array:
            m.set(key, value)
            continue
        if key == "resources" and value is Array:
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