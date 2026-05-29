extends "../utils/service.gd"
## Service class.


## Get a list of all API keys from the current organization.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: expire, accessedAt, name, scopes[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteKeyList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_keys(queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/organization/keys'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteKeyList

    return await _call('get', _path, _headers, _params, model_script)


## Create a new organization API key.[br]
##[br]
## Parameters:[br]
## - [param key_id] [String]: Key ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Key name. Max length: 128 chars.[br]
## - [param scopes] [Array[String]]: Key scopes list. Maximum of 100 scopes are allowed.[br]
## - [param expire] [String]: Expiration time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. Use null for unlimited expiration.[br]
##[br]
## Returns:[br]
## - [AppwriteKey] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_key(key_id: String, xname: String, scopes: Array[String], expire: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if expire != null and not expire is String:
        return AppwriteException.new("Invalid type for parameter 'expire'. Expected String.", 0, "argument_error", "")

    var _path := '/organization/keys'

    var _params := {}
    _params['keyId'] = key_id
    _params['name'] = xname
    _params['scopes'] = scopes
    if expire != null:
        _params['expire'] = expire

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteKey

    return await _call('post', _path, _headers, _params, model_script)


## Get a key by its unique ID. This endpoint returns details about a specific API key in your organization including its scopes.[br]
##[br]
## Parameters:[br]
## - [param key_id] [String]: Key unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteKey] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_key(key_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organization/keys/{keyId}'
    _path = _path.replace('{keyId}', str(key_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteKey

    return await _call('get', _path, _headers, _params, model_script)


## Update a key by its unique ID. Use this endpoint to update the name, scopes, or expiration time of an API key.[br]
##[br]
## Parameters:[br]
## - [param key_id] [String]: Key unique ID.[br]
## - [param xname] [String]: Key name. Max length: 128 chars.[br]
## - [param scopes] [Array[String]]: Key scopes list. Maximum of 100 scopes are allowed.[br]
## - [param expire] [String]: Expiration time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. Use null for unlimited expiration.[br]
##[br]
## Returns:[br]
## - [AppwriteKey] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_key(key_id: String, xname: String, scopes: Array[String], expire: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if expire != null and not expire is String:
        return AppwriteException.new("Invalid type for parameter 'expire'. Expected String.", 0, "argument_error", "")

    var _path := '/organization/keys/{keyId}'
    _path = _path.replace('{keyId}', str(key_id))

    var _params := {}
    _params['name'] = xname
    _params['scopes'] = scopes
    if expire != null:
        _params['expire'] = expire

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteKey

    return await _call('put', _path, _headers, _params, model_script)


## Delete a key by its unique ID. Once deleted, the key can no longer be used to authenticate API calls.[br]
##[br]
## Parameters:[br]
## - [param key_id] [String]: Key unique ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_key(key_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organization/keys/{keyId}'
    _path = _path.replace('{keyId}', str(key_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Get a list of all projects. You can use the query params to filter your results.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, teamId, labels, search[br]
## - [param search] [String]: Search term to filter your list results. Max length: 256 chars.[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteProjectList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_projects(queries: Variant = null, search: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if search != null and not search is String:
        return AppwriteException.new("Invalid type for parameter 'search'. Expected String.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/organization/projects'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if search != null:
        _params['search'] = search
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteProjectList

    return await _call('get', _path, _headers, _params, model_script)


## Create a new project.[br]
##[br]
## Parameters:[br]
## - [param project_id] [String]: Unique Id. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, and hyphen. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Project name. Max length: 128 chars.[br]
## - [param region] [String]: Project Region.[br]
##[br]
## Returns:[br]
## - [AppwriteProject] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_project(project_id: String, xname: String, region: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if region != null and not region is String:
        return AppwriteException.new("Invalid type for parameter 'region'. Expected String.", 0, "argument_error", "")

    var _path := '/organization/projects'

    var _params := {}
    _params['projectId'] = project_id
    _params['name'] = xname
    if region != null:
        _params['region'] = region

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteProject

    return await _call('post', _path, _headers, _params, model_script)


## Get a project.[br]
##[br]
## Parameters:[br]
## - [param project_id] [String]: Project unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteProject] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_project(project_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organization/projects/{projectId}'
    _path = _path.replace('{projectId}', str(project_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteProject

    return await _call('get', _path, _headers, _params, model_script)


## Update a project by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param project_id] [String]: Project unique ID.[br]
## - [param xname] [String]: Project name. Max length: 128 chars.[br]
##[br]
## Returns:[br]
## - [AppwriteProject] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_project(project_id: String, xname: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organization/projects/{projectId}'
    _path = _path.replace('{projectId}', str(project_id))

    var _params := {}
    _params['name'] = xname

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteProject

    return await _call('patch', _path, _headers, _params, model_script)


## Delete a project by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param project_id] [String]: Project unique ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_project(project_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organization/projects/{projectId}'
    _path = _path.replace('{projectId}', str(project_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)

