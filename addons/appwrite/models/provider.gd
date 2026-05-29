class_name AppwriteProvider
extends RefCounted
## Provider[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "xname": "name",
    "provider": "provider",
    "enabled": "enabled",
    "xtype": "type",
    "credentials": "credentials",
    "options": "options",
}

var id: String ## Provider ID.
var createdat: String ## Provider creation time in ISO 8601 format.
var updatedat: String ## Provider update date in ISO 8601 format.
var xname: String ## The name for the provider instance.
var provider: String ## The name of the provider service.
var enabled: bool ## Is provider enabled?
var xtype: String ## Type of provider.
var credentials: Dictionary ## Provider credentials.
var options: Dictionary ## Provider options.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteProvider.new()

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