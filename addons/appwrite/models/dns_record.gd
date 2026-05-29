class_name AppwriteDnsRecord
extends RefCounted
## DNSRecord[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "xtype": "type",
    "xname": "name",
    "value": "value",
    "ttl": "ttl",
    "priority": "priority",
    "lock": "lock",
    "weight": "weight",
    "port": "port",
    "comment": "comment",
}

var id: String ## DNS Record ID.
var createdat: String ## DNS Record creation time in ISO 8601 format.
var updatedat: String ## DNS Record update date in ISO 8601 format.
var xtype: String ## DNS record type (e.g. A, CNAME, MX).
var xname: String ## Record name or subdomain.
var value: String ## Value of the record (IP address, domain, etc.).
var ttl: int ## Time to live (in seconds).
var priority: int ## Record priority (commonly used for MX).
var lock: bool ## Whether this record is locked (read-only).
var weight: int ## Record weight (used for SRV records).
var port: int ## Target port (used for SRV records).
var comment: String ## Comment for the DNS record.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDnsRecord.new()

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