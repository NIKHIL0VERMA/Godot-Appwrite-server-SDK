class_name AppwriteUsageResources
extends RefCounted
## Resource[br]


const _FIELD_MAP := {
    "xname": "name",
    "value": "value",
    "amount": "amount",
    "rate": "rate",
    "desc": "desc",
    "resourceid": "resourceId",
}

var xname: String ## Invoice name
var value: int ## Invoice value
var amount: float ## Invoice amount
var rate: float ## Invoice rate
var desc: String ## Invoice description
var resourceid: String ## Resource ID

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteUsageResources.new()

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