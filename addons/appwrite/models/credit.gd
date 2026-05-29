class_name AppwriteCredit
extends RefCounted
## Credit[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "permissions": "$permissions",
    "couponid": "couponId",
    "userid": "userId",
    "teamid": "teamId",
    "credits": "credits",
    "total": "total",
    "expiration": "expiration",
    "status": "status",
}

var id: String ## Credit ID.
var createdat: String ## Credit creation time in ISO 8601 format.
var updatedat: String ## Credit update date in ISO 8601 format.
var permissions: Array ## Credit permissions. [Learn more about permissions](/docs/permissions).
var couponid: String ## coupon ID
var userid: String ## ID of the User.
var teamid: String ## ID of the Team.
var credits: float ## Provided credit amount
var total: float ## Provided credit amount
var expiration: String ## Credit expiration time in ISO 8601 format.
var status: String ## Status of the credit. Can be one of `disabled`, `active` or `expired`.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteCredit.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "permissions" and value is Array:
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