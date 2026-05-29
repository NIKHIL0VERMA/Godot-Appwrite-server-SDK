extends "../utils/service.gd"
## The Sites Service allows you view, create and manage your web applications.


## Get a list of all the project&#039;s sites. You can use the query params to filter your results.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, enabled, framework, deploymentId, buildCommand, installCommand, outputDirectory, installationId[br]
## - [param search] [String]: Search term to filter your list results. Max length: 256 chars.[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteSiteList] on success.[br]
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

    var _path := '/sites'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if search != null:
        _params['search'] = search
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteSiteList

    return await _call('get', _path, _headers, _params, model_script)


## Create a new site.[br]
##[br]
## Parameters:[br]
## - [param site_id] [String]: Site ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Site name. Max length: 128 chars.[br]
## - [param framework] [String]: Sites framework.[br]
## - [param build_runtime] [String]: Runtime to use during build step.[br]
## - [param enabled] [bool]: Is site enabled? When set to &#039;disabled&#039;, users cannot access the site but Server SDKs with and API key can still access the site. No data is lost when this is toggled.[br]
## - [param logging] [bool]: When disabled, request logs will exclude logs and errors, and site responses will be slightly faster.[br]
## - [param timeout] [int]: Maximum request time in seconds.[br]
## - [param install_command] [String]: Install Command.[br]
## - [param build_command] [String]: Build Command.[br]
## - [param start_command] [String]: Custom start command. Leave empty to use default.[br]
## - [param output_directory] [String]: Output Directory for site.[br]
## - [param adapter] [String]: Framework adapter defining rendering strategy. Allowed values are: static, ssr[br]
## - [param installation_id] [String]: Appwrite Installation ID for VCS (Version Control System) deployment.[br]
## - [param fallback_file] [String]: Fallback file for single page application sites.[br]
## - [param provider_repository_id] [String]: Repository ID of the repo linked to the site.[br]
## - [param provider_branch] [String]: Production branch for the repo linked to the site.[br]
## - [param provider_silent_mode] [bool]: Is the VCS (Version Control System) connection in silent mode for the repo linked to the site? In silent mode, comments will not be made on commits and pull requests.[br]
## - [param provider_root_directory] [String]: Path to site code in the linked repo.[br]
## - [param provider_branches] [Array]: List of branch name patterns to trigger automatic deployments. Supports wildcards. Leave empty to deploy on all branches.[br]
## - [param provider_paths] [Array]: List of file path patterns to trigger automatic deployments. Supports wildcards. Leave empty to deploy on all file changes.[br]
## - [param build_specification] [String]: Build specification for the site deployments.[br]
## - [param runtime_specification] [String]: Runtime specification for the SSR executions.[br]
## - [param deployment_retention] [int]: Days to keep non-active deployments before deletion. Value 0 means all deployments will be kept.[br]
##[br]
## Returns:[br]
## - [AppwriteSite] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create(site_id: String, xname: String, framework: String, build_runtime: String, enabled: Variant = null, logging: Variant = null, timeout: Variant = null, install_command: Variant = null, build_command: Variant = null, start_command: Variant = null, output_directory: Variant = null, adapter: Variant = null, installation_id: Variant = null, fallback_file: Variant = null, provider_repository_id: Variant = null, provider_branch: Variant = null, provider_silent_mode: Variant = null, provider_root_directory: Variant = null, provider_branches: Variant = null, provider_paths: Variant = null, build_specification: Variant = null, runtime_specification: Variant = null, deployment_retention: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")
    if logging != null and not logging is bool:
        return AppwriteException.new("Invalid type for parameter 'logging'. Expected bool.", 0, "argument_error", "")
    if timeout != null and not timeout is int:
        return AppwriteException.new("Invalid type for parameter 'timeout'. Expected int.", 0, "argument_error", "")
    if install_command != null and not install_command is String:
        return AppwriteException.new("Invalid type for parameter 'install_command'. Expected String.", 0, "argument_error", "")
    if build_command != null and not build_command is String:
        return AppwriteException.new("Invalid type for parameter 'build_command'. Expected String.", 0, "argument_error", "")
    if start_command != null and not start_command is String:
        return AppwriteException.new("Invalid type for parameter 'start_command'. Expected String.", 0, "argument_error", "")
    if output_directory != null and not output_directory is String:
        return AppwriteException.new("Invalid type for parameter 'output_directory'. Expected String.", 0, "argument_error", "")
    if adapter != null and not adapter is String:
        return AppwriteException.new("Invalid type for parameter 'adapter'. Expected String.", 0, "argument_error", "")
    if installation_id != null and not installation_id is String:
        return AppwriteException.new("Invalid type for parameter 'installation_id'. Expected String.", 0, "argument_error", "")
    if fallback_file != null and not fallback_file is String:
        return AppwriteException.new("Invalid type for parameter 'fallback_file'. Expected String.", 0, "argument_error", "")
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

    var _path := '/sites'

    var _params := {}
    _params['siteId'] = site_id
    _params['name'] = xname
    _params['framework'] = framework
    if enabled != null:
        _params['enabled'] = enabled
    if logging != null:
        _params['logging'] = logging
    if timeout != null:
        _params['timeout'] = timeout
    if install_command != null:
        _params['installCommand'] = install_command
    if build_command != null:
        _params['buildCommand'] = build_command
    if start_command != null:
        _params['startCommand'] = start_command
    if output_directory != null:
        _params['outputDirectory'] = output_directory
    _params['buildRuntime'] = build_runtime
    if adapter != null:
        _params['adapter'] = adapter
    if installation_id != null:
        _params['installationId'] = installation_id
    if fallback_file != null:
        _params['fallbackFile'] = fallback_file
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

    var model_script = AppwriteSite

    return await _call('post', _path, _headers, _params, model_script)


## Get a list of all frameworks that are currently available on the server instance.[br]
##[br]
## Returns:[br]
## - [AppwriteFrameworkList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_frameworks() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/sites/frameworks'

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteFrameworkList

    return await _call('get', _path, _headers, _params, model_script)


## List allowed site specifications for this instance.[br]
##[br]
## Returns:[br]
## - [AppwriteSpecificationList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_specifications() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/sites/specifications'

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteSpecificationList

    return await _call('get', _path, _headers, _params, model_script)


## List available site templates. You can use template details in [createSite](/docs/references/cloud/server-nodejs/sites#create) method.[br]
##[br]
## Parameters:[br]
## - [param frameworks] [Array[String]]: List of frameworks allowed for filtering site templates. Maximum of 100 frameworks are allowed.[br]
## - [param use_cases] [Array[String]]: List of use cases allowed for filtering site templates. Maximum of 100 use cases are allowed.[br]
## - [param limit] [int]: Limit the number of templates returned in the response. Default limit is 25, and maximum limit is 5000.[br]
## - [param offset] [int]: Offset the list of returned templates. Maximum offset is 5000.[br]
##[br]
## Returns:[br]
## - [AppwriteTemplateSiteList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_templates(frameworks: Variant = null, use_cases: Variant = null, limit: Variant = null, offset: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if frameworks != null and not frameworks is Array:
        return AppwriteException.new("Invalid type for parameter 'frameworks'. Expected Array[String].", 0, "argument_error", "")
    if use_cases != null and not use_cases is Array:
        return AppwriteException.new("Invalid type for parameter 'use_cases'. Expected Array[String].", 0, "argument_error", "")
    if limit != null and not limit is int:
        return AppwriteException.new("Invalid type for parameter 'limit'. Expected int.", 0, "argument_error", "")
    if offset != null and not offset is int:
        return AppwriteException.new("Invalid type for parameter 'offset'. Expected int.", 0, "argument_error", "")

    var _path := '/sites/templates'

    var _params := {}
    if frameworks != null:
        _params['frameworks'] = frameworks
    if use_cases != null:
        _params['useCases'] = use_cases
    if limit != null:
        _params['limit'] = limit
    if offset != null:
        _params['offset'] = offset

    var _headers := {
    }

    var model_script = AppwriteTemplateSiteList

    return await _call('get', _path, _headers, _params, model_script)


## Get a site template using ID. You can use template details in [createSite](/docs/references/cloud/server-nodejs/sites#create) method.[br]
##[br]
## Parameters:[br]
## - [param template_id] [String]: Template ID.[br]
##[br]
## Returns:[br]
## - [AppwriteTemplateSite] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_template(template_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/sites/templates/{templateId}'
    _path = _path.replace('{templateId}', str(template_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteTemplateSite

    return await _call('get', _path, _headers, _params, model_script)


## Get usage metrics and statistics for all sites in the project. View statistics including total deployments, builds, logs, storage usage, and compute time. The response includes both current totals and historical data for each metric. Use the optional range parameter to specify the time window for historical data: 24h (last 24 hours), 30d (last 30 days), or 90d (last 90 days). If not specified, defaults to 30 days.[br]
##[br]
## Parameters:[br]
## - [param xrange] [String]: Date range.[br]
##[br]
## Returns:[br]
## - [AppwriteUsageSites] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_usage(xrange: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xrange != null and not xrange is String:
        return AppwriteException.new("Invalid type for parameter 'xrange'. Expected String.", 0, "argument_error", "")

    var _path := '/sites/usage'

    var _params := {}
    if xrange != null:
        _params['range'] = xrange

    var _headers := {
    }

    var model_script = AppwriteUsageSites

    return await _call('get', _path, _headers, _params, model_script)


## Get a site by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param site_id] [String]: Site ID.[br]
##[br]
## Returns:[br]
## - [AppwriteSite] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func xget(site_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/sites/{siteId}'
    _path = _path.replace('{siteId}', str(site_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteSite

    return await _call('get', _path, _headers, _params, model_script)


## Update site by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param site_id] [String]: Site ID.[br]
## - [param xname] [String]: Site name. Max length: 128 chars.[br]
## - [param framework] [String]: Sites framework.[br]
## - [param enabled] [bool]: Is site enabled? When set to &#039;disabled&#039;, users cannot access the site but Server SDKs with and API key can still access the site. No data is lost when this is toggled.[br]
## - [param logging] [bool]: When disabled, request logs will exclude logs and errors, and site responses will be slightly faster.[br]
## - [param timeout] [int]: Maximum request time in seconds.[br]
## - [param install_command] [String]: Install Command.[br]
## - [param build_command] [String]: Build Command.[br]
## - [param start_command] [String]: Custom start command. Leave empty to use default.[br]
## - [param output_directory] [String]: Output Directory for site.[br]
## - [param build_runtime] [String]: Runtime to use during build step.[br]
## - [param adapter] [String]: Framework adapter defining rendering strategy. Allowed values are: static, ssr[br]
## - [param fallback_file] [String]: Fallback file for single page application sites.[br]
## - [param installation_id] [String]: Appwrite Installation ID for VCS (Version Control System) deployment.[br]
## - [param provider_repository_id] [String]: Repository ID of the repo linked to the site.[br]
## - [param provider_branch] [String]: Production branch for the repo linked to the site.[br]
## - [param provider_silent_mode] [bool]: Is the VCS (Version Control System) connection in silent mode for the repo linked to the site? In silent mode, comments will not be made on commits and pull requests.[br]
## - [param provider_root_directory] [String]: Path to site code in the linked repo.[br]
## - [param provider_branches] [Array]: List of branch name patterns to trigger automatic deployments. Supports wildcards. Leave empty to deploy on all branches.[br]
## - [param provider_paths] [Array]: List of file path patterns to trigger automatic deployments. Supports wildcards. Leave empty to deploy on all file changes.[br]
## - [param build_specification] [String]: Build specification for the site deployments.[br]
## - [param runtime_specification] [String]: Runtime specification for the SSR executions.[br]
## - [param deployment_retention] [int]: Days to keep non-active deployments before deletion. Value 0 means all deployments will be kept.[br]
##[br]
## Returns:[br]
## - [AppwriteSite] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update(site_id: String, xname: String, framework: String, enabled: Variant = null, logging: Variant = null, timeout: Variant = null, install_command: Variant = null, build_command: Variant = null, start_command: Variant = null, output_directory: Variant = null, build_runtime: Variant = null, adapter: Variant = null, fallback_file: Variant = null, installation_id: Variant = null, provider_repository_id: Variant = null, provider_branch: Variant = null, provider_silent_mode: Variant = null, provider_root_directory: Variant = null, provider_branches: Variant = null, provider_paths: Variant = null, build_specification: Variant = null, runtime_specification: Variant = null, deployment_retention: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")
    if logging != null and not logging is bool:
        return AppwriteException.new("Invalid type for parameter 'logging'. Expected bool.", 0, "argument_error", "")
    if timeout != null and not timeout is int:
        return AppwriteException.new("Invalid type for parameter 'timeout'. Expected int.", 0, "argument_error", "")
    if install_command != null and not install_command is String:
        return AppwriteException.new("Invalid type for parameter 'install_command'. Expected String.", 0, "argument_error", "")
    if build_command != null and not build_command is String:
        return AppwriteException.new("Invalid type for parameter 'build_command'. Expected String.", 0, "argument_error", "")
    if start_command != null and not start_command is String:
        return AppwriteException.new("Invalid type for parameter 'start_command'. Expected String.", 0, "argument_error", "")
    if output_directory != null and not output_directory is String:
        return AppwriteException.new("Invalid type for parameter 'output_directory'. Expected String.", 0, "argument_error", "")
    if build_runtime != null and not build_runtime is String:
        return AppwriteException.new("Invalid type for parameter 'build_runtime'. Expected String.", 0, "argument_error", "")
    if adapter != null and not adapter is String:
        return AppwriteException.new("Invalid type for parameter 'adapter'. Expected String.", 0, "argument_error", "")
    if fallback_file != null and not fallback_file is String:
        return AppwriteException.new("Invalid type for parameter 'fallback_file'. Expected String.", 0, "argument_error", "")
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

    var _path := '/sites/{siteId}'
    _path = _path.replace('{siteId}', str(site_id))

    var _params := {}
    _params['name'] = xname
    _params['framework'] = framework
    if enabled != null:
        _params['enabled'] = enabled
    if logging != null:
        _params['logging'] = logging
    if timeout != null:
        _params['timeout'] = timeout
    if install_command != null:
        _params['installCommand'] = install_command
    if build_command != null:
        _params['buildCommand'] = build_command
    if start_command != null:
        _params['startCommand'] = start_command
    if output_directory != null:
        _params['outputDirectory'] = output_directory
    if build_runtime != null:
        _params['buildRuntime'] = build_runtime
    if adapter != null:
        _params['adapter'] = adapter
    if fallback_file != null:
        _params['fallbackFile'] = fallback_file
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

    var model_script = AppwriteSite

    return await _call('put', _path, _headers, _params, model_script)


## Delete a site by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param site_id] [String]: Site ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete(site_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/sites/{siteId}'
    _path = _path.replace('{siteId}', str(site_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Update the site active deployment. Use this endpoint to switch the code deployment that should be used when visitor opens your site.[br]
##[br]
## Parameters:[br]
## - [param site_id] [String]: Site ID.[br]
## - [param deployment_id] [String]: Deployment ID.[br]
##[br]
## Returns:[br]
## - [AppwriteSite] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_site_deployment(site_id: String, deployment_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/sites/{siteId}/deployment'
    _path = _path.replace('{siteId}', str(site_id))

    var _params := {}
    _params['deploymentId'] = deployment_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteSite

    return await _call('patch', _path, _headers, _params, model_script)


## Get a list of all the site&#039;s code deployments. You can use the query params to filter your results.[br]
##[br]
## Parameters:[br]
## - [param site_id] [String]: Site ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: buildSize, sourceSize, totalSize, buildDuration, status, activate, type[br]
## - [param search] [String]: Search term to filter your list results. Max length: 256 chars.[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteDeploymentList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_deployments(site_id: String, queries: Variant = null, search: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if search != null and not search is String:
        return AppwriteException.new("Invalid type for parameter 'search'. Expected String.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/sites/{siteId}/deployments'
    _path = _path.replace('{siteId}', str(site_id))

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


## Create a new site code deployment. Use this endpoint to upload a new version of your site code. To activate your newly uploaded code, you&#039;ll need to update the site&#039;s deployment to use your new deployment ID.[br]
##[br]
## Parameters:[br]
## - [param site_id] [String]: Site ID.[br]
## - [param code] [AppwriteInputFile]: Gzip file with your code package. When used with the Appwrite CLI, pass the path to your code directory, and the CLI will automatically package your code. Use a path that is within the current directory.[br]
## - [param install_command] [String]: Install Commands.[br]
## - [param build_command] [String]: Build Commands.[br]
## - [param output_directory] [String]: Output Directory.[br]
## - [param activate] [bool]: Automatically activate the deployment when it is finished building.[br]
##[br]
## Returns:[br]
## - [AppwriteDeployment] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_deployment(site_id: String, code: AppwriteInputFile, install_command: Variant = null, build_command: Variant = null, output_directory: Variant = null, activate: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if install_command != null and not install_command is String:
        return AppwriteException.new("Invalid type for parameter 'install_command'. Expected String.", 0, "argument_error", "")
    if build_command != null and not build_command is String:
        return AppwriteException.new("Invalid type for parameter 'build_command'. Expected String.", 0, "argument_error", "")
    if output_directory != null and not output_directory is String:
        return AppwriteException.new("Invalid type for parameter 'output_directory'. Expected String.", 0, "argument_error", "")
    if activate != null and not activate is bool:
        return AppwriteException.new("Invalid type for parameter 'activate'. Expected bool.", 0, "argument_error", "")

    var _path := '/sites/{siteId}/deployments'
    _path = _path.replace('{siteId}', str(site_id))

    var _params := {}
    if install_command != null:
        _params['installCommand'] = install_command
    if build_command != null:
        _params['buildCommand'] = build_command
    if output_directory != null:
        _params['outputDirectory'] = output_directory
    _params['code'] = code
    if activate != null:
        _params['activate'] = activate

    var _headers := {
        'content-type': 'multipart/form-data',
    }

    var model_script = AppwriteDeployment

    return await _call('post', _path, _headers, _params, model_script)


## Create a new build for an existing site deployment. This endpoint allows you to rebuild a deployment with the updated site configuration, including its commands and output directory if they have been modified. The build process will be queued and executed asynchronously. The original deployment&#039;s code will be preserved and used for the new build.[br]
##[br]
## Parameters:[br]
## - [param site_id] [String]: Site ID.[br]
## - [param deployment_id] [String]: Deployment ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDeployment] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_duplicate_deployment(site_id: String, deployment_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/sites/{siteId}/deployments/duplicate'
    _path = _path.replace('{siteId}', str(site_id))

    var _params := {}
    _params['deploymentId'] = deployment_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDeployment

    return await _call('post', _path, _headers, _params, model_script)


## Create a deployment based on a template.[br]
##[br]
##Use this endpoint with combination of [listTemplates](https://appwrite.io/docs/products/sites/templates) to find the template details.[br]
##[br]
## Parameters:[br]
## - [param site_id] [String]: Site ID.[br]
## - [param repository] [String]: Repository name of the template.[br]
## - [param owner] [String]: The name of the owner of the template.[br]
## - [param root_directory] [String]: Path to site code in the template repo.[br]
## - [param xtype] [String]: Type for the reference provided. Can be commit, branch, or tag[br]
## - [param reference] [String]: Reference value, can be a commit hash, branch name, or release tag[br]
## - [param activate] [bool]: Automatically activate the deployment when it is finished building.[br]
##[br]
## Returns:[br]
## - [AppwriteDeployment] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_template_deployment(site_id: String, repository: String, owner: String, root_directory: String, xtype: String, reference: String, activate: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if activate != null and not activate is bool:
        return AppwriteException.new("Invalid type for parameter 'activate'. Expected bool.", 0, "argument_error", "")

    var _path := '/sites/{siteId}/deployments/template'
    _path = _path.replace('{siteId}', str(site_id))

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


## Create a deployment when a site is connected to VCS.[br]
##[br]
##This endpoint lets you create deployment from a branch, commit, or a tag.[br]
##[br]
## Parameters:[br]
## - [param site_id] [String]: Site ID.[br]
## - [param xtype] [String]: Type of reference passed. Allowed values are: branch, commit[br]
## - [param reference] [String]: VCS reference to create deployment from. Depending on type this can be: branch name, commit hash[br]
## - [param activate] [bool]: Automatically activate the deployment when it is finished building.[br]
##[br]
## Returns:[br]
## - [AppwriteDeployment] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_vcs_deployment(site_id: String, xtype: String, reference: String, activate: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if activate != null and not activate is bool:
        return AppwriteException.new("Invalid type for parameter 'activate'. Expected bool.", 0, "argument_error", "")

    var _path := '/sites/{siteId}/deployments/vcs'
    _path = _path.replace('{siteId}', str(site_id))

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


## Get a site deployment by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param site_id] [String]: Site ID.[br]
## - [param deployment_id] [String]: Deployment ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDeployment] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_deployment(site_id: String, deployment_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/sites/{siteId}/deployments/{deploymentId}'
    _path = _path.replace('{siteId}', str(site_id))
    _path = _path.replace('{deploymentId}', str(deployment_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteDeployment

    return await _call('get', _path, _headers, _params, model_script)


## Delete a site deployment by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param site_id] [String]: Site ID.[br]
## - [param deployment_id] [String]: Deployment ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_deployment(site_id: String, deployment_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/sites/{siteId}/deployments/{deploymentId}'
    _path = _path.replace('{siteId}', str(site_id))
    _path = _path.replace('{deploymentId}', str(deployment_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Get a site deployment content by its unique ID. The endpoint response return with a &#039;Content-Disposition: attachment&#039; header that tells the browser to start downloading the file to user downloads directory.[br]
##[br]
## Parameters:[br]
## - [param site_id] [String]: Site ID.[br]
## - [param deployment_id] [String]: Deployment ID.[br]
## - [param xtype] [String]: Deployment file to download. Can be: &quot;source&quot;, &quot;output&quot;.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_deployment_download(site_id: String, deployment_id: String, xtype: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xtype != null and not xtype is String:
        return AppwriteException.new("Invalid type for parameter 'xtype'. Expected String.", 0, "argument_error", "")

    var _path := '/sites/{siteId}/deployments/{deploymentId}/download'
    _path = _path.replace('{siteId}', str(site_id))
    _path = _path.replace('{deploymentId}', str(deployment_id))

    var _params := {}
    if xtype != null:
        _params['type'] = xtype

    var _headers := {
    }

    var model_script = null

    return await _call('get', _path, _headers, _params, model_script)


## Cancel an ongoing site deployment build. If the build is already in progress, it will be stopped and marked as canceled. If the build hasn&#039;t started yet, it will be marked as canceled without executing. You cannot cancel builds that have already completed (status &#039;ready&#039;) or failed. The response includes the final build status and details.[br]
##[br]
## Parameters:[br]
## - [param site_id] [String]: Site ID.[br]
## - [param deployment_id] [String]: Deployment ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDeployment] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_deployment_status(site_id: String, deployment_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/sites/{siteId}/deployments/{deploymentId}/status'
    _path = _path.replace('{siteId}', str(site_id))
    _path = _path.replace('{deploymentId}', str(deployment_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDeployment

    return await _call('patch', _path, _headers, _params, model_script)


## Get a list of all site logs. You can use the query params to filter your results.[br]
##[br]
## Parameters:[br]
## - [param site_id] [String]: Site ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: trigger, status, responseStatusCode, duration, requestMethod, requestPath, deploymentId[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteExecutionList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_logs(site_id: String, queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/sites/{siteId}/logs'
    _path = _path.replace('{siteId}', str(site_id))

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteExecutionList

    return await _call('get', _path, _headers, _params, model_script)


## Get a site request log by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param site_id] [String]: Site ID.[br]
## - [param log_id] [String]: Log ID.[br]
##[br]
## Returns:[br]
## - [AppwriteExecution] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_log(site_id: String, log_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/sites/{siteId}/logs/{logId}'
    _path = _path.replace('{siteId}', str(site_id))
    _path = _path.replace('{logId}', str(log_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteExecution

    return await _call('get', _path, _headers, _params, model_script)


## Delete a site log by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param site_id] [String]: Site ID.[br]
## - [param log_id] [String]: Log ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_log(site_id: String, log_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/sites/{siteId}/logs/{logId}'
    _path = _path.replace('{siteId}', str(site_id))
    _path = _path.replace('{logId}', str(log_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Get usage metrics and statistics for a for a specific site. View statistics including total deployments, builds, executions, storage usage, and compute time. The response includes both current totals and historical data for each metric. Use the optional range parameter to specify the time window for historical data: 24h (last 24 hours), 30d (last 30 days), or 90d (last 90 days). If not specified, defaults to 30 days.[br]
##[br]
## Parameters:[br]
## - [param site_id] [String]: Site ID.[br]
## - [param xrange] [String]: Date range.[br]
##[br]
## Returns:[br]
## - [AppwriteUsageSite] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_usage(site_id: String, xrange: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xrange != null and not xrange is String:
        return AppwriteException.new("Invalid type for parameter 'xrange'. Expected String.", 0, "argument_error", "")

    var _path := '/sites/{siteId}/usage'
    _path = _path.replace('{siteId}', str(site_id))

    var _params := {}
    if xrange != null:
        _params['range'] = xrange

    var _headers := {
    }

    var model_script = AppwriteUsageSite

    return await _call('get', _path, _headers, _params, model_script)


## Get a list of all variables of a specific site.[br]
##[br]
## Parameters:[br]
## - [param site_id] [String]: Site unique ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: key, resourceType, resourceId, secret[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteVariableList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_variables(site_id: String, queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/sites/{siteId}/variables'
    _path = _path.replace('{siteId}', str(site_id))

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteVariableList

    return await _call('get', _path, _headers, _params, model_script)


## Create a new site variable. These variables can be accessed during build and runtime (server-side rendering) as environment variables.[br]
##[br]
## Parameters:[br]
## - [param site_id] [String]: Site unique ID.[br]
## - [param variable_id] [String]: Variable ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param key] [String]: Variable key. Max length: 255 chars.[br]
## - [param value] [String]: Variable value. Max length: 8192 chars.[br]
## - [param secret] [bool]: Secret variables can be updated or deleted, but only sites can read them during build and runtime.[br]
##[br]
## Returns:[br]
## - [AppwriteVariable] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_variable(site_id: String, variable_id: String, key: String, value: String, secret: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if secret != null and not secret is bool:
        return AppwriteException.new("Invalid type for parameter 'secret'. Expected bool.", 0, "argument_error", "")

    var _path := '/sites/{siteId}/variables'
    _path = _path.replace('{siteId}', str(site_id))

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
## - [param site_id] [String]: Site unique ID.[br]
## - [param variable_id] [String]: Variable unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteVariable] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_variable(site_id: String, variable_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/sites/{siteId}/variables/{variableId}'
    _path = _path.replace('{siteId}', str(site_id))
    _path = _path.replace('{variableId}', str(variable_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteVariable

    return await _call('get', _path, _headers, _params, model_script)


## Update variable by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param site_id] [String]: Site unique ID.[br]
## - [param variable_id] [String]: Variable unique ID.[br]
## - [param key] [String]: Variable key. Max length: 255 chars.[br]
## - [param value] [String]: Variable value. Max length: 8192 chars.[br]
## - [param secret] [bool]: Secret variables can be updated or deleted, but only sites can read them during build and runtime.[br]
##[br]
## Returns:[br]
## - [AppwriteVariable] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_variable(site_id: String, variable_id: String, key: Variant = null, value: Variant = null, secret: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if key != null and not key is String:
        return AppwriteException.new("Invalid type for parameter 'key'. Expected String.", 0, "argument_error", "")
    if value != null and not value is String:
        return AppwriteException.new("Invalid type for parameter 'value'. Expected String.", 0, "argument_error", "")
    if secret != null and not secret is bool:
        return AppwriteException.new("Invalid type for parameter 'secret'. Expected bool.", 0, "argument_error", "")

    var _path := '/sites/{siteId}/variables/{variableId}'
    _path = _path.replace('{siteId}', str(site_id))
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
## - [param site_id] [String]: Site unique ID.[br]
## - [param variable_id] [String]: Variable unique ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_variable(site_id: String, variable_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/sites/{siteId}/variables/{variableId}'
    _path = _path.replace('{siteId}', str(site_id))
    _path = _path.replace('{variableId}', str(variable_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)

