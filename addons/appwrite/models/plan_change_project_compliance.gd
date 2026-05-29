class_name AppwritePlanChangeProjectCompliance
extends RefCounted
## PlanChangeProjectCompliance[br]


const _FIELD_MAP := {
    "id": "$id",
    "xname": "name",
    "iscompliant": "isCompliant",
    "resources": "resources",
    "error": "error",
}

var id: String ## Project ID
var xname: String ## Project name
var iscompliant: bool ## Whether the project complies with target plan limits
var resources: Array ## Resource compliance details
var error: String ## Failure reason when compliance could not be evaluated. Present only when the project DB or Regions API was unreachable; in that case `isCompliant` is false (fail closed) and `resources` is empty.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwritePlanChangeProjectCompliance.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "resources" and value is Array:
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