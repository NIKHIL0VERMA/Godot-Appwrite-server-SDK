class_name AppwriteExecution
extends RefCounted
## Execution[br]

const _ExecutionTrigger := preload("res://addons/appwrite/enums/execution_trigger.gd")
const _ExecutionStatus := preload("res://addons/appwrite/enums/execution_status.gd")

const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "permissions": "$permissions",
    "functionid": "functionId",
    "deploymentid": "deploymentId",
    "trigger": "trigger",
    "status": "status",
    "requestmethod": "requestMethod",
    "requestpath": "requestPath",
    "requestheaders": "requestHeaders",
    "responsestatuscode": "responseStatusCode",
    "responsebody": "responseBody",
    "responseheaders": "responseHeaders",
    "logs": "logs",
    "errors": "errors",
    "duration": "duration",
    "scheduledat": "scheduledAt",
}

var id: String ## Execution ID.
var createdat: String ## Execution creation date in ISO 8601 format.
var updatedat: String ## Execution update date in ISO 8601 format.
var permissions: Array ## Execution roles.
var functionid: String ## Function ID.
var deploymentid: String ## Function&#039;s deployment ID used to create the execution.
var trigger: String ## The trigger that caused the function to execute. Possible values can be: `http`, `schedule`, or `event`.
var status: String ## The status of the function execution. Possible values can be: `waiting`, `processing`, `completed`, `failed`, or `scheduled`.
var requestmethod: String ## HTTP request method type.
var requestpath: String ## HTTP request path and query.
var requestheaders: Array ## HTTP request headers as a key-value object. This will return only whitelisted headers. All headers are returned if execution is created as synchronous.
var responsestatuscode: int ## HTTP response status code.
var responsebody: String ## HTTP response body. This will return empty unless execution is created as synchronous.
var responseheaders: Array ## HTTP response headers as a key-value object. This will return only whitelisted headers. All headers are returned if execution is created as synchronous.
var logs: String ## Function logs. Includes the last 4,000 characters. This will return an empty string unless the response is returned using an API key or as part of a webhook payload.
var errors: String ## Function errors. Includes the last 4,000 characters. This will return an empty string unless the response is returned using an API key or as part of a webhook payload.
var duration: float ## Resource(function/site) execution duration in seconds.
var scheduledat: String ## The scheduled time for execution. If left empty, execution will be queued immediately.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteExecution.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "permissions" and value is Array:
            m.set(key, value)
            continue
        if key == "trigger" and value != null:
            if not _ExecutionTrigger.is_valid(value):
                push_error("Invalid enum value for trigger: %s" % value)
                return AppwriteException.new("Invalid enum value for trigger: %s" % value, 0, "invalid_enum_value", str(dict))
            m.set(key, value)
            continue
        if key == "status" and value != null:
            if not _ExecutionStatus.is_valid(value):
                push_error("Invalid enum value for status: %s" % value)
                return AppwriteException.new("Invalid enum value for status: %s" % value, 0, "invalid_enum_value", str(dict))
            m.set(key, value)
            continue
        if key == "requestheaders" and value is Array:
            m.set(key, value)
            continue
        if key == "responseheaders" and value is Array:
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