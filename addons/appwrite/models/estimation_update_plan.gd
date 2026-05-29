class_name AppwriteEstimationUpdatePlan
extends RefCounted
## UpdatePlan[br]


const _FIELD_MAP := {
    "amount": "amount",
    "grossamount": "grossAmount",
    "discount": "discount",
    "credits": "credits",
    "items": "items",
    "discounts": "discounts",
    "trialdays": "trialDays",
    "trialenddate": "trialEndDate",
    "organizationcredits": "organizationCredits",
}

var amount: float ## Total amount
var grossamount: float ## Gross payable amount
var discount: float ## Discount amount
var credits: float ## Credits amount
var items: Array ## Estimation items
var discounts: Array ## Estimation discount items
var trialdays: int ## Trial days
var trialenddate: String ## Trial end date
var organizationcredits: float ## Organization&#039;s existing credits

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteEstimationUpdatePlan.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "items" and value is Array:
            m.set(key, value)
            continue
        if key == "discounts" and value is Array:
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