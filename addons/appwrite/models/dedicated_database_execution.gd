class_name AppwriteDedicatedDatabaseExecution
extends RefCounted
## Execution[br]


const _FIELD_MAP := {
    "rows": "rows",
    "rowcount": "rowCount",
    "columns": "columns",
    "durationms": "durationMs",
    "truncated": "truncated",
    "bytes": "bytes",
}

var rows: Dictionary ## Result rows as a list of column-name =&gt; value maps. Empty for non-returning statements.
var rowcount: int ## Number of rows returned (for SELECT) or affected (for INSERT/UPDATE/DELETE).
var columns: Array ## Column metadata in result-set order.
var durationms: int ## Server-side execution time in milliseconds.
var truncated: bool ## True when the configured row or byte cap was hit and the result was truncated.
var bytes: int ## Serialised payload size in bytes.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDedicatedDatabaseExecution.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "columns" and value is Array:
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