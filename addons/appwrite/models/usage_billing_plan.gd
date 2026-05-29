class_name AppwriteUsageBillingPlan
extends RefCounted
## usageBillingPlan[br]


const _FIELD_MAP := {
    "bandwidth": "bandwidth",
    "executions": "executions",
    "member": "member",
    "realtime": "realtime",
    "realtimemessages": "realtimeMessages",
    "realtimebandwidth": "realtimeBandwidth",
    "storage": "storage",
    "users": "users",
    "gbhours": "GBHours",
    "imagetransformations": "imageTransformations",
    "credits": "credits",
}

var bandwidth: Dictionary ## Bandwidth additional resources
var executions: Dictionary ## Executions additional resources
var member: Dictionary ## Member additional resources
var realtime: Dictionary ## Realtime additional resources
var realtimemessages: Dictionary ## Realtime messages additional resources
var realtimebandwidth: Dictionary ## Realtime bandwidth additional resources
var storage: Dictionary ## Storage additional resources
var users: Dictionary ## User additional resources
var gbhours: Dictionary ## GBHour additional resources
var imagetransformations: Dictionary ## Image transformation additional resources
var credits: Dictionary ## Credits additional resources

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteUsageBillingPlan.new()

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