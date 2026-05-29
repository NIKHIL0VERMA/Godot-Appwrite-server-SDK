class_name AppwritePolicyPasswordHistory
extends RefCounted
## Policy Password History[br]


const _FIELD_MAP := {
    "id": "$id",
    "total": "total",
}

var id: String ## Policy ID.
var total: int ## Password history length. A value of 0 means the policy is disabled.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwritePolicyPasswordHistory.new()

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