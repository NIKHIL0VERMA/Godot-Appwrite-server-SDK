class_name AppwriteTemplateRuntime
extends RefCounted
## Template Runtime[br]


const _FIELD_MAP := {
    "xname": "name",
    "commands": "commands",
    "entrypoint": "entrypoint",
    "providerrootdirectory": "providerRootDirectory",
}

var xname: String ## Runtime Name.
var commands: String ## The build command used to build the deployment.
var entrypoint: String ## The entrypoint file used to execute the deployment.
var providerrootdirectory: String ## Path to function in VCS (Version Control System) repository

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteTemplateRuntime.new()

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