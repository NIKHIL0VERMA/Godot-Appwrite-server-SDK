class_name AppwriteWebhook
extends RefCounted
## Webhook[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "xname": "name",
    "url": "url",
    "events": "events",
    "tls": "tls",
    "authusername": "authUsername",
    "authpassword": "authPassword",
    "secret": "secret",
    "enabled": "enabled",
    "logs": "logs",
    "attempts": "attempts",
}

var id: String ## Webhook ID.
var createdat: String ## Webhook creation date in ISO 8601 format.
var updatedat: String ## Webhook update date in ISO 8601 format.
var xname: String ## Webhook name.
var url: String ## Webhook URL endpoint.
var events: Array ## Webhook trigger events.
var tls: bool ## Indicates if SSL / TLS certificate verification is enabled.
var authusername: String ## HTTP basic authentication username.
var authpassword: String ## HTTP basic authentication password.
var secret: String ## Signature key which can be used to validate incoming webhook payloads. Only returned on creation and secret rotation.
var enabled: bool ## Indicates if this webhook is enabled.
var logs: String ## Webhook error logs from the most recent failure.
var attempts: int ## Number of consecutive failed webhook attempts.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteWebhook.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "events" and value is Array:
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