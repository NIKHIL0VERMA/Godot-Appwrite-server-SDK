class_name AppwriteBillingPlanAddonDetails
extends RefCounted
## Details[br]


const _FIELD_MAP := {
    "supported": "supported",
    "planincluded": "planIncluded",
    "limit": "limit",
    "xtype": "type",
    "currency": "currency",
    "price": "price",
    "value": "value",
    "invoicedesc": "invoiceDesc",
}

var supported: bool ## Is the addon supported in the plan?
var planincluded: int ## Addon plan included value
var limit: int ## Addon limit
var xtype: String ## Addon type
var currency: String ## Price currency
var price: float ## Price
var value: int ## Resource value
var invoicedesc: String ## Description on invoice

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteBillingPlanAddonDetails.new()

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