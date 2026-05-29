class_name AppwriteInvoiceList
extends RefCounted
## Billing invoices list[br]


const _FIELD_MAP := {
    "total": "total",
    "invoices": "invoices",
}

var total: int ## Total number of invoices that matched your query.
var invoices: Array ## List of invoices.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteInvoiceList.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "invoices" and value is Array:
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