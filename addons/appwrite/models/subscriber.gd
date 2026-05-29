class_name AppwriteSubscriber
extends RefCounted
## Subscriber[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "targetid": "targetId",
    "target": "target",
    "userid": "userId",
    "username": "userName",
    "topicid": "topicId",
    "providertype": "providerType",
}

var id: String ## Subscriber ID.
var createdat: String ## Subscriber creation time in ISO 8601 format.
var updatedat: String ## Subscriber update date in ISO 8601 format.
var targetid: String ## Target ID.
var target: Dictionary ## Target.
var userid: String ## Topic ID.
var username: String ## User Name.
var topicid: String ## Topic ID.
var providertype: String ## The target provider type. Can be one of the following: `email`, `sms` or `push`.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteSubscriber.new()

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