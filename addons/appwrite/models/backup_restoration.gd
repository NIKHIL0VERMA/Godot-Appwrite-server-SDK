class_name AppwriteBackupRestoration
extends RefCounted
## Restoration[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "archiveid": "archiveId",
    "policyid": "policyId",
    "status": "status",
    "startedat": "startedAt",
    "migrationid": "migrationId",
    "services": "services",
    "resources": "resources",
    "options": "options",
}

var id: String ## Restoration ID.
var createdat: String ## Restoration creation time in ISO 8601 format.
var updatedat: String ## Restoration update date in ISO 8601 format.
var archiveid: String ## Backup archive ID.
var policyid: String ## Backup policy ID.
var status: String ## The status of the restoration. Possible values: pending, downloading, processing, completed, failed.
var startedat: String ## The backup start time.
var migrationid: String ## Migration ID.
var services: Array ## The services that are backed up by this policy.
var resources: Array ## The resources that are backed up by this policy.
var options: String ## Optional data in key-value object. 

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteBackupRestoration.new()

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