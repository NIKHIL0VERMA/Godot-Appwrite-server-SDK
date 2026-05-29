extends "../utils/service.gd"
## The Project service allows you to manage all the projects in your Appwrite server.


## Record console access to a project. This endpoint updates the last accessed timestamp for the project to track console activity.[br]
##[br]
##[br]
## Parameters:[br]
## - [param project_id] [String]: Project ID[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_console_access(project_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/projects/{projectId}/console-access'
    _path = _path.replace('{projectId}', str(project_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('patch', _path, _headers, _params, model_script)


## List all the project\&#039;s dev keys. Dev keys are project specific and allow you to bypass rate limits and get better error logging during development.&#039;[br]
##[br]
## Parameters:[br]
## - [param project_id] [String]: Project unique ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: accessedAt, expire[br]
##[br]
## Returns:[br]
## - [AppwriteDevKeyList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_dev_keys(project_id: String, queries: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")

    var _path := '/projects/{projectId}/dev-keys'
    _path = _path.replace('{projectId}', str(project_id))

    var _params := {}
    if queries != null:
        _params['queries'] = queries

    var _headers := {
    }

    var model_script = AppwriteDevKeyList

    return await _call('get', _path, _headers, _params, model_script)


## Create a new project dev key. Dev keys are project specific and allow you to bypass rate limits and get better error logging during development. Strictly meant for development purposes only.[br]
##[br]
## Parameters:[br]
## - [param project_id] [String]: Project unique ID.[br]
## - [param xname] [String]: Key name. Max length: 128 chars.[br]
## - [param expire] [String]: Expiration time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.[br]
##[br]
## Returns:[br]
## - [AppwriteDevKey] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_dev_key(project_id: String, xname: String, expire: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/projects/{projectId}/dev-keys'
    _path = _path.replace('{projectId}', str(project_id))

    var _params := {}
    _params['name'] = xname
    _params['expire'] = expire

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDevKey

    return await _call('post', _path, _headers, _params, model_script)


## Get a project\&#039;s dev key by its unique ID. Dev keys are project specific and allow you to bypass rate limits and get better error logging during development.[br]
##[br]
## Parameters:[br]
## - [param project_id] [String]: Project unique ID.[br]
## - [param key_id] [String]: Key unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDevKey] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_dev_key(project_id: String, key_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/projects/{projectId}/dev-keys/{keyId}'
    _path = _path.replace('{projectId}', str(project_id))
    _path = _path.replace('{keyId}', str(key_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteDevKey

    return await _call('get', _path, _headers, _params, model_script)


## Update a project\&#039;s dev key by its unique ID. Use this endpoint to update a project\&#039;s dev key name or expiration time.&#039;[br]
##[br]
## Parameters:[br]
## - [param project_id] [String]: Project unique ID.[br]
## - [param key_id] [String]: Key unique ID.[br]
## - [param xname] [String]: Key name. Max length: 128 chars.[br]
## - [param expire] [String]: Expiration time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.[br]
##[br]
## Returns:[br]
## - [AppwriteDevKey] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_dev_key(project_id: String, key_id: String, xname: String, expire: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/projects/{projectId}/dev-keys/{keyId}'
    _path = _path.replace('{projectId}', str(project_id))
    _path = _path.replace('{keyId}', str(key_id))

    var _params := {}
    _params['name'] = xname
    _params['expire'] = expire

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDevKey

    return await _call('put', _path, _headers, _params, model_script)


## Delete a project\&#039;s dev key by its unique ID. Once deleted, the key will no longer allow bypassing of rate limits and better logging of errors.[br]
##[br]
## Parameters:[br]
## - [param project_id] [String]: Project unique ID.[br]
## - [param key_id] [String]: Key unique ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_dev_key(project_id: String, key_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/projects/{projectId}/dev-keys/{keyId}'
    _path = _path.replace('{projectId}', str(project_id))
    _path = _path.replace('{keyId}', str(key_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Get a list of all the project&#039;s schedules. You can use the query params to filter your results.[br]
##[br]
## Parameters:[br]
## - [param project_id] [String]: Project unique ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: resourceType, resourceId, projectId, schedule, active, region[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteScheduleList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_schedules(project_id: String, queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/projects/{projectId}/schedules'
    _path = _path.replace('{projectId}', str(project_id))

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteScheduleList

    return await _call('get', _path, _headers, _params, model_script)


## Create a new schedule for a resource.[br]
##[br]
## Parameters:[br]
## - [param project_id] [String]: Project unique ID.[br]
## - [param resource_type] [String]: The resource type for the schedule. Possible values: function, execution, message, backup.[br]
## - [param resource_id] [String]: The resource ID to associate with this schedule.[br]
## - [param schedule] [String]: Schedule CRON expression.[br]
## - [param active] [bool]: Whether the schedule is active.[br]
## - [param data] [Dictionary]: Schedule data as a JSON string. Used to store resource-specific context needed for execution.[br]
##[br]
## Returns:[br]
## - [AppwriteSchedule] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_schedule(project_id: String, resource_type: String, resource_id: String, schedule: String, active: Variant = null, data: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if active != null and not active is bool:
        return AppwriteException.new("Invalid type for parameter 'active'. Expected bool.", 0, "argument_error", "")
    if data != null and not data is Dictionary:
        return AppwriteException.new("Invalid type for parameter 'data'. Expected Dictionary.", 0, "argument_error", "")

    var _path := '/projects/{projectId}/schedules'
    _path = _path.replace('{projectId}', str(project_id))

    var _params := {}
    _params['resourceType'] = resource_type
    _params['resourceId'] = resource_id
    _params['schedule'] = schedule
    if active != null:
        _params['active'] = active
    if data != null:
        _params['data'] = data

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteSchedule

    return await _call('post', _path, _headers, _params, model_script)


## Get a schedule by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param project_id] [String]: Project unique ID.[br]
## - [param schedule_id] [String]: Schedule ID.[br]
##[br]
## Returns:[br]
## - [AppwriteSchedule] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_schedule(project_id: String, schedule_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/projects/{projectId}/schedules/{scheduleId}'
    _path = _path.replace('{projectId}', str(project_id))
    _path = _path.replace('{scheduleId}', str(schedule_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteSchedule

    return await _call('get', _path, _headers, _params, model_script)


## Update the status of a project. Can be used to archive/restore projects, and to restore paused projects. When restoring a paused project, the console fingerprint header must be provided and the project must not be blocked for any reason other than inactivity.[br]
##[br]
##[br]
## Parameters:[br]
## - [param project_id] [String]: Project ID[br]
## - [param status] [String]: New status for the project[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_status(project_id: String, status: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/projects/{projectId}/status'
    _path = _path.replace('{projectId}', str(project_id))

    var _params := {}
    _params['status'] = status

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('patch', _path, _headers, _params, model_script)


## Update the team ID of a project allowing for it to be transferred to another team.[br]
##[br]
## Parameters:[br]
## - [param project_id] [String]: Project unique ID.[br]
## - [param team_id] [String]: Team ID of the team to transfer project to.[br]
##[br]
## Returns:[br]
## - [AppwriteProject] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_team(project_id: String, team_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/projects/{projectId}/team'
    _path = _path.replace('{projectId}', str(project_id))

    var _params := {}
    _params['teamId'] = team_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteProject

    return await _call('patch', _path, _headers, _params, model_script)

