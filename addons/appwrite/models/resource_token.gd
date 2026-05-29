class_name AppwriteResourceToken
extends RefCounted
## ResourceToken[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "resourceid": "resourceId",
    "resourcetype": "resourceType",
    "expire": "expire",
    "secret": "secret",
    "accessedat": "accessedAt",
}

var id: String ## Token ID.
var createdat: String ## Token creation date in ISO 8601 format.
var resourceid: String ## Resource ID.
var resourcetype: String ## Resource type.
var expire: String ## Token expiration date in ISO 8601 format.
var secret: String ## JWT encoded string.
var accessedat: String ## Most recent access date in ISO 8601 format. This attribute is only updated again after 24 hours.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteResourceToken.new()

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