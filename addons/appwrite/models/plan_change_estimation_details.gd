class_name AppwritePlanChangeEstimationDetails
extends RefCounted
## PlanChangeEstimationDetails[br]


const _FIELD_MAP := {
    "currency": "currency",
    "grossamount": "grossAmount",
    "credits": "credits",
    "organizationcredits": "organizationCredits",
    "discount": "discount",
    "amount": "amount",
    "nextinvoicedate": "nextInvoiceDate",
    "items": "items",
    "discounts": "discounts",
}

var currency: String ## Currency code
var grossamount: float ## Gross amount after all discounts and credits
var credits: float ## Credits applied from coupon
var organizationcredits: float ## Organization&#039;s existing credits applied
var discount: float ## Discount amount from prorated invoices
var amount: float ## Total amount before discounts and credits
var nextinvoicedate: String ## Next invoice date
var items: Dictionary ## Line items breakdown
var discounts: Dictionary ## Applied discounts breakdown

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwritePlanChangeEstimationDetails.new()

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