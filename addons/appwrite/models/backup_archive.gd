class_name AppwriteBackupArchive
extends RefCounted
## Archive[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "policyid": "policyId",
    "size": "size",
    "status": "status",
    "startedat": "startedAt",
    "migrationid": "migrationId",
    "services": "services",
    "resources": "resources",
    "resourceid": "resourceId",
    "resourcetype": "resourceType",
}

var id: String ## Archive ID.
var createdat: String ## Archive creation time in ISO 8601 format.
var updatedat: String ## Archive update date in ISO 8601 format.
var policyid: String ## Archive policy ID.
var size: int ## Archive size in bytes.
var status: String ## The status of the archive creation. Possible values: pending, processing, uploading, completed, failed, skipped.
var startedat: String ## The backup start time.
var migrationid: String ## Migration ID.
var services: Array ## The services that are backed up by this archive.
var resources: Array ## The resources that are backed up by this archive.
var resourceid: String ## The resource ID to backup. Set only if this archive should backup a single resource.
var resourcetype: String ## The resource type to backup. Set only if this archive should backup a single resource.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteBackupArchive.new()

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