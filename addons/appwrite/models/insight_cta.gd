class_name AppwriteInsightCTA
extends RefCounted
## InsightCTA[br]


const _FIELD_MAP := {
    "label": "label",
    "service": "service",
    "method": "method",
    "params": "params",
}

var label: String ## Human-readable label for the CTA, used in UI.
var service: String ## Public API service (SDK namespace) the client should invoke. Must match the engine that owns the resource — for index suggestions: databases (legacy), tablesDB, documentsDB, or vectorsDB.
var method: String ## Public API method on the chosen service the client should invoke when this CTA is triggered.
var params: Dictionary ## Parameter map the client should pass to the service method when this CTA is triggered. Keys match the target API&#039;s parameter names (e.g. databaseId/tableId/columns for tablesDB, databaseId/collectionId/attributes for the legacy Databases API).

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteInsightCTA.new()

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