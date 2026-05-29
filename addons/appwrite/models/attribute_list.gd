class_name AppwriteAttributeList
extends RefCounted
## Attributes List[br]


const _FIELD_MAP := {
    "total": "total",
    "attributes": "attributes",
}

var total: int ## Total number of attributes in the given collection.
var attributes: Array ## List of attributes.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteAttributeList.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "attributes" and value is Array:
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