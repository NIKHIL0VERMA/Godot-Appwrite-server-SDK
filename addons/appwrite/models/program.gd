class_name AppwriteProgram
extends RefCounted
## Program[br]


const _FIELD_MAP := {
    "id": "$id",
    "title": "title",
    "description": "description",
    "tag": "tag",
    "icon": "icon",
    "url": "url",
    "active": "active",
    "external": "external",
    "billingplanid": "billingPlanId",
}

var id: String ## Program ID
var title: String ## Program title
var description: String ## Program description
var tag: String ## Program tag for highlighting on console
var icon: String ## Program icon for highlighting on console
var url: String ## URL for more information on this program
var active: bool ## Whether this program is active
var external: bool ## Whether this program is external
var billingplanid: String ## Billing plan ID that this is program is associated with.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteProgram.new()

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