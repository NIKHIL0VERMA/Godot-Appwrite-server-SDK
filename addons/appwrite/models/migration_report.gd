class_name AppwriteMigrationReport
extends RefCounted
## Migration Report[br]


const _FIELD_MAP := {
    "user": "user",
    "team": "team",
    "database": "database",
    "row": "row",
    "file": "file",
    "bucket": "bucket",
    "function": "function",
    "platform": "platform",
    "site": "site",
    "provider": "provider",
    "topic": "topic",
    "subscriber": "subscriber",
    "message": "message",
    "size": "size",
    "version": "version",
    "backup_policy": "backup-policy",
}

var user: int ## Number of users to be migrated.
var team: int ## Number of teams to be migrated.
var database: int ## Number of databases to be migrated.
var row: int ## Number of rows to be migrated.
var file: int ## Number of files to be migrated.
var bucket: int ## Number of buckets to be migrated.
var function: int ## Number of functions to be migrated.
var platform: int ## Number of platforms to be migrated.
var site: int ## Number of sites to be migrated.
var provider: int ## Number of providers to be migrated.
var topic: int ## Number of topics to be migrated.
var subscriber: int ## Number of subscribers to be migrated.
var message: int ## Number of messages to be migrated.
var size: int ## Size of files to be migrated in mb.
var version: String ## Version of the Appwrite instance to be migrated.
var backup_policy: int ## Number of backup policies to be migrated.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteMigrationReport.new()

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