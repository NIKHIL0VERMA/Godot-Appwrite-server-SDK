class_name AppwriteAggregationBreakdown
extends RefCounted
## Breakdown[br]


const _FIELD_MAP := {
    "id": "$id",
    "xname": "name",
    "region": "region",
    "amount": "amount",
    "resources": "resources",
}

var id: String ## Aggregation ID.
var xname: String ## Project name
var region: String ## Project region
var amount: int ## Aggregated amount
var resources: Array ## No description provided.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteAggregationBreakdown.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "resources" and value is Array:
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