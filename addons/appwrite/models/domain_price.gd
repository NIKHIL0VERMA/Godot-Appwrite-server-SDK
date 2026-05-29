class_name AppwriteDomainPrice
extends RefCounted
## DomainPrice[br]


const _FIELD_MAP := {
    "domain": "domain",
    "tld": "tld",
    "available": "available",
    "price": "price",
    "periodyears": "periodYears",
    "premium": "premium",
}

var domain: String ## Domain name.
var tld: String ## Top-level domain for the requested domain.
var available: bool ## Whether the domain is currently available for registration.
var price: float ## Domain registration price.
var periodyears: int ## Price period in years.
var premium: bool ## Whether the domain is a premium domain.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDomainPrice.new()

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