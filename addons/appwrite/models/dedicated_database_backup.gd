class_name AppwriteDedicatedDatabaseBackup
extends RefCounted
## Backup[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "databaseid": "databaseId",
    "projectid": "projectId",
    "xtype": "type",
    "status": "status",
    "sizebytes": "sizeBytes",
    "startedat": "startedAt",
    "completedat": "completedAt",
    "verifiedat": "verifiedAt",
    "expiresat": "expiresAt",
    "error": "error",
}

var id: String ## Backup ID.
var createdat: String ## Backup creation time in ISO 8601 format.
var databaseid: String ## Database ID this backup belongs to.
var projectid: String ## Project ID.
var xtype: String ## Backup type. Possible values: full (complete database snapshot), incremental (changes since last backup), wal (write-ahead log continuous archival).
var status: String ## Backup status. Possible values: pending (queued for processing), running (currently in progress), completed (successfully finished), failed (encountered an error), verified (integrity check passed).
var sizebytes: int ## Backup size in bytes.
var startedat: String ## Backup start time in ISO 8601 format.
var completedat: String ## Backup completion time in ISO 8601 format.
var verifiedat: String ## Backup verification time in ISO 8601 format.
var expiresat: String ## Backup expiration time in ISO 8601 format.
var error: String ## Error message if backup failed.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDedicatedDatabaseBackup.new()

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