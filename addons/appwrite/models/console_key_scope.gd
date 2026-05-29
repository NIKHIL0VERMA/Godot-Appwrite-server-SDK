class_name AppwriteConsoleKeyScope
extends RefCounted
## Console Key Scope[br]


const _FIELD_MAP := {
    "id": "$id",
    "description": "description",
    "category": "category",
    "deprecated": "deprecated",
}

var id: String ## Scope ID.
var description: String ## Scope description.
var category: String ## Scope category.
var deprecated: bool ## Scope is deprecated.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteConsoleKeyScope.new()

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