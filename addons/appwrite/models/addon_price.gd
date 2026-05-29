class_name AppwriteAddonPrice
extends RefCounted
## AddonPrice[br]


const _FIELD_MAP := {
    "addonkey": "addonKey",
    "xname": "name",
    "monthlyprice": "monthlyPrice",
    "proratedamount": "proratedAmount",
    "remainingdays": "remainingDays",
    "totalcycledays": "totalCycleDays",
    "currency": "currency",
    "billingcycleend": "billingCycleEnd",
}

var addonkey: String ## Addon key.
var xname: String ## Addon display name.
var monthlyprice: float ## Full monthly price of the addon.
var proratedamount: float ## Calculated prorated amount for the current billing cycle.
var remainingdays: int ## Days remaining in the current billing cycle.
var totalcycledays: int ## Total days in the billing cycle.
var currency: String ## Currency code.
var billingcycleend: String ## When the current billing cycle ends.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteAddonPrice.new()

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