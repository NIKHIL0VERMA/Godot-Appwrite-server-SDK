class_name AppwriteIdentity
extends RefCounted
## Identity[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "userid": "userId",
    "provider": "provider",
    "provideruid": "providerUid",
    "provideremail": "providerEmail",
    "provideraccesstoken": "providerAccessToken",
    "provideraccesstokenexpiry": "providerAccessTokenExpiry",
    "providerrefreshtoken": "providerRefreshToken",
}

var id: String ## Identity ID.
var createdat: String ## Identity creation date in ISO 8601 format.
var updatedat: String ## Identity update date in ISO 8601 format.
var userid: String ## User ID.
var provider: String ## Identity Provider.
var provideruid: String ## ID of the User in the Identity Provider.
var provideremail: String ## Email of the User in the Identity Provider.
var provideraccesstoken: String ## Identity Provider Access Token.
var provideraccesstokenexpiry: String ## The date of when the access token expires in ISO 8601 format.
var providerrefreshtoken: String ## Identity Provider Refresh Token.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteIdentity.new()

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