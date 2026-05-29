class_name AppwriteCoupon
extends RefCounted
## Coupon[br]


const _FIELD_MAP := {
    "id": "$id",
    "code": "code",
    "credits": "credits",
    "expiration": "expiration",
    "validity": "validity",
    "campaign": "campaign",
    "status": "status",
    "onlyneworgs": "onlyNewOrgs",
}

var id: String ## coupon ID
var code: String ## coupon ID
var credits: float ## Provided credit amount
var expiration: String ## Coupon expiration time in ISO 8601 format.
var validity: int ## Credit validity in days.
var campaign: String ## Campaign the coupon is associated with`.
var status: String ## Status of the coupon. Can be one of `disabled`, `active` or `expired`.
var onlyneworgs: bool ## If the coupon is only valid for new organizations or not.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteCoupon.new()

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