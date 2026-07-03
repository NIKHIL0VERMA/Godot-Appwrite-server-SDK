class_name AppwriteOauth2Reject
extends RefCounted
## OAuth2 Reject[br]


const _FIELD_MAP := {
    "redirecturl": "redirectUrl",
}

var redirecturl: String ## URL the end user should be redirected to after the grant is rejected, carrying an `access_denied` error.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteOauth2Reject.new()

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