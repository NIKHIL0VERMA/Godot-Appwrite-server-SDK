class_name AppwriteTemplateSite
extends RefCounted
## Template Site[br]


const _FIELD_MAP := {
    "key": "key",
    "xname": "name",
    "tagline": "tagline",
    "demourl": "demoUrl",
    "screenshotdark": "screenshotDark",
    "screenshotlight": "screenshotLight",
    "usecases": "useCases",
    "frameworks": "frameworks",
    "vcsprovider": "vcsProvider",
    "providerrepositoryid": "providerRepositoryId",
    "providerowner": "providerOwner",
    "providerversion": "providerVersion",
    "variables": "variables",
}

var key: String ## Site Template ID.
var xname: String ## Site Template Name.
var tagline: String ## Short description of template
var demourl: String ## URL hosting a template demo.
var screenshotdark: String ## File URL with preview screenshot in dark theme preference.
var screenshotlight: String ## File URL with preview screenshot in light theme preference.
var usecases: Array ## Site use cases.
var frameworks: Array ## List of frameworks that can be used with this template.
var vcsprovider: String ## VCS (Version Control System) Provider.
var providerrepositoryid: String ## VCS (Version Control System) Repository ID
var providerowner: String ## VCS (Version Control System) Owner.
var providerversion: String ## VCS (Version Control System) branch version (tag).
var variables: Array ## Site variables.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteTemplateSite.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "usecases" and value is Array:
            m.set(key, value)
            continue
        if key == "frameworks" and value is Array:
            m.set(key, value)
            continue
        if key == "variables" and value is Array:
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