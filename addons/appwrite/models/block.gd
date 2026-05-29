class_name AppwriteBlock
extends RefCounted
## Block[br]


const _FIELD_MAP := {
    "createdat": "$createdAt",
    "resourcetype": "resourceType",
    "resourceid": "resourceId",
    "reason": "reason",
    "expiredat": "expiredAt",
    "projectname": "projectName",
    "region": "region",
    "organizationname": "organizationName",
    "organizationid": "organizationId",
    "billingplan": "billingPlan",
}

var createdat: String ## Block creation date in ISO 8601 format.
var resourcetype: String ## Resource type that is blocked
var resourceid: String ## Resource identifier that is blocked
var reason: String ## Reason for the block. Can be null if no reason was provided.
var expiredat: String ## Block expiration date in ISO 8601 format. Can be null if the block does not expire.
var projectname: String ## Name of the project this block applies to.
var region: String ## Region of the project this block applies to.
var organizationname: String ## Name of the organization that owns the project.
var organizationid: String ## ID of the organization that owns the project.
var billingplan: String ## Billing plan of the organization that owns the project.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteBlock.new()

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