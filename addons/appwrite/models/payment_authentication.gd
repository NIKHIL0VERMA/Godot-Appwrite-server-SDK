class_name AppwritePaymentAuthentication
extends RefCounted
## PaymentAuthentication[br]


const _FIELD_MAP := {
    "message": "message",
    "clientsecret": "clientSecret",
    "organizationid": "organizationId",
    "invoiceid": "invoiceId",
    "addonid": "addonId",
}

var message: String ## Message for the end user to show on Console.
var clientsecret: String ## Stripe client secret to use for validation.
var organizationid: String ## Organization ID for which the payment authentication is needed.
var invoiceid: String ## Invoice ID against which the payment needs to be validated.
var addonid: String ## Addon ID to use when calling the addon validate endpoint. Empty when authentication is not for an addon.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwritePaymentAuthentication.new()

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