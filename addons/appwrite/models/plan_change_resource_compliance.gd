class_name AppwritePlanChangeResourceCompliance
extends RefCounted
## PlanChangeResourceCompliance[br]


const _FIELD_MAP := {
    "xtype": "type",
    "currentusage": "currentUsage",
    "limit": "limit",
    "status": "status",
    "excess": "excess",
    "resolutionhint": "resolutionHint",
}

var xtype: String ## Resource type
var currentusage: int ## Current usage count
var limit: int ## Allowed limit in target plan
var status: String ## Compliance status
var excess: int ## Number of resources exceeding the limit
var resolutionhint: String ## Suggestion for resolving the compliance issue

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwritePlanChangeResourceCompliance.new()

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