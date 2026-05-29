class_name AppwriteTarget
extends RefCounted
## Target[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "xname": "name",
    "userid": "userId",
    "providerid": "providerId",
    "providertype": "providerType",
    "identifier": "identifier",
    "expired": "expired",
}

var id: String ## Target ID.
var createdat: String ## Target creation time in ISO 8601 format.
var updatedat: String ## Target update date in ISO 8601 format.
var xname: String ## Target Name.
var userid: String ## User ID.
var providerid: String ## Provider ID.
var providertype: String ## The target provider type. Can be one of the following: `email`, `sms` or `push`.
var identifier: String ## The target identifier.
var expired: bool ## Is the target expired.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteTarget.new()

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