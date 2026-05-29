class_name AppwriteTransaction
extends RefCounted
## Transaction[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "status": "status",
    "operations": "operations",
    "expiresat": "expiresAt",
}

var id: String ## Transaction ID.
var createdat: String ## Transaction creation time in ISO 8601 format.
var updatedat: String ## Transaction update date in ISO 8601 format.
var status: String ## Current status of the transaction. One of: pending, committing, committed, rolled_back, failed.
var operations: int ## Number of operations in the transaction.
var expiresat: String ## Expiration time in ISO 8601 format.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteTransaction.new()

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