class_name AppwriteTopic
extends RefCounted
## Topic[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "xname": "name",
    "emailtotal": "emailTotal",
    "smstotal": "smsTotal",
    "pushtotal": "pushTotal",
    "subscribe": "subscribe",
}

var id: String ## Topic ID.
var createdat: String ## Topic creation time in ISO 8601 format.
var updatedat: String ## Topic update date in ISO 8601 format.
var xname: String ## The name of the topic.
var emailtotal: int ## Total count of email subscribers subscribed to the topic.
var smstotal: int ## Total count of SMS subscribers subscribed to the topic.
var pushtotal: int ## Total count of push subscribers subscribed to the topic.
var subscribe: Array ## Subscribe permissions.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteTopic.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "subscribe" and value is Array:
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