class_name AppwriteBillingAddress
extends RefCounted
## Address[br]


const _FIELD_MAP := {
    "id": "$id",
    "userid": "userId",
    "streetaddress": "streetAddress",
    "addressline2": "addressLine2",
    "country": "country",
    "city": "city",
    "state": "state",
    "postalcode": "postalCode",
}

var id: String ## Region ID
var userid: String ## User ID
var streetaddress: String ## Street address
var addressline2: String ## Address line 2
var country: String ## Address country
var city: String ## city
var state: String ## state
var postalcode: String ## postal code

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteBillingAddress.new()

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