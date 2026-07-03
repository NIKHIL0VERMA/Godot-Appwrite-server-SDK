class_name AppwriteOauth2DeviceAuthorization
extends RefCounted
## OAuth2 Device Authorization[br]


const _FIELD_MAP := {
    "device_code": "device_code",
    "user_code": "user_code",
    "verification_uri": "verification_uri",
    "verification_uri_complete": "verification_uri_complete",
    "expires_in": "expires_in",
    "interval": "interval",
}

var device_code: String ## Device verification code used by the client to poll the token endpoint.
var user_code: String ## Short code the end user enters on the verification page.
var verification_uri: String ## URL where the end user enters the user code.
var verification_uri_complete: String ## Verification URL with the user code prefilled as a query parameter.
var expires_in: int ## Lifetime of the device code and user code in seconds.
var interval: int ## Minimum polling interval for the token endpoint in seconds.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteOauth2DeviceAuthorization.new()

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