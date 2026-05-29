class_name AppwriteAddon
extends RefCounted
## Addon[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "permissions": "$permissions",
    "key": "key",
    "resourcetype": "resourceType",
    "resourceid": "resourceId",
    "status": "status",
    "currentvalue": "currentValue",
    "nextvalue": "nextValue",
}

var id: String ## Addon ID.
var createdat: String ## Addon creation time in ISO 8601 format.
var updatedat: String ## Addon update date in ISO 8601 format.
var permissions: Array ## Addon permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).
var key: String ## Addon key
var resourcetype: String ## Resource type (organization or project)
var resourceid: String ## Resource ID
var status: String ## Payment status. Possible values: pending (awaiting payment confirmation e.g. 3DS), active (payment confirmed and addon is running).
var currentvalue: int ## Current value for this billing cycle. For toggle addons: 1 (on) or 0 (off). For numeric addons: the active quantity.
var nextvalue: int ## Value to apply at the start of the next billing cycle. Null means no change is scheduled. For toggle addons, 0 means the addon will be removed at the next cycle.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteAddon.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "permissions" and value is Array:
            m.set(key, value)
            continue
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