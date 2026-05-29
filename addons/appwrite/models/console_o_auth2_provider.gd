class_name AppwriteConsoleOAuth2Provider
extends RefCounted
## Console OAuth2 Provider[br]


const _FIELD_MAP := {
    "id": "$id",
    "parameters": "parameters",
}

var id: String ## OAuth2 provider ID.
var parameters: Array ## List of parameters required to configure this OAuth2 provider.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteConsoleOAuth2Provider.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "parameters" and value is Array:
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