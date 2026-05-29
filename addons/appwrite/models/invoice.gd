class_name AppwriteInvoice
extends RefCounted
## Invoice[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "permissions": "$permissions",
    "teamid": "teamId",
    "aggregationid": "aggregationId",
    "plan": "plan",
    "usage": "usage",
    "amount": "amount",
    "tax": "tax",
    "taxamount": "taxAmount",
    "vat": "vat",
    "vatamount": "vatAmount",
    "grossamount": "grossAmount",
    "creditsused": "creditsUsed",
    "currency": "currency",
    "clientsecret": "clientSecret",
    "status": "status",
    "xtype": "type",
    "lasterror": "lastError",
    "dueat": "dueAt",
    "from": "from",
    "to": "to",
}

var id: String ## Invoice ID.
var createdat: String ## Invoice creation time in ISO 8601 format.
var updatedat: String ## Invoice update date in ISO 8601 format.
var permissions: Array ## Invoice permissions. [Learn more about permissions](/docs/permissions).
var teamid: String ## Project ID
var aggregationid: String ## Aggregation ID
var plan: String ## Billing plan selected. Can be one of `tier-0`, `tier-1` or `tier-2`.
var usage: Array ## Usage breakdown per resource
var amount: float ## Invoice Amount
var tax: float ## Tax percentage
var taxamount: float ## Tax amount
var vat: float ## VAT percentage
var vatamount: float ## VAT amount
var grossamount: float ## Gross amount after vat, tax, and discounts applied.
var creditsused: float ## Credits used.
var currency: String ## Currency the invoice is in
var clientsecret: String ## Client secret for processing failed payments in front-end
var status: String ## Invoice status
var xtype: String ## Invoice type. Can be one of `subscription`, `domain_purchase`, `domain_renewal`, `domain_transfer`, or `addon_*`.
var lasterror: String ## Last payment error associated with the invoice
var dueat: String ## Invoice due date.
var from: String ## Beginning date of the invoice
var to: String ## End date of the invoice

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteInvoice.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "permissions" and value is Array:
            m.set(key, value)
            continue
        if key == "usage" and value is Array:
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