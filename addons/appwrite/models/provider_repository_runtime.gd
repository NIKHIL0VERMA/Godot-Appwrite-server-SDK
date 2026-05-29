class_name AppwriteProviderRepositoryRuntime
extends RefCounted
## ProviderRepositoryRuntime[br]


const _FIELD_MAP := {
    "id": "id",
    "xname": "name",
    "organization": "organization",
    "provider": "provider",
    "private": "private",
    "defaultbranch": "defaultBranch",
    "providerinstallationid": "providerInstallationId",
    "authorized": "authorized",
    "pushedat": "pushedAt",
    "variables": "variables",
    "runtime": "runtime",
}

var id: String ## VCS (Version Control System) repository ID.
var xname: String ## VCS (Version Control System) repository name.
var organization: String ## VCS (Version Control System) organization name
var provider: String ## VCS (Version Control System) provider name.
var private: bool ## Is VCS (Version Control System) repository private?
var defaultbranch: String ## VCS (Version Control System) repository&#039;s default branch name.
var providerinstallationid: String ## VCS (Version Control System) installation ID.
var authorized: bool ## Is VCS (Version Control System) repository authorized for the installation?
var pushedat: String ## Last commit date in ISO 8601 format.
var variables: Array ## Environment variables found in .env files
var runtime: String ## Auto-detected runtime. Empty if type is not &quot;runtime&quot;.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteProviderRepositoryRuntime.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

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