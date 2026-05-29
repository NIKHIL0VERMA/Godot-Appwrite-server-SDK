extends "../utils/service.gd"
## The Functions Service allows you view, create and manage your Cloud Functions.


## Get a list of all the project&#039;s functions. You can use the query params to filter your results.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, enabled, runtime, deploymentId, schedule, scheduleNext, schedulePrevious, timeout, entrypoint, commands, installationId[br]
## - [param search] [String]: Search term to filter your list results. Max length: 256 chars.[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteFunctionList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list(queries: Variant = null, search: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if search != null and not search is String:
        return AppwriteException.new("Invalid type for parameter 'search'. Expected String.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/functions'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if search != null:
        _params['search'] = search
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteFunctionList

    return await _call('get', _path, _headers, _params, model_script)


## Create a new function. You can pass a list of [permissions](https://appwrite.io/docs/permissions) to allow different project users or team with access to execute the function using the client API.[br]
##[br]
## Parameters:[br]
## - [param function_id] [String]: Function ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Function name. Max length: 128 chars.[br]
## - [param runtime] [String]: Execution runtime.[br]
## - [param execute] [Array]: An array of role strings with execution permissions. By default no user is granted with any execute permissions. [learn more about roles](https://appwrite.io/docs/permissions#permission-roles). Maximum of 100 roles are allowed, each 64 characters long.[br]
## - [param events] [Array]: Events list. Maximum of 100 events are allowed.[br]
## - [param schedule] [String]: Schedule CRON syntax.[br]
## - [param timeout] [int]: Function maximum execution time in seconds.[br]
## - [param enabled] [bool]: Is function enabled? When set to &#039;disabled&#039;, users cannot access the function but Server SDKs with and API key can still access the function. No data is lost when this is toggled.[br]
## - [param logging] [bool]: When disabled, executions will exclude logs and errors, and will be slightly faster.[br]
## - [param entrypoint] [String]: Entrypoint File. This path is relative to the &quot;providerRootDirectory&quot;.[br]
## - [param commands] [String]: Build Commands.[br]
## - [param scopes] [Array[String]]: List of scopes allowed for API key auto-generated for every execution. Maximum of 100 scopes are allowed.[br]
## - [param installation_id] [String]: Appwrite Installation ID for VCS (Version Control System) deployment.[br]
## - [param provider_repository_id] [String]: Repository ID of the repo linked to the function.[br]
## - [param provider_branch] [String]: Production branch for the repo linked to the function.[br]
## - [param provider_silent_mode] [bool]: Is the VCS (Version Control System) connection in silent mode for the repo linked to the function? In silent mode, comments will not be made on commits and pull requests.[br]
## - [param provider_root_directory] [String]: Path to function code in the linked repo.[br]
## - [param provider_branches] [Array]: List of branch name patterns to trigger automatic deployments. Supports wildcards. Leave empty to deploy on all branches.[br]
## - [param provider_paths] [Array]: List of file path patterns to trigger automatic deployments. Supports wildcards. Leave empty to deploy on all file changes.[br]
## - [param build_specification] [String]: Build specification for the function deployments.[br]
## - [param runtime_specification] [String]: Runtime specification for the function executions.[br]
## - [param deployment_retention] [int]: Days to keep non-active deployments before deletion. Value 0 means all deployments will be kept.[br]
##[br]
## Returns:[br]
## - [AppwriteFunction] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create(function_id: String, xname: String, runtime: String, execute: Variant = null, events: Variant = null, schedule: Variant = null, timeout: Variant = null, enabled: Variant = null, logging: Variant = null, entrypoint: Variant = null, commands: Variant = null, scopes: Variant = null, installation_id: Variant = null, provider_repository_id: Variant = null, provider_branch: Variant = null, provider_silent_mode: Variant = null, provider_root_directory: Variant = null, provider_branches: Variant = null, provider_paths: Variant = null, build_specification: Variant = null, runtime_specification: Variant = null, deployment_retention: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if execute != null and not execute is Array:
        return AppwriteException.new("Invalid type for parameter 'execute'. Expected Array.", 0, "argument_error", "")
    if events != null and not events is Array:
        return AppwriteException.new("Invalid type for parameter 'events'. Expected Array.", 0, "argument_error", "")
    if schedule != null and not schedule is String:
        return AppwriteException.new("Invalid type for parameter 'schedule'. Expected String.", 0, "argument_error", "")
    if timeout != null and not timeout is int:
        return AppwriteException.new("Invalid type for parameter 'timeout'. Expected int.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")
    if logging != null and not logging is bool:
        return AppwriteException.new("Invalid type for parameter 'logging'. Expected bool.", 0, "argument_error", "")
    if entrypoint != null and not entrypoint is String:
        return AppwriteException.new("Invalid type for parameter 'entrypoint'. Expected String.", 0, "argument_error", "")
    if commands != null and not commands is String:
        return AppwriteException.new("Invalid type for parameter 'commands'. Expected String.", 0, "argument_error", "")
    if scopes != null and not scopes is Array:
        return AppwriteException.new("Invalid type for parameter 'scopes'. Expected Array[String].", 0, "argument_error", "")
    if installation_id != null and not installation_id is String:
        return AppwriteException.new("Invalid type for parameter 'installation_id'. Expected String.", 0, "argument_error", "")
    if provider_repository_id != null and not provider_repository_id is String:
        return AppwriteException.new("Invalid type for parameter 'provider_repository_id'. Expected String.", 0, "argument_error", "")
    if provider_branch != null and not provider_branch is String:
        return AppwriteException.new("Invalid type for parameter 'provider_branch'. Expected String.", 0, "argument_error", "")
    if provider_silent_mode != null and not provider_silent_mode is bool:
        return AppwriteException.new("Invalid type for parameter 'provider_silent_mode'. Expected bool.", 0, "argument_error", "")
    if provider_root_directory != null and not provider_root_directory is String:
        return AppwriteException.new("Invalid type for parameter 'provider_root_directory'. Expected String.", 0, "argument_error", "")
    if provider_branches != null and not provider_branches is Array:
        return AppwriteException.new("Invalid type for parameter 'provider_branches'. Expected Array.", 0, "argument_error", "")
    if provider_paths != null and not provider_paths is Array:
        return AppwriteException.new("Invalid type for parameter 'provider_paths'. Expected Array.", 0, "argument_error", "")
    if build_specification != null and not build_specification is String:
        return AppwriteException.new("Invalid type for parameter 'build_specification'. Expected String.", 0, "argument_error", "")
    if runtime_specification != null and not runtime_specification is String:
        return AppwriteException.new("Invalid type for parameter 'runtime_specification'. Expected String.", 0, "argument_error", "")
    if deployment_retention != null and not deployment_retention is int:
        return AppwriteException.new("Invalid type for parameter 'deployment_retention'. Expected int.", 0, "argument_error", "")

    var _path := '/functions'

    var _params := {}
    _params['functionId'] = function_id
    _params['name'] = xname
    _params['runtime'] = runtime
    if execute != null:
        _params['execute'] = execute
    if events != null:
        _params['events'] = events
    if schedule != null:
        _params['schedule'] = schedule
    if timeout != null:
        _params['timeout'] = timeout
    if enabled != null:
        _params['enabled'] = enabled
    if logging != null:
        _params['logging'] = logging
    if entrypoint != null:
        _params['entrypoint'] = entrypoint
    if commands != null:
        _params['commands'] = commands
    if scopes != null:
        _params['scopes'] = scopes
    if installation_id != null:
        _params['installationId'] = installation_id
    if provider_repository_id != null:
        _params['providerRepositoryId'] = provider_repository_id
    if provider_branch != null:
        _params['providerBranch'] = provider_branch
    if provider_silent_mode != null:
        _params['providerSilentMode'] = provider_silent_mode
    if provider_root_directory != null:
        _params['providerRootDirectory'] = provider_root_directory
    if provider_branches != null:
        _params['providerBranches'] = provider_branches
    if provider_paths != null:
        _params['providerPaths'] = provider_paths
    if build_specification != null:
        _params['buildSpecification'] = build_specification
    if runtime_specification != null:
        _params['runtimeSpecification'] = runtime_specification
    if deployment_retention != null:
        _params['deploymentRetention'] = deployment_retention

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteFunction

    return await _call('post', _path, _headers, _params, model_script)


## Get a list of all runtimes that are currently active on your instance.[br]
##[br]
## Returns:[br]
## - [AppwriteRuntimeList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_runtimes() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/functions/runtimes'

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteRuntimeList

    return await _call('get', _path, _headers, _params, model_script)


## List allowed function specifications for this instance.[br]
##[br]
## Returns:[br]
## - [AppwriteSpecificationList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_specifications() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/functions/specifications'

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteSpecificationList

    return await _call('get', _path, _headers, _params, model_script)


## List available function templates. You can use template details in [createFunction](/docs/references/cloud/server-nodejs/functions#create) method.[br]
##[br]
## Parameters:[br]
## - [param runtimes] [Array[String]]: List of runtimes allowed for filtering function templates. Maximum of 100 runtimes are allowed.[br]
## - [param use_cases] [Array[String]]: List of use cases allowed for filtering function templates. Maximum of 100 use cases are allowed.[br]
## - [param limit] [int]: Limit the number of templates returned in the response. Default limit is 25, and maximum limit is 5000.[br]
## - [param offset] [int]: Offset the list of returned templates. Maximum offset is 5000.[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteTemplateFunctionList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_templates(runtimes: Variant = null, use_cases: Variant = null, limit: Variant = null, offset: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if runtimes != null and not runtimes is Array:
        return AppwriteException.new("Invalid type for parameter 'runtimes'. Expected Array[String].", 0, "argument_error", "")
    if use_cases != null and not use_cases is Array:
        return AppwriteException.new("Invalid type for parameter 'use_cases'. Expected Array[String].", 0, "argument_error", "")
    if limit != null and not limit is int:
        return AppwriteException.new("Invalid type for parameter 'limit'. Expected int.", 0, "argument_error", "")
    if offset != null and not offset is int:
        return AppwriteException.new("Invalid type for parameter 'offset'. Expected int.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/functions/templates'

    var _params := {}
    if runtimes != null:
        _params['runtimes'] = runtimes
    if use_cases != null:
        _params['useCases'] = use_cases
    if limit != null:
        _params['limit'] = limit
    if offset != null:
        _params['offset'] = offset
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteTemplateFunctionList

    return await _call('get', _path, _headers, _params, model_script)


## Get a function template using ID. You can use template details in [createFunction](/docs/references/cloud/server-nodejs/functions#create) method.[br]
##[br]
## Parameters:[br]
## - [param template_id] [String]: Template ID.[br]
##[br]
## Returns:[br]
## - [AppwriteTemplateFunction] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_template(template_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/functions/templates/{templateId}'
    _path = _path.replace('{templateId}', str(template_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteTemplateFunction

    return await _call('get', _path, _headers, _params, model_script)


## Get usage metrics and statistics for all functions in the project. View statistics including total deployments, builds, logs, storage usage, and compute time. The response includes both current totals and historical data for each metric. Use the optional range parameter to specify the time window for historical data: 24h (last 24 hours), 30d (last 30 days), or 90d (last 90 days). If not specified, defaults to 30 days.[br]
##[br]
## Parameters:[br]
## - [param xrange] [String]: Date range.[br]
##[br]
## Returns:[br]
## - [AppwriteUsageFunctions] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_usage(xrange: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xrange != null and not xrange is String:
        return AppwriteException.new("Invalid type for parameter 'xrange'. Expected String.", 0, "argument_error", "")

    var _path := '/functions/usage'

    var _params := {}
    if xrange != null:
        _params['range'] = xrange

    var _headers := {
    }

    var model_script = AppwriteUsageFunctions

    return await _call('get', _path, _headers, _params, model_script)


## Get a function by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param function_id] [String]: Function ID.[br]
##[br]
## Returns:[br]
## - [AppwriteFunction] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func xget(function_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/functions/{functionId}'
    _path = _path.replace('{functionId}', str(function_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteFunction

    return await _call('get', _path, _headers, _params, model_script)


## Update function by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param function_id] [String]: Function ID.[br]
## - [param xname] [String]: Function name. Max length: 128 chars.[br]
## - [param runtime] [String]: Execution runtime.[br]
## - [param execute] [Array]: An array of role strings with execution permissions. By default no user is granted with any execute permissions. [learn more about roles](https://appwrite.io/docs/permissions#permission-roles). Maximum of 100 roles are allowed, each 64 characters long.[br]
## - [param events] [Array]: Events list. Maximum of 100 events are allowed.[br]
## - [param schedule] [String]: Schedule CRON syntax.[br]
## - [param timeout] [int]: Maximum execution time in seconds.[br]
## - [param enabled] [bool]: Is function enabled? When set to &#039;disabled&#039;, users cannot access the function but Server SDKs with and API key can still access the function. No data is lost when this is toggled.[br]
## - [param logging] [bool]: When disabled, executions will exclude logs and errors, and will be slightly faster.[br]
## - [param entrypoint] [String]: Entrypoint File. This path is relative to the &quot;providerRootDirectory&quot;.[br]
## - [param commands] [String]: Build Commands.[br]
## - [param scopes] [Array[String]]: List of scopes allowed for API Key auto-generated for every execution. Maximum of 100 scopes are allowed.[br]
## - [param installation_id] [String]: Appwrite Installation ID for VCS (Version Controle System) deployment.[br]
## - [param provider_repository_id] [String]: Repository ID of the repo linked to the function[br]
## - [param provider_branch] [String]: Production branch for the repo linked to the function[br]
## - [param provider_silent_mode] [bool]: Is the VCS (Version Control System) connection in silent mode for the repo linked to the function? In silent mode, comments will not be made on commits and pull requests.[br]
## - [param provider_root_directory] [String]: Path to function code in the linked repo.[br]
## - [param provider_branches] [Array]: List of branch name patterns to trigger automatic deployments. Supports wildcards. Leave empty to deploy on all branches.[br]
## - [param provider_paths] [Array]: List of file path patterns to trigger automatic deployments. Supports wildcards. Leave empty to deploy on all file changes.[br]
## - [param build_specification] [String]: Build specification for the function deployments.[br]
## - [param runtime_specification] [String]: Runtime specification for the function executions.[br]
## - [param deployment_retention] [int]: Days to keep non-active deployments before deletion. Value 0 means all deployments will be kept.[br]
##[br]
## Returns:[br]
## - [AppwriteFunction] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update(function_id: String, xname: String, runtime: Variant = null, execute: Variant = null, events: Variant = null, schedule: Variant = null, timeout: Variant = null, enabled: Variant = null, logging: Variant = null, entrypoint: Variant = null, commands: Variant = null, scopes: Variant = null, installation_id: Variant = null, provider_repository_id: Variant = null, provider_branch: Variant = null, provider_silent_mode: Variant = null, provider_root_directory: Variant = null, provider_branches: Variant = null, provider_paths: Variant = null, build_specification: Variant = null, runtime_specification: Variant = null, deployment_retention: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if runtime != null and not runtime is String:
        return AppwriteException.new("Invalid type for parameter 'runtime'. Expected String.", 0, "argument_error", "")
    if execute != null and not execute is Array:
        return AppwriteException.new("Invalid type for parameter 'execute'. Expected Array.", 0, "argument_error", "")
    if events != null and not events is Array:
        return AppwriteException.new("Invalid type for parameter 'events'. Expected Array.", 0, "argument_error", "")
    if schedule != null and not schedule is String:
        return AppwriteException.new("Invalid type for parameter 'schedule'. Expected String.", 0, "argument_error", "")
    if timeout != null and not timeout is int:
        return AppwriteException.new("Invalid type for parameter 'timeout'. Expected int.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")
    if logging != null and not logging is bool:
        return AppwriteException.new("Invalid type for parameter 'logging'. Expected bool.", 0, "argument_error", "")
    if entrypoint != null and not entrypoint is String:
        return AppwriteException.new("Invalid type for parameter 'entrypoint'. Expected String.", 0, "argument_error", "")
    if commands != null and not commands is String:
        return AppwriteException.new("Invalid type for parameter 'commands'. Expected String.", 0, "argument_error", "")
    if scopes != null and not scopes is Array:
        return AppwriteException.new("Invalid type for parameter 'scopes'. Expected Array[String].", 0, "argument_error", "")
    if installation_id != null and not installation_id is String:
        return AppwriteException.new("Invalid type for parameter 'installation_id'. Expected String.", 0, "argument_error", "")
    if provider_repository_id != null and not provider_repository_id is String:
        return AppwriteException.new("Invalid type for parameter 'provider_repository_id'. Expected String.", 0, "argument_error", "")
    if provider_branch != null and not provider_branch is String:
        return AppwriteException.new("Invalid type for parameter 'provider_branch'. Expected String.", 0, "argument_error", "")
    if provider_silent_mode != null and not provider_silent_mode is bool:
        return AppwriteException.new("Invalid type for parameter 'provider_silent_mode'. Expected bool.", 0, "argument_error", "")
    if provider_root_directory != null and not provider_root_directory is String:
        return AppwriteException.new("Invalid type for parameter 'provider_root_directory'. Expected String.", 0, "argument_error", "")
    if provider_branches != null and not provider_branches is Array:
        return AppwriteException.new("Invalid type for parameter 'provider_branches'. Expected Array.", 0, "argument_error", "")
    if provider_paths != null and not provider_paths is Array:
        return AppwriteException.new("Invalid type for parameter 'provider_paths'. Expected Array.", 0, "argument_error", "")
    if build_specification != null and not build_specification is String:
        return AppwriteException.new("Invalid type for parameter 'build_specification'. Expected String.", 0, "argument_error", "")
    if runtime_specification != null and not runtime_specification is String:
        return AppwriteException.new("Invalid type for parameter 'runtime_specification'. Expected String.", 0, "argument_error", "")
    if deployment_retention != null and not deployment_retention is int:
        return AppwriteException.new("Invalid type for parameter 'deployment_retention'. Expected int.", 0, "argument_error", "")

    var _path := '/functions/{functionId}'
    _path = _path.replace('{functionId}', str(function_id))

    var _params := {}
    _params['name'] = xname
    if runtime != null:
        _params['runtime'] = runtime
    if execute != null:
        _params['execute'] = execute
    if events != null:
        _params['events'] = events
    if schedule != null:
        _params['schedule'] = schedule
    if timeout != null:
        _params['timeout'] = timeout
    if enabled != null:
        _params['enabled'] = enabled
    if logging != null:
        _params['logging'] = logging
    if entrypoint != null:
        _params['entrypoint'] = entrypoint
    if commands != null:
        _params['commands'] = commands
    if scopes != null:
        _params['scopes'] = scopes
    if installation_id != null:
        _params['installationId'] = installation_id
    if provider_repository_id != null:
        _params['providerRepositoryId'] = provider_repository_id
    if provider_branch != null:
        _params['providerBranch'] = provider_branch
    if provider_silent_mode != null:
        _params['providerSilentMode'] = provider_silent_mode
    if provider_root_directory != null:
        _params['providerRootDirectory'] = provider_root_directory
    if provider_branches != null:
        _params['providerBranches'] = provider_branches
    if provider_paths != null:
        _params['providerPaths'] = provider_paths
    if build_specification != null:
        _params['buildSpecification'] = build_specification
    if runtime_specification != null:
        _params['runtimeSpecification'] = runtime_specification
    if deployment_retention != null:
        _params['deploymentRetention'] = deployment_retention

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteFunction

    return await _call('put', _path, _headers, _params, model_script)


## Delete a function by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param function_id] [String]: Function ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete(function_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/functions/{functionId}'
    _path = _path.replace('{functionId}', str(function_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Update the function active deployment. Use this endpoint to switch the code deployment that should be used when visitor opens your function.[br]
##[br]
## Parameters:[br]
## - [param function_id] [String]: Function ID.[br]
## - [param deployment_id] [String]: Deployment ID.[br]
##[br]
## Returns:[br]
## - [AppwriteFunction] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_function_deployment(function_id: String, deployment_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/functions/{functionId}/deployment'
    _path = _path.replace('{functionId}', str(function_id))

    var _params := {}
    _params['deploymentId'] = deployment_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteFunction

    return await _call('patch', _path, _headers, _params, model_script)


## Get a list of all the function&#039;s code deployments. You can use the query params to filter your results.[br]
##[br]
## Parameters:[br]
## - [param function_id] [String]: Function ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: buildSize, sourceSize, totalSize, buildDuration, status, activate, type[br]
## - [param search] [String]: Search term to filter your list results. Max length: 256 chars.[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteDeploymentList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_deployments(function_id: String, queries: Variant = null, search: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if search != null and not search is String:
        return AppwriteException.new("Invalid type for parameter 'search'. Expected String.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/functions/{functionId}/deployments'
    _path = _path.replace('{functionId}', str(function_id))

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if search != null:
        _params['search'] = search
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteDeploymentList

    return await _call('get', _path, _headers, _params, model_script)


## Create a new function code deployment. Use this endpoint to upload a new version of your code function. To execute your newly uploaded code, you&#039;ll need to update the function&#039;s deployment to use your new deployment UID.[br]
##[br]
##This endpoint accepts a tar.gz file compressed with your code. Make sure to include any dependencies your code has within the compressed file. You can learn more about code packaging in the [Appwrite Cloud Functions tutorial](https://appwrite.io/docs/functions).[br]
##[br]
##Use the &quot;command&quot; param to set the entrypoint used to execute your code.[br]
##[br]
## Parameters:[br]
## - [param function_id] [String]: Function ID.[br]
## - [param code] [AppwriteInputFile]: Gzip file with your code package. When used with the Appwrite CLI, pass the path to your code directory, and the CLI will automatically package your code. Use a path that is within the current directory.[br]
## - [param activate] [bool]: Automatically activate the deployment when it is finished building.[br]
## - [param entrypoint] [String]: Entrypoint File.[br]
## - [param commands] [String]: Build Commands.[br]
##[br]
## Returns:[br]
## - [AppwriteDeployment] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_deployment(function_id: String, code: AppwriteInputFile, activate: bool, entrypoint: Variant = null, commands: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if entrypoint != null and not entrypoint is String:
        return AppwriteException.new("Invalid type for parameter 'entrypoint'. Expected String.", 0, "argument_error", "")
    if commands != null and not commands is String:
        return AppwriteException.new("Invalid type for parameter 'commands'. Expected String.", 0, "argument_error", "")

    var _path := '/functions/{functionId}/deployments'
    _path = _path.replace('{functionId}', str(function_id))

    var _params := {}
    if entrypoint != null:
        _params['entrypoint'] = entrypoint
    if commands != null:
        _params['commands'] = commands
    _params['code'] = code
    _params['activate'] = activate

    var _headers := {
        'content-type': 'multipart/form-data',
    }

    var model_script = AppwriteDeployment

    return await _call('post', _path, _headers, _params, model_script)


## Create a new build for an existing function deployment. This endpoint allows you to rebuild a deployment with the updated function configuration, including its entrypoint and build commands if they have been modified. The build process will be queued and executed asynchronously. The original deployment&#039;s code will be preserved and used for the new build.[br]
##[br]
## Parameters:[br]
## - [param function_id] [String]: Function ID.[br]
## - [param deployment_id] [String]: Deployment ID.[br]
## - [param build_id] [String]: Build unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDeployment] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_duplicate_deployment(function_id: String, deployment_id: String, build_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if build_id != null and not build_id is String:
        return AppwriteException.new("Invalid type for parameter 'build_id'. Expected String.", 0, "argument_error", "")

    var _path := '/functions/{functionId}/deployments/duplicate'
    _path = _path.replace('{functionId}', str(function_id))

    var _params := {}
    _params['deploymentId'] = deployment_id
    if build_id != null:
        _params['buildId'] = build_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDeployment

    return await _call('post', _path, _headers, _params, model_script)


## Create a deployment based on a template.[br]
##[br]
##Use this endpoint with combination of [listTemplates](https://appwrite.io/docs/products/functions/templates) to find the template details.[br]
##[br]
## Parameters:[br]
## - [param function_id] [String]: Function ID.[br]
## - [param repository] [String]: Repository name of the template.[br]
## - [param owner] [String]: The name of the owner of the template.[br]
## - [param root_directory] [String]: Path to function code in the template repo.[br]
## - [param xtype] [String]: Type for the reference provided. Can be commit, branch, or tag[br]
## - [param reference] [String]: Reference value, can be a commit hash, branch name, or release tag[br]
## - [param activate] [bool]: Automatically activate the deployment when it is finished building.[br]
##[br]
## Returns:[br]
## - [AppwriteDeployment] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_template_deployment(function_id: String, repository: String, owner: String, root_directory: String, xtype: String, reference: String, activate: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if activate != null and not activate is bool:
        return AppwriteException.new("Invalid type for parameter 'activate'. Expected bool.", 0, "argument_error", "")

    var _path := '/functions/{functionId}/deployments/template'
    _path = _path.replace('{functionId}', str(function_id))

    var _params := {}
    _params['repository'] = repository
    _params['owner'] = owner
    _params['rootDirectory'] = root_directory
    _params['type'] = xtype
    _params['reference'] = reference
    if activate != null:
        _params['activate'] = activate

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDeployment

    return await _call('post', _path, _headers, _params, model_script)


## Create a deployment when a function is connected to VCS.[br]
##[br]
##This endpoint lets you create deployment from a branch, commit, or a tag.[br]
##[br]
## Parameters:[br]
## - [param function_id] [String]: Function ID.[br]
## - [param xtype] [String]: Type of reference passed. Allowed values are: branch, commit[br]
## - [param reference] [String]: VCS reference to create deployment from. Depending on type this can be: branch name, commit hash[br]
## - [param activate] [bool]: Automatically activate the deployment when it is finished building.[br]
##[br]
## Returns:[br]
## - [AppwriteDeployment] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_vcs_deployment(function_id: String, xtype: String, reference: String, activate: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if activate != null and not activate is bool:
        return AppwriteException.new("Invalid type for parameter 'activate'. Expected bool.", 0, "argument_error", "")

    var _path := '/functions/{functionId}/deployments/vcs'
    _path = _path.replace('{functionId}', str(function_id))

    var _params := {}
    _params['type'] = xtype
    _params['reference'] = reference
    if activate != null:
        _params['activate'] = activate

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDeployment

    return await _call('post', _path, _headers, _params, model_script)


## Get a function deployment by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param function_id] [String]: Function ID.[br]
## - [param deployment_id] [String]: Deployment ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDeployment] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_deployment(function_id: String, deployment_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/functions/{functionId}/deployments/{deploymentId}'
    _path = _path.replace('{functionId}', str(function_id))
    _path = _path.replace('{deploymentId}', str(deployment_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteDeployment

    return await _call('get', _path, _headers, _params, model_script)


## Delete a code deployment by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param function_id] [String]: Function ID.[br]
## - [param deployment_id] [String]: Deployment ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_deployment(function_id: String, deployment_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/functions/{functionId}/deployments/{deploymentId}'
    _path = _path.replace('{functionId}', str(function_id))
    _path = _path.replace('{deploymentId}', str(deployment_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Get a function deployment content by its unique ID. The endpoint response return with a &#039;Content-Disposition: attachment&#039; header that tells the browser to start downloading the file to user downloads directory.[br]
##[br]
## Parameters:[br]
## - [param function_id] [String]: Function ID.[br]
## - [param deployment_id] [String]: Deployment ID.[br]
## - [param xtype] [String]: Deployment file to download. Can be: &quot;source&quot;, &quot;output&quot;.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_deployment_download(function_id: String, deployment_id: String, xtype: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xtype != null and not xtype is String:
        return AppwriteException.new("Invalid type for parameter 'xtype'. Expected String.", 0, "argument_error", "")

    var _path := '/functions/{functionId}/deployments/{deploymentId}/download'
    _path = _path.replace('{functionId}', str(function_id))
    _path = _path.replace('{deploymentId}', str(deployment_id))

    var _params := {}
    if xtype != null:
        _params['type'] = xtype

    var _headers := {
    }

    var model_script = null

    return await _call('get', _path, _headers, _params, model_script)


## Cancel an ongoing function deployment build. If the build is already in progress, it will be stopped and marked as canceled. If the build hasn&#039;t started yet, it will be marked as canceled without executing. You cannot cancel builds that have already completed (status &#039;ready&#039;) or failed. The response includes the final build status and details.[br]
##[br]
## Parameters:[br]
## - [param function_id] [String]: Function ID.[br]
## - [param deployment_id] [String]: Deployment ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDeployment] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_deployment_status(function_id: String, deployment_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/functions/{functionId}/deployments/{deploymentId}/status'
    _path = _path.replace('{functionId}', str(function_id))
    _path = _path.replace('{deploymentId}', str(deployment_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDeployment

    return await _call('patch', _path, _headers, _params, model_script)


## Get a list of all the current user function execution logs. You can use the query params to filter your results.[br]
##[br]
## Parameters:[br]
## - [param function_id] [String]: Function ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: trigger, status, responseStatusCode, duration, requestMethod, requestPath, deploymentId[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteExecutionList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_executions(function_id: String, queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/functions/{functionId}/executions'
    _path = _path.replace('{functionId}', str(function_id))

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteExecutionList

    return await _call('get', _path, _headers, _params, model_script)


## Trigger a function execution. The returned object will return you the current execution status. You can ping the `Get Execution` endpoint to get updates on the current execution status. Once this endpoint is called, your function execution process will start asynchronously.[br]
##[br]
## Parameters:[br]
## - [param function_id] [String]: Function ID.[br]
## - [param body] [String]: HTTP body of execution. Default value is empty string.[br]
## - [param async] [bool]: Execute code in the background. Default value is false.[br]
## - [param path] [String]: HTTP path of execution. Path can include query params. Default value is /[br]
## - [param method] [String]: HTTP method of execution. Default value is POST.[br]
## - [param headers] [Dictionary]: HTTP headers of execution. Defaults to empty.[br]
## - [param scheduled_at] [String]: Scheduled execution time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. DateTime value must be in future with precision in minutes.[br]
##[br]
## Returns:[br]
## - [AppwriteExecution] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_execution(function_id: String, body: Variant = null, async: Variant = null, path: Variant = null, method: Variant = null, headers: Variant = null, scheduled_at: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if body != null and not body is String:
        return AppwriteException.new("Invalid type for parameter 'body'. Expected String.", 0, "argument_error", "")
    if async != null and not async is bool:
        return AppwriteException.new("Invalid type for parameter 'async'. Expected bool.", 0, "argument_error", "")
    if path != null and not path is String:
        return AppwriteException.new("Invalid type for parameter 'path'. Expected String.", 0, "argument_error", "")
    if method != null and not method is String:
        return AppwriteException.new("Invalid type for parameter 'method'. Expected String.", 0, "argument_error", "")
    if headers != null and not headers is Dictionary:
        return AppwriteException.new("Invalid type for parameter 'headers'. Expected Dictionary.", 0, "argument_error", "")
    if scheduled_at != null and not scheduled_at is String:
        return AppwriteException.new("Invalid type for parameter 'scheduled_at'. Expected String.", 0, "argument_error", "")

    var _path := '/functions/{functionId}/executions'
    _path = _path.replace('{functionId}', str(function_id))

    var _params := {}
    if body != null:
        _params['body'] = body
    if async != null:
        _params['async'] = async
    if path != null:
        _params['path'] = path
    if method != null:
        _params['method'] = method
    if headers != null:
        _params['headers'] = headers
    if scheduled_at != null:
        _params['scheduledAt'] = scheduled_at

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteExecution

    return await _call('post', _path, _headers, _params, model_script)


## Get a function execution log by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param function_id] [String]: Function ID.[br]
## - [param execution_id] [String]: Execution ID.[br]
##[br]
## Returns:[br]
## - [AppwriteExecution] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_execution(function_id: String, execution_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/functions/{functionId}/executions/{executionId}'
    _path = _path.replace('{functionId}', str(function_id))
    _path = _path.replace('{executionId}', str(execution_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteExecution

    return await _call('get', _path, _headers, _params, model_script)


## Delete a function execution by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param function_id] [String]: Function ID.[br]
## - [param execution_id] [String]: Execution ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_execution(function_id: String, execution_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/functions/{functionId}/executions/{executionId}'
    _path = _path.replace('{functionId}', str(function_id))
    _path = _path.replace('{executionId}', str(execution_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Get usage metrics and statistics for a for a specific function. View statistics including total deployments, builds, executions, storage usage, and compute time. The response includes both current totals and historical data for each metric. Use the optional range parameter to specify the time window for historical data: 24h (last 24 hours), 30d (last 30 days), or 90d (last 90 days). If not specified, defaults to 30 days.[br]
##[br]
## Parameters:[br]
## - [param function_id] [String]: Function ID.[br]
## - [param xrange] [String]: Date range.[br]
##[br]
## Returns:[br]
## - [AppwriteUsageFunction] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_usage(function_id: String, xrange: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xrange != null and not xrange is String:
        return AppwriteException.new("Invalid type for parameter 'xrange'. Expected String.", 0, "argument_error", "")

    var _path := '/functions/{functionId}/usage'
    _path = _path.replace('{functionId}', str(function_id))

    var _params := {}
    if xrange != null:
        _params['range'] = xrange

    var _headers := {
    }

    var model_script = AppwriteUsageFunction

    return await _call('get', _path, _headers, _params, model_script)


## Get a list of all variables of a specific function.[br]
##[br]
## Parameters:[br]
## - [param function_id] [String]: Function unique ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: key, resourceType, resourceId, secret[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteVariableList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_variables(function_id: String, queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/functions/{functionId}/variables'
    _path = _path.replace('{functionId}', str(function_id))

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteVariableList

    return await _call('get', _path, _headers, _params, model_script)


## Create a new function environment variable. These variables can be accessed in the function at runtime as environment variables.[br]
##[br]
## Parameters:[br]
## - [param function_id] [String]: Function unique ID.[br]
## - [param variable_id] [String]: Variable ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param key] [String]: Variable key. Max length: 255 chars.[br]
## - [param value] [String]: Variable value. Max length: 8192 chars.[br]
## - [param secret] [bool]: Secret variables can be updated or deleted, but only functions can read them during build and runtime.[br]
##[br]
## Returns:[br]
## - [AppwriteVariable] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_variable(function_id: String, variable_id: String, key: String, value: String, secret: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if secret != null and not secret is bool:
        return AppwriteException.new("Invalid type for parameter 'secret'. Expected bool.", 0, "argument_error", "")

    var _path := '/functions/{functionId}/variables'
    _path = _path.replace('{functionId}', str(function_id))

    var _params := {}
    _params['variableId'] = variable_id
    _params['key'] = key
    _params['value'] = value
    if secret != null:
        _params['secret'] = secret

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteVariable

    return await _call('post', _path, _headers, _params, model_script)


## Get a variable by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param function_id] [String]: Function unique ID.[br]
## - [param variable_id] [String]: Variable unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteVariable] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_variable(function_id: String, variable_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/functions/{functionId}/variables/{variableId}'
    _path = _path.replace('{functionId}', str(function_id))
    _path = _path.replace('{variableId}', str(variable_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteVariable

    return await _call('get', _path, _headers, _params, model_script)


## Update variable by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param function_id] [String]: Function unique ID.[br]
## - [param variable_id] [String]: Variable unique ID.[br]
## - [param key] [String]: Variable key. Max length: 255 chars.[br]
## - [param value] [String]: Variable value. Max length: 8192 chars.[br]
## - [param secret] [bool]: Secret variables can be updated or deleted, but only functions can read them during build and runtime.[br]
##[br]
## Returns:[br]
## - [AppwriteVariable] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_variable(function_id: String, variable_id: String, key: Variant = null, value: Variant = null, secret: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if key != null and not key is String:
        return AppwriteException.new("Invalid type for parameter 'key'. Expected String.", 0, "argument_error", "")
    if value != null and not value is String:
        return AppwriteException.new("Invalid type for parameter 'value'. Expected String.", 0, "argument_error", "")
    if secret != null and not secret is bool:
        return AppwriteException.new("Invalid type for parameter 'secret'. Expected bool.", 0, "argument_error", "")

    var _path := '/functions/{functionId}/variables/{variableId}'
    _path = _path.replace('{functionId}', str(function_id))
    _path = _path.replace('{variableId}', str(variable_id))

    var _params := {}
    if key != null:
        _params['key'] = key
    if value != null:
        _params['value'] = value
    if secret != null:
        _params['secret'] = secret

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteVariable

    return await _call('put', _path, _headers, _params, model_script)


## Delete a variable by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param function_id] [String]: Function unique ID.[br]
## - [param variable_id] [String]: Variable unique ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_variable(function_id: String, variable_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/functions/{functionId}/variables/{variableId}'
    _path = _path.replace('{functionId}', str(function_id))
    _path = _path.replace('{variableId}', str(variable_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)

