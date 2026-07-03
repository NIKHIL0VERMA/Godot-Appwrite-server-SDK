class_name AppwriteOauth2Approve
extends RefCounted
## OAuth2 Approve[br]


const _FIELD_MAP := {
    "redirecturl": "redirectUrl",
}

var redirecturl: String ## URL the end user should be redirected to after the grant is approved, carrying the authorization `code` and/or `id_token` along with the original `state`.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteOauth2Approve.new()

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