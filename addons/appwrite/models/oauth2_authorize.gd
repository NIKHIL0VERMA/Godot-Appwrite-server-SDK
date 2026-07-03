class_name AppwriteOauth2Authorize
extends RefCounted
## OAuth2 Authorize[br]


const _FIELD_MAP := {
    "grantid": "grantId",
    "redirecturl": "redirectUrl",
}

var grantid: String ## OAuth2 grant ID. Set when the user must give explicit consent; pass it to the approve or reject endpoint. Empty when a redirect URL is returned instead.
var redirecturl: String ## URL the end user should be redirected to when the flow can complete without consent. Empty when consent is still required.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteOauth2Authorize.new()

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