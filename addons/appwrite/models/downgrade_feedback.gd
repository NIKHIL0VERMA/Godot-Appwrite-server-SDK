class_name AppwriteDowngradeFeedback
extends RefCounted
## Downgrade Feedback[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "title": "title",
    "message": "message",
    "fromplanid": "fromPlanId",
    "toplanid": "toPlanId",
    "teamid": "teamId",
    "userid": "userId",
    "version": "version",
}

var id: String ## Feedback ID.
var createdat: String ## Feedback creation date in ISO 8601 format.
var updatedat: String ## Feedback update date in ISO 8601 format.
var title: String ## Feedback reason
var message: String ## Feedback message
var fromplanid: String ## Plan ID downgrading from
var toplanid: String ## Plan ID downgrading to
var teamid: String ## Organization ID
var userid: String ## User ID who submitted feedback
var version: String ## Console version

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDowngradeFeedback.new()

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