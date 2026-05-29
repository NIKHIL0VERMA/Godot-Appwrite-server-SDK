class_name AppwritePolicyPasswordPersonalData
extends RefCounted
## Policy Password Personal Data[br]


const _FIELD_MAP := {
    "id": "$id",
    "enabled": "enabled",
}

var id: String ## Policy ID.
var enabled: bool ## Whether password personal data policy is enabled.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwritePolicyPasswordPersonalData.new()

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