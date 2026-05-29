class_name AppwriteDedicatedDatabaseBackupStorage
extends RefCounted
## BackupStorageConfig[br]


const _FIELD_MAP := {
    "provider": "provider",
    "bucket": "bucket",
    "region": "region",
    "prefix": "prefix",
    "endpoint": "endpoint",
}

var provider: String ## Storage provider. Possible values: s3 (Amazon S3 or S3-compatible), gcs (Google Cloud Storage), azure (Azure Blob Storage).
var bucket: String ## Storage bucket or container name.
var region: String ## Storage region.
var prefix: String ## Object key prefix for backups.
var endpoint: String ## Custom endpoint for S3-compatible storage.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDedicatedDatabaseBackupStorage.new()

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