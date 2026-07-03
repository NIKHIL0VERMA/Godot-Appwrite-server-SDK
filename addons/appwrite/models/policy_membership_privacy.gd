class_name AppwritePolicyMembershipPrivacy
extends RefCounted
## Policy Membership Privacy[br]


const _FIELD_MAP := {
    "id": "$id",
    "userid": "userId",
    "useremail": "userEmail",
    "userphone": "userPhone",
    "username": "userName",
    "usermfa": "userMFA",
    "useraccessedat": "userAccessedAt",
}

var id: String ## Policy ID.
var userid: bool ## Whether user ID is visible in memberships.
var useremail: bool ## Whether user email is visible in memberships.
var userphone: bool ## Whether user phone is visible in memberships.
var username: bool ## Whether user name is visible in memberships.
var usermfa: bool ## Whether user MFA status is visible in memberships.
var useraccessedat: bool ## Whether user last access time is visible in memberships.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwritePolicyMembershipPrivacy.new()

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