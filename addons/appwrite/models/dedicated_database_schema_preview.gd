class_name AppwriteDedicatedDatabaseSchemaPreview
extends RefCounted
## SchemaPreview[br]


const _FIELD_MAP := {
    "supportstransactionalddl": "supportsTransactionalDDL",
    "preview": "preview",
    "tables": "tables",
}

var supportstransactionalddl: bool ## Whether the engine supports transactional DDL for safe preview.
var preview: String ## Schema change preview output.
var tables: Array ## List of tables in the database after the change.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDedicatedDatabaseSchemaPreview.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "tables" and value is Array:
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