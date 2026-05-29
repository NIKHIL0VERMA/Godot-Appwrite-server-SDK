class_name AppwriteDedicatedDatabaseRestoration
extends RefCounted
## Restoration[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "databaseid": "databaseId",
    "projectid": "projectId",
    "backupid": "backupId",
    "xtype": "type",
    "status": "status",
    "targettime": "targetTime",
    "startedat": "startedAt",
    "completedat": "completedAt",
    "error": "error",
}

var id: String ## Restoration ID.
var createdat: String ## Restoration creation time in ISO 8601 format.
var databaseid: String ## Database ID being restored.
var projectid: String ## Project ID.
var backupid: String ## Backup ID used for restoration (null for PITR).
var xtype: String ## Restoration type. Possible values: backup (restore from a specific backup snapshot), pitr (point-in-time recovery to a specific timestamp).
var status: String ## Restoration status. Possible values: pending (queued for processing), running (currently in progress), completed (successfully finished), failed (encountered an error).
var targettime: String ## Target time for PITR restoration in ISO 8601 format.
var startedat: String ## Restoration start time in ISO 8601 format.
var completedat: String ## Restoration completion time in ISO 8601 format.
var error: String ## Error message if restoration failed.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDedicatedDatabaseRestoration.new()

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