class_name AppwriteToken
extends RefCounted
## Token[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "userid": "userId",
    "secret": "secret",
    "expire": "expire",
    "phrase": "phrase",
}

var id: String ## Token ID.
var createdat: String ## Token creation date in ISO 8601 format.
var userid: String ## User ID.
var secret: String ## Token secret key. This will return an empty string unless the response is returned using an API key or as part of a webhook payload.
var expire: String ## Token expiration date in ISO 8601 format.
var phrase: String ## Security phrase of a token. Empty if security phrase was not requested when creating a token. It includes randomly generated phrase which is also sent in the external resource such as email.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteToken.new()

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