class_name AppwriteMigration
extends RefCounted
## Migration[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "status": "status",
    "stage": "stage",
    "source": "source",
    "destination": "destination",
    "resources": "resources",
    "resourceid": "resourceId",
    "statuscounters": "statusCounters",
    "resourcedata": "resourceData",
    "errors": "errors",
    "options": "options",
}

var id: String ## Migration ID.
var createdat: String ## Migration creation date in ISO 8601 format.
var updatedat: String ## Variable creation date in ISO 8601 format.
var status: String ## Migration status ( pending, processing, failed, completed ) 
var stage: String ## Migration stage ( init, processing, source-check, destination-check, migrating, finished )
var source: String ## A string containing the type of source of the migration.
var destination: String ## A string containing the type of destination of the migration.
var resources: Array ## Resources to migrate.
var resourceid: String ## Id of the resource to migrate.
var statuscounters: Dictionary ## A group of counters that represent the total progress of the migration.
var resourcedata: Dictionary ## An array of objects containing the report data of the resources that were migrated.
var errors: Array ## All errors that occurred during the migration process.
var options: Dictionary ## Migration options used during the migration process.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteMigration.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "resources" and value is Array:
            m.set(key, value)
            continue
        if key == "errors" and value is Array:
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