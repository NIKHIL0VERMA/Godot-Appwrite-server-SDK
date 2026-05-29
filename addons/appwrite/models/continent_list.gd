class_name AppwriteContinentList
extends RefCounted
## Continents List[br]


const _FIELD_MAP := {
    "total": "total",
    "continents": "continents",
}

var total: int ## Total number of continents that matched your query.
var continents: Array ## List of continents.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteContinentList.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "continents" and value is Array:
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