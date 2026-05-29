class_name AppwriteTemplateVariable
extends RefCounted
## Template Variable[br]


const _FIELD_MAP := {
    "xname": "name",
    "description": "description",
    "value": "value",
    "secret": "secret",
    "placeholder": "placeholder",
    "required": "required",
    "xtype": "type",
}

var xname: String ## Variable Name.
var description: String ## Variable Description.
var value: String ## Variable Value.
var secret: bool ## Variable secret flag. Secret variables can only be updated or deleted, but never read.
var placeholder: String ## Variable Placeholder.
var required: bool ## Is the variable required?
var xtype: String ## Variable Type.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteTemplateVariable.new()

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