class_name AppwriteDomainSuggestion
extends RefCounted
## DomainSuggestion[br]


const _FIELD_MAP := {
    "domain": "domain",
    "premium": "premium",
    "price": "price",
    "available": "available",
}

var domain: String ## Domain suggestion.
var premium: bool ## Is the domain premium?
var price: float ## Domain price.
var available: bool ## Is the domain available?

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDomainSuggestion.new()

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