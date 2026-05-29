class_name AppwriteBackupPolicy
extends RefCounted
## backup[br]


const _FIELD_MAP := {
    "id": "$id",
    "xname": "name",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "services": "services",
    "resources": "resources",
    "resourceid": "resourceId",
    "resourcetype": "resourceType",
    "retention": "retention",
    "schedule": "schedule",
    "enabled": "enabled",
}

var id: String ## Backup policy ID.
var xname: String ## Backup policy name.
var createdat: String ## Policy creation date in ISO 8601 format.
var updatedat: String ## Policy update date in ISO 8601 format.
var services: Array ## The services that are backed up by this policy.
var resources: Array ## The resources that are backed up by this policy.
var resourceid: String ## The resource ID to backup. Set only if this policy should backup a single resource.
var resourcetype: String ## The resource type to backup. Set only if this policy should backup a single resource.
var retention: int ## How many days to keep the backup before it will be automatically deleted.
var schedule: String ## Policy backup schedule in CRON format.
var enabled: bool ## Is this policy enabled.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteBackupPolicy.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "services" and value is Array:
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