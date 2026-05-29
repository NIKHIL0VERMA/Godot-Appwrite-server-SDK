class_name AppwriteVariable
extends RefCounted
## Variable[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "key": "key",
    "value": "value",
    "secret": "secret",
    "resourcetype": "resourceType",
    "resourceid": "resourceId",
}

var id: String ## Variable ID.
var createdat: String ## Variable creation date in ISO 8601 format.
var updatedat: String ## Variable creation date in ISO 8601 format.
var key: String ## Variable key.
var value: String ## Variable value.
var secret: bool ## Variable secret flag. Secret variables can only be updated or deleted, but never read.
var resourcetype: String ## Service to which the variable belongs. Possible values are &quot;project&quot;, &quot;function&quot;
var resourceid: String ## ID of resource to which the variable belongs. If resourceType is &quot;project&quot;, it is empty. If resourceType is &quot;function&quot;, it is ID of the function.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteVariable.new()

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