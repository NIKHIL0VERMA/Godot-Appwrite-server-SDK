class_name AppwriteInstallation
extends RefCounted
## Installation[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "provider": "provider",
    "organization": "organization",
    "providerinstallationid": "providerInstallationId",
}

var id: String ## Function ID.
var createdat: String ## Function creation date in ISO 8601 format.
var updatedat: String ## Function update date in ISO 8601 format.
var provider: String ## VCS (Version Control System) provider name.
var organization: String ## VCS (Version Control System) organization name.
var providerinstallationid: String ## VCS (Version Control System) installation ID.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteInstallation.new()

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