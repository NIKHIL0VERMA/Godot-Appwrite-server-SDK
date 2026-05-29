class_name AppwriteDedicatedDatabaseBranch
extends RefCounted
## Branch[br]


const _FIELD_MAP := {
    "branchid": "branchId",
    "branchname": "branchName",
    "xnamespace": "namespace",
    "expiresat": "expiresAt",
}

var branchid: String ## Branch identifier.
var branchname: String ## Branch name.
var xnamespace: String ## Kubernetes namespace where the branch is deployed.
var expiresat: int ## Unix timestamp when the branch expires.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDedicatedDatabaseBranch.new()

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