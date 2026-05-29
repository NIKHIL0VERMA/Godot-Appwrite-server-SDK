class_name AppwriteTemplateFunction
extends RefCounted
## Template Function[br]


const _FIELD_MAP := {
    "icon": "icon",
    "id": "id",
    "xname": "name",
    "tagline": "tagline",
    "permissions": "permissions",
    "events": "events",
    "cron": "cron",
    "timeout": "timeout",
    "usecases": "useCases",
    "runtimes": "runtimes",
    "instructions": "instructions",
    "vcsprovider": "vcsProvider",
    "providerrepositoryid": "providerRepositoryId",
    "providerowner": "providerOwner",
    "providerversion": "providerVersion",
    "variables": "variables",
    "scopes": "scopes",
}

var icon: String ## Function Template Icon.
var id: String ## Function Template ID.
var xname: String ## Function Template Name.
var tagline: String ## Function Template Tagline.
var permissions: Array ## Execution permissions.
var events: Array ## Function trigger events.
var cron: String ## Function execution schedult in CRON format.
var timeout: int ## Function execution timeout in seconds.
var usecases: Array ## Function use cases.
var runtimes: Array ## List of runtimes that can be used with this template.
var instructions: String ## Function Template Instructions.
var vcsprovider: String ## VCS (Version Control System) Provider.
var providerrepositoryid: String ## VCS (Version Control System) Repository ID
var providerowner: String ## VCS (Version Control System) Owner.
var providerversion: String ## VCS (Version Control System) branch version (tag).
var variables: Array ## Function variables.
var scopes: Array ## Function scopes.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteTemplateFunction.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "permissions" and value is Array:
            m.set(key, value)
            continue
        if key == "events" and value is Array:
            m.set(key, value)
            continue
        if key == "usecases" and value is Array:
            m.set(key, value)
            continue
        if key == "runtimes" and value is Array:
            m.set(key, value)
            continue
        if key == "variables" and value is Array:
            m.set(key, value)
            continue
        if key == "scopes" and value is Array:
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