class_name AppwritePaymentMethod
extends RefCounted
## paymentMethod[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "permissions": "$permissions",
    "providermethodid": "providerMethodId",
    "clientsecret": "clientSecret",
    "provideruserid": "providerUserId",
    "userid": "userId",
    "expirymonth": "expiryMonth",
    "expiryyear": "expiryYear",
    "last4": "last4",
    "brand": "brand",
    "xname": "name",
    "mandateid": "mandateId",
    "country": "country",
    "state": "state",
    "lasterror": "lastError",
    "default": "default",
    "expired": "expired",
    "failed": "failed",
}

var id: String ## Payment Method ID.
var createdat: String ## Payment method creation time in ISO 8601 format.
var updatedat: String ## Payment method update date in ISO 8601 format.
var permissions: Array ## Payment method permissions. [Learn more about permissions](/docs/permissions).
var providermethodid: String ## Payment method ID from the payment provider
var clientsecret: String ## Client secret hash for payment setup
var provideruserid: String ## User ID from the payment provider.
var userid: String ## ID of the Team.
var expirymonth: int ## Expiry month of the payment method.
var expiryyear: int ## Expiry year of the payment method.
var last4: String ## Last 4 digit of the payment method
var brand: String ## Payment method brand
var xname: String ## Name of the owner
var mandateid: String ## Mandate ID of the payment method
var country: String ## Country of the payment method
var state: String ## State of the payment method
var lasterror: String ## Last payment error associated with the payment method.
var default: bool ## True when it&#039;s the default payment method.
var expired: bool ## True when payment method has expired.
var failed: bool ## True when payment method has failed to process multiple times.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwritePaymentMethod.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "permissions" and value is Array:
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