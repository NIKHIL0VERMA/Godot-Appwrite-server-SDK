extends "../utils/service.gd"
## The Advisor service surfaces actionable reports about your project resources, with CTA descriptors for one-click remediation in the console.


## Get a list of all the project&#039;s analyzer reports. You can use the query params to filter your results.[br]
##[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: appId, type, targetType, target, analyzedAt[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteReportList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_reports(queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/reports'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteReportList


    return await _call('get', _path, _headers, _params, model_script)


## Get an analyzer report by its unique ID. The response includes the report&#039;s metadata and the nested insights it produced.[br]
##[br]
##[br]
## Parameters:[br]
## - [param report_id] [String]: Report ID.[br]
##[br]
## Returns:[br]
## - [AppwriteReport] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_report(report_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/reports/{reportId}'
    _path = _path.replace('{reportId}', report_id.uri_encode())

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteReport


    return await _call('get', _path, _headers, _params, model_script)


## Delete an analyzer report by its unique ID. Nested insights and CTA metadata are removed asynchronously by the deletes worker.[br]
##[br]
##[br]
## Parameters:[br]
## - [param report_id] [String]: Report ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_report(report_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/reports/{reportId}'
    _path = _path.replace('{reportId}', report_id.uri_encode())

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null


    return await _call('delete', _path, _headers, _params, model_script)


## List the insights produced under a single analyzer report. You can use the query params to filter your results further.[br]
##[br]
##[br]
## Parameters:[br]
## - [param report_id] [String]: Parent report ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: type, severity, status, resourceType, resourceId, parentResourceType, parentResourceId, analyzedAt, dismissedAt, dismissedBy[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteInsightList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_insights(report_id: String, queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/reports/{reportId}/insights'
    _path = _path.replace('{reportId}', report_id.uri_encode())

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteInsightList


    return await _call('get', _path, _headers, _params, model_script)


## Get an insight by its unique ID, scoped to its parent report.[br]
##[br]
##[br]
## Parameters:[br]
## - [param report_id] [String]: Parent report ID.[br]
## - [param insight_id] [String]: Insight ID.[br]
##[br]
## Returns:[br]
## - [AppwriteInsight] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_insight(report_id: String, insight_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/reports/{reportId}/insights/{insightId}'
    _path = _path.replace('{reportId}', report_id.uri_encode())
    _path = _path.replace('{insightId}', insight_id.uri_encode())

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteInsight


    return await _call('get', _path, _headers, _params, model_script)

