class_name AppwriteReport
extends RefCounted
## Report[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "appid": "appId",
    "xtype": "type",
    "title": "title",
    "summary": "summary",
    "targettype": "targetType",
    "target": "target",
    "categories": "categories",
    "insights": "insights",
    "analyzedat": "analyzedAt",
}

var id: String ## Report ID.
var createdat: String ## Report creation date in ISO 8601 format.
var updatedat: String ## Report update date in ISO 8601 format.
var appid: String ## ID of the third-party app that submitted the report.
var xtype: String ## Analyzer that produced this report. e.g. lighthouse, audit, databaseAnalyzer.
var title: String ## Short, human-readable title for the report.
var summary: String ## Markdown summary describing the report.
var targettype: String ## Plural noun describing what the report analyzes, e.g. databases, sites, urls.
var target: String ## Free-form target identifier (URL for lighthouse, resource ID for db).
var categories: Array ## Categories covered by the report, e.g. performance, accessibility.
var insights: Array ## Insights nested under this report.
var analyzedat: String ## Time the report was analyzed in ISO 8601 format.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteReport.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "categories" and value is Array:
            m.set(key, value)
            continue
        if key == "insights" and value is Array:
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