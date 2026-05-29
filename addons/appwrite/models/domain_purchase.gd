class_name AppwriteDomainPurchase
extends RefCounted
## DomainPurchase[br]

const _DomainPurchaseStatus := preload("res://addons/appwrite/enums/domain_purchase_status.gd")

const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "domainid": "domainId",
    "domain": "domain",
    "organizationid": "organizationId",
    "status": "status",
    "clientsecret": "clientSecret",
    "amount": "amount",
    "currency": "currency",
}

var id: String ## Purchase/invoice ID.
var createdat: String ## Purchase creation time in ISO 8601 format.
var updatedat: String ## Purchase update date in ISO 8601 format.
var domainid: String ## Domain document ID.
var domain: String ## Domain name.
var organizationid: String ## Team ID that owns the domain.
var status: String ## Domain purchase status.
var clientsecret: String ## Stripe client secret for 3DS; empty when not applicable.
var amount: float ## Purchase amount.
var currency: String ## Currency code.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDomainPurchase.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "status" and value != null:
            if not _DomainPurchaseStatus.is_valid(value):
                push_error("Invalid enum value for status: %s" % value)
                return AppwriteException.new("Invalid enum value for status: %s" % value, 0, "invalid_enum_value", str(dict))
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