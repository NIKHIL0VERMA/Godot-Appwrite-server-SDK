class_name AppwriteTemplateFramework
extends RefCounted
## Template Framework[br]


const _FIELD_MAP := {
    "key": "key",
    "xname": "name",
    "installcommand": "installCommand",
    "buildcommand": "buildCommand",
    "outputdirectory": "outputDirectory",
    "providerrootdirectory": "providerRootDirectory",
    "buildruntime": "buildRuntime",
    "adapter": "adapter",
    "fallbackfile": "fallbackFile",
}

var key: String ## Parent framework key.
var xname: String ## Framework Name.
var installcommand: String ## The install command used to install the dependencies.
var buildcommand: String ## The build command used to build the deployment.
var outputdirectory: String ## The output directory to store the build output.
var providerrootdirectory: String ## Path to site in VCS (Version Control System) repository
var buildruntime: String ## Runtime used during build step of template.
var adapter: String ## Site framework runtime
var fallbackfile: String ## Fallback file for SPA. Only relevant for static serve runtime.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteTemplateFramework.new()

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