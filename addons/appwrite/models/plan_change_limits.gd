class_name AppwritePlanChangeLimits
extends RefCounted
## PlanChangeLimits[br]


const _FIELD_MAP := {
    "totalprojects": "totalProjects",
    "noncompliantprojects": "nonCompliantProjects",
    "canchangeplan": "canChangePlan",
    "projects": "projects",
    "unsupportedaddons": "unsupportedAddons",
}

var totalprojects: int ## Total number of projects in the organization
var noncompliantprojects: int ## Number of projects exceeding target plan limits
var canchangeplan: bool ## Whether the plan change is allowed
var projects: Array ## Project compliance details
var unsupportedaddons: Array ## Active addon keys that the target plan does not support. When non-empty, `canChangePlan` is false.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwritePlanChangeLimits.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "projects" and value is Array:
            m.set(key, value)
            continue
        if key == "unsupportedaddons" and value is Array:
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