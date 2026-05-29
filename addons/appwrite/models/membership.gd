class_name AppwriteMembership
extends RefCounted
## Membership[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "userid": "userId",
    "username": "userName",
    "useremail": "userEmail",
    "userphone": "userPhone",
    "teamid": "teamId",
    "teamname": "teamName",
    "invited": "invited",
    "joined": "joined",
    "confirm": "confirm",
    "mfa": "mfa",
    "roles": "roles",
}

var id: String ## Membership ID.
var createdat: String ## Membership creation date in ISO 8601 format.
var updatedat: String ## Membership update date in ISO 8601 format.
var userid: String ## User ID.
var username: String ## User name. Hide this attribute by toggling membership privacy in the Console.
var useremail: String ## User email address. Hide this attribute by toggling membership privacy in the Console.
var userphone: String ## User phone number. Hide this attribute by toggling membership privacy in the Console.
var teamid: String ## Team ID.
var teamname: String ## Team name.
var invited: String ## Date, the user has been invited to join the team in ISO 8601 format.
var joined: String ## Date, the user has accepted the invitation to join the team in ISO 8601 format.
var confirm: bool ## User confirmation status, true if the user has joined the team or false otherwise.
var mfa: bool ## Multi factor authentication status, true if the user has MFA enabled or false otherwise. Hide this attribute by toggling membership privacy in the Console.
var roles: Array ## User list of roles

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteMembership.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "roles" and value is Array:
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