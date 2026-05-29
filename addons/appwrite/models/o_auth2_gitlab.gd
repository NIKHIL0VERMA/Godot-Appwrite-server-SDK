class_name AppwriteOAuth2Gitlab
extends RefCounted
## OAuth2Gitlab[br]


const _FIELD_MAP := {
    "id": "$id",
    "enabled": "enabled",
    "applicationid": "applicationId",
    "secret": "secret",
    "endpoint": "endpoint",
}

var id: String ## OAuth2 provider ID.
var enabled: bool ## OAuth2 provider is active and can be used to create sessions.
var applicationid: String ## GitLab OAuth2 application ID.
var secret: String ## GitLab OAuth2 secret.
var endpoint: String ## GitLab OAuth2 endpoint URL. Defaults to https://gitlab.com for self-hosted instances.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteOAuth2Gitlab.new()

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