class_name AppwriteTeam
extends RefCounted
## Team[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "xname": "name",
    "total": "total",
    "prefs": "prefs",
}

var id: String ## Team ID.
var createdat: String ## Team creation date in ISO 8601 format.
var updatedat: String ## Team update date in ISO 8601 format.
var xname: String ## Team name.
var total: int ## Total number of team members.
var prefs: Dictionary ## Team preferences as a key-value object

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteTeam.new()

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