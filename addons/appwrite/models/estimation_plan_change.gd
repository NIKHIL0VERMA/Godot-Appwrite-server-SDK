class_name AppwriteEstimationPlanChange
extends RefCounted
## EstimationPlanChange[br]


const _FIELD_MAP := {
    "currentbillingplanid": "currentBillingPlanId",
    "targetbillingplanid": "targetBillingPlanId",
    "direction": "direction",
    "estimation": "estimation",
    "limits": "limits",
}

var currentbillingplanid: String ## Current billing plan ID
var targetbillingplanid: String ## Target billing plan ID
var direction: String ## Direction of plan change: upgrade, downgrade, or same
var estimation: Dictionary ## Cost estimation details
var limits: Dictionary ## Plan limits and compliance information

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteEstimationPlanChange.new()

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