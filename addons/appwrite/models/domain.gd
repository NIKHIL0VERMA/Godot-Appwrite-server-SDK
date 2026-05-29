class_name AppwriteDomain
extends RefCounted
## Domain[br]

const _DomainTransferStatusEnum := preload("res://addons/appwrite/enums/domain_transfer_status_enum.gd")

const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "domain": "domain",
    "registrar": "registrar",
    "nameservers": "nameservers",
    "expire": "expire",
    "renewal": "renewal",
    "autorenewal": "autoRenewal",
    "renewalprice": "renewalPrice",
    "transferstatus": "transferStatus",
    "teamid": "teamId",
    "dnsrecords": "dnsRecords",
}

var id: String ## Domain ID.
var createdat: String ## Domain creation time in ISO 8601 format.
var updatedat: String ## Domain update date in ISO 8601 format.
var domain: String ## Domain name.
var registrar: String ## Domain registrar (e.g. &quot;appwrite&quot; or &quot;third_party&quot;).
var nameservers: String ## Nameservers setting. &quot;Appwrite&quot; or empty string.
var expire: String ## Domain expiry date in ISO 8601 format.
var renewal: String ## Domain renewal date in ISO 8601 format.
var autorenewal: bool ## If set to true, the domain will automatically renew.
var renewalprice: int ## Renewal price (in cents).
var transferstatus: String ## Transfer status for domains being transferred in.
var teamid: String ## Team ID.
var dnsrecords: Array ## Dns records

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDomain.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "transferstatus" and value != null:
            if not _DomainTransferStatusEnum.is_valid(value):
                push_error("Invalid enum value for transferstatus: %s" % value)
                return AppwriteException.new("Invalid enum value for transferstatus: %s" % value, 0, "invalid_enum_value", str(dict))
            m.set(key, value)
            continue
        if key == "dnsrecords" and value is Array:
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