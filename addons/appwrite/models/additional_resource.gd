class_name AppwriteAdditionalResource
extends RefCounted
## AdditionalResource[br]


const _FIELD_MAP := {
    "xname": "name",
    "unit": "unit",
    "currency": "currency",
    "price": "price",
    "value": "value",
    "invoicedesc": "invoiceDesc",
}

var xname: String ## Resource name
var unit: String ## Resource unit
var currency: String ## Price currency
var price: float ## Price
var value: int ## Resource value
var invoicedesc: String ## Description on invoice

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteAdditionalResource.new()

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