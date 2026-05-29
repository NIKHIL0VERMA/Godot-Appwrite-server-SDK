class_name AppwriteInsight
extends RefCounted
## Insight[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "reportid": "reportId",
    "xtype": "type",
    "severity": "severity",
    "status": "status",
    "resourcetype": "resourceType",
    "resourceid": "resourceId",
    "parentresourcetype": "parentResourceType",
    "parentresourceid": "parentResourceId",
    "title": "title",
    "summary": "summary",
    "ctas": "ctas",
    "analyzedat": "analyzedAt",
    "dismissedat": "dismissedAt",
    "dismissedby": "dismissedBy",
}

var id: String ## Insight ID.
var createdat: String ## Insight creation date in ISO 8601 format.
var updatedat: String ## Insight update date in ISO 8601 format.
var reportid: String ## Parent report ID. Insights always belong to a report.
var xtype: String ## Insight type. One of databaseIndex (legacy), tablesDBIndex, documentsDBIndex, vectorsDBIndex, databasePerformance, sitePerformance, siteAccessibility, siteSeo, functionPerformance. The index types are engine-specific so each CTA can pair the right service+method (databases.createIndex, tablesDB.createIndex, documentsDB.createIndex, or vectorsDB.createIndex).
var severity: String ## Insight severity. One of info, warning, critical.
var status: String ## Insight status. One of active, dismissed.
var resourcetype: String ## Type of the resource the insight is about. Plural noun, e.g. databases, sites, functions.
var resourceid: String ## ID of the resource the insight is about.
var parentresourcetype: String ## Plural noun for the parent resource that contains the insight&#039;s resource, e.g. an insight about a column index on a table → resourceType=indexes, parentResourceType=tables. Empty when the resource has no parent.
var parentresourceid: String ## ID of the parent resource. Empty when the resource has no parent.
var title: String ## Insight title.
var summary: String ## Short markdown summary describing the insight.
var ctas: Array ## List of call-to-action buttons attached to this insight.
var analyzedat: String ## Time the insight was analyzed in ISO 8601 format.
var dismissedat: String ## Time the insight was dismissed in ISO 8601 format. Empty when not dismissed.
var dismissedby: String ## User ID that dismissed the insight. Empty when not dismissed.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteInsight.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "ctas" and value is Array:
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