class_name AppwriteConsoleOAuth2ProviderParameter
extends RefCounted
## Console OAuth2 Provider Parameter[br]


const _FIELD_MAP := {
    "id": "$id",
    "xname": "name",
    "example": "example",
    "hint": "hint",
}

var id: String ## Parameter ID. Maps to the request body field used by the project OAuth2 update endpoint (e.g. `clientId`, `appKey`, `tenant`).
var xname: String ## Verbose, user-facing parameter name as shown in the provider&#039;s own dashboard. Includes alternate names when the provider exposes more than one.
var example: String ## Example value for this parameter.
var hint: String ## Optional hint for this parameter, typically calling out a common wrong value. Empty string when no hint is set.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteConsoleOAuth2ProviderParameter.new()

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