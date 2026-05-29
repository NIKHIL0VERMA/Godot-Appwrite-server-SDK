class_name AppwriteSchedule
extends RefCounted
## Schedule[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "resourcetype": "resourceType",
    "resourceid": "resourceId",
    "resourceupdatedat": "resourceUpdatedAt",
    "projectid": "projectId",
    "schedule": "schedule",
    "data": "data",
    "active": "active",
    "region": "region",
}

var id: String ## Schedule ID.
var createdat: String ## Schedule creation date in ISO 8601 format.
var updatedat: String ## Schedule update date in ISO 8601 format.
var resourcetype: String ## The resource type associated with this schedule.
var resourceid: String ## The resource ID associated with this schedule.
var resourceupdatedat: String ## Change-tracking timestamp used by the scheduler to detect resource changes in ISO 8601 format.
var projectid: String ## The project ID associated with this schedule.
var schedule: String ## The CRON schedule expression.
var data: Dictionary ## Schedule data used to store resource-specific context needed for execution.
var active: bool ## Whether the schedule is active.
var region: String ## The region where the schedule is deployed.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteSchedule.new()

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