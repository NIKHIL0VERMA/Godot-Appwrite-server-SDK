class_name AppwriteBillingLimits
extends RefCounted
## Limits[br]


const _FIELD_MAP := {
    "bandwidth": "bandwidth",
    "storage": "storage",
    "users": "users",
    "executions": "executions",
    "gbhours": "GBHours",
    "imagetransformations": "imageTransformations",
    "authphone": "authPhone",
    "budgetlimit": "budgetLimit",
}

var bandwidth: int ## Bandwidth limit
var storage: int ## Storage limit
var users: int ## Users limit
var executions: int ## Executions limit
var gbhours: int ## GBHours limit
var imagetransformations: int ## Image transformations limit
var authphone: int ## Auth phone limit
var budgetlimit: int ## Budget limit percentage

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteBillingLimits.new()

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