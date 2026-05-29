class_name AppwriteUsageTable
extends RefCounted
## UsageTable[br]


const _FIELD_MAP := {
    "xrange": "range",
    "rowstotal": "rowsTotal",
    "rows": "rows",
}

var xrange: String ## Time range of the usage stats.
var rowstotal: int ## Total aggregated number of of rows.
var rows: Array ## Aggregated  number of rows per period.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteUsageTable.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "rows" and value is Array:
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