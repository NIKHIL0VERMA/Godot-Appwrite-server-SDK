extends "../utils/service.gd"
## Service class.


## Analyze a GitHub repository to automatically detect the programming language and runtime environment. This endpoint scans the repository&#039;s files and language statistics to determine the appropriate runtime settings for your function. The GitHub installation must be properly configured and the repository must be accessible through your installation for this endpoint to work.[br]
##[br]
## Parameters:[br]
## - [param installation_id] [String]: Installation Id[br]
## - [param provider_repository_id] [String]: Repository Id[br]
## - [param xtype] [String]: Detector type. Must be one of the following: runtime, framework[br]
## - [param provider_root_directory] [String]: Path to Root Directory[br]
##[br]
## Returns:[br]
## - [AppwriteDetectionRuntime] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_repository_detection(installation_id: String, provider_repository_id: String, xtype: String, provider_root_directory: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if provider_root_directory != null and not provider_root_directory is String:
        return AppwriteException.new("Invalid type for parameter 'provider_root_directory'. Expected String.", 0, "argument_error", "")

    var _path := '/vcs/github/installations/{installationId}/detections'
    _path = _path.replace('{installationId}', str(installation_id))

    var _params := {}
    _params['providerRepositoryId'] = provider_repository_id
    _params['type'] = xtype
    if provider_root_directory != null:
        _params['providerRootDirectory'] = provider_root_directory

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDetectionRuntime

    return await _call('post', _path, _headers, _params, model_script)


## Get a list of GitHub repositories available through your installation. This endpoint returns repositories with their basic information, detected runtime environments, and latest push dates. You can optionally filter repositories using a search term. Each repository&#039;s runtime is automatically detected based on its contents and language statistics. The GitHub installation must be properly configured for this endpoint to work.[br]
##[br]
## Parameters:[br]
## - [param installation_id] [String]: Installation Id[br]
## - [param xtype] [String]: Detector type. Must be one of the following: runtime, framework[br]
## - [param search] [String]: Search term to filter your list results. Max length: 256 chars.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Only supported methods are limit and offset[br]
##[br]
## Returns:[br]
## - [AppwriteProviderRepositoryRuntimeList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_repositories(installation_id: String, xtype: String, search: Variant = null, queries: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if search != null and not search is String:
        return AppwriteException.new("Invalid type for parameter 'search'. Expected String.", 0, "argument_error", "")
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")

    var _path := '/vcs/github/installations/{installationId}/providerRepositories'
    _path = _path.replace('{installationId}', str(installation_id))

    var _params := {}
    _params['type'] = xtype
    if search != null:
        _params['search'] = search
    if queries != null:
        _params['queries'] = queries

    var _headers := {
    }

    var model_script = AppwriteProviderRepositoryRuntimeList

    return await _call('get', _path, _headers, _params, model_script)


## Create a new GitHub repository through your installation. This endpoint allows you to create either a public or private repository by specifying a name and visibility setting. The repository will be created under your GitHub user account or organization, depending on your installation type. The GitHub installation must be properly configured and have the necessary permissions for repository creation.[br]
##[br]
## Parameters:[br]
## - [param installation_id] [String]: Installation Id[br]
## - [param xname] [String]: Repository name (slug)[br]
## - [param private] [bool]: Mark repository public or private[br]
##[br]
## Returns:[br]
## - [AppwriteProviderRepository] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_repository(installation_id: String, xname: String, private: bool) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/vcs/github/installations/{installationId}/providerRepositories'
    _path = _path.replace('{installationId}', str(installation_id))

    var _params := {}
    _params['name'] = xname
    _params['private'] = private

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteProviderRepository

    return await _call('post', _path, _headers, _params, model_script)


## Get detailed information about a specific GitHub repository from your installation. This endpoint returns repository details including its ID, name, visibility status, organization, and latest push date. The GitHub installation must be properly configured and have access to the requested repository for this endpoint to work.[br]
##[br]
## Parameters:[br]
## - [param installation_id] [String]: Installation Id[br]
## - [param provider_repository_id] [String]: Repository Id[br]
##[br]
## Returns:[br]
## - [AppwriteProviderRepository] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_repository(installation_id: String, provider_repository_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/vcs/github/installations/{installationId}/providerRepositories/{providerRepositoryId}'
    _path = _path.replace('{installationId}', str(installation_id))
    _path = _path.replace('{providerRepositoryId}', str(provider_repository_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteProviderRepository

    return await _call('get', _path, _headers, _params, model_script)


## Get a list of branches from a GitHub repository in your installation. This endpoint supports filtering by a search term and pagination using query strings such as `Query.limit()`, `Query.offset()`, `Query.cursorAfter()`, and `Query.cursorBefore()`. It returns branch names along with the total number of matches. The GitHub installation must be properly configured and have access to the requested repository for this endpoint to work.[br]
##[br]
##[br]
## Parameters:[br]
## - [param installation_id] [String]: Installation Id[br]
## - [param provider_repository_id] [String]: Repository Id[br]
## - [param search] [String]: Search term to filter your list results. Max length: 256 chars.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Only supported methods are limit, offset, cursorAfter, and cursorBefore[br]
##[br]
## Returns:[br]
## - [AppwriteBranchList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_repository_branches(installation_id: String, provider_repository_id: String, search: Variant = null, queries: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if search != null and not search is String:
        return AppwriteException.new("Invalid type for parameter 'search'. Expected String.", 0, "argument_error", "")
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")

    var _path := '/vcs/github/installations/{installationId}/providerRepositories/{providerRepositoryId}/branches'
    _path = _path.replace('{installationId}', str(installation_id))
    _path = _path.replace('{providerRepositoryId}', str(provider_repository_id))

    var _params := {}
    if search != null:
        _params['search'] = search
    if queries != null:
        _params['queries'] = queries

    var _headers := {
    }

    var model_script = AppwriteBranchList

    return await _call('get', _path, _headers, _params, model_script)


## Get a list of files and directories from a GitHub repository connected to your project. This endpoint returns the contents of a specified repository path, including file names, sizes, and whether each item is a file or directory. The GitHub installation must be properly configured and the repository must be accessible through your installation for this endpoint to work.[br]
##[br]
## Parameters:[br]
## - [param installation_id] [String]: Installation Id[br]
## - [param provider_repository_id] [String]: Repository Id[br]
## - [param provider_root_directory] [String]: Path to get contents of nested directory[br]
## - [param provider_reference] [String]: Git reference (branch, tag, commit) to get contents from[br]
##[br]
## Returns:[br]
## - [AppwriteVcsContentList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_repository_contents(installation_id: String, provider_repository_id: String, provider_root_directory: Variant = null, provider_reference: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if provider_root_directory != null and not provider_root_directory is String:
        return AppwriteException.new("Invalid type for parameter 'provider_root_directory'. Expected String.", 0, "argument_error", "")
    if provider_reference != null and not provider_reference is String:
        return AppwriteException.new("Invalid type for parameter 'provider_reference'. Expected String.", 0, "argument_error", "")

    var _path := '/vcs/github/installations/{installationId}/providerRepositories/{providerRepositoryId}/contents'
    _path = _path.replace('{installationId}', str(installation_id))
    _path = _path.replace('{providerRepositoryId}', str(provider_repository_id))

    var _params := {}
    if provider_root_directory != null:
        _params['providerRootDirectory'] = provider_root_directory
    if provider_reference != null:
        _params['providerReference'] = provider_reference

    var _headers := {
    }

    var model_script = AppwriteVcsContentList

    return await _call('get', _path, _headers, _params, model_script)


## Authorize and create deployments for a GitHub pull request in your project. This endpoint allows external contributions by creating deployments from pull requests, enabling preview environments for code review. The pull request must be open and not previously authorized. The GitHub installation must be properly configured and have access to both the repository and pull request for this endpoint to work.[br]
##[br]
## Parameters:[br]
## - [param installation_id] [String]: Installation Id[br]
## - [param repository_id] [String]: VCS Repository Id[br]
## - [param provider_pull_request_id] [String]: GitHub Pull Request Id[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_external_deployments(installation_id: String, repository_id: String, provider_pull_request_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/vcs/github/installations/{installationId}/repositories/{repositoryId}'
    _path = _path.replace('{installationId}', str(installation_id))
    _path = _path.replace('{repositoryId}', str(repository_id))

    var _params := {}
    _params['providerPullRequestId'] = provider_pull_request_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('patch', _path, _headers, _params, model_script)


## List all VCS installations configured for the current project. This endpoint returns a list of installations including their provider, organization, and other configuration details.[br]
##[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: provider, organization[br]
## - [param search] [String]: Search term to filter your list results. Max length: 256 chars.[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteInstallationList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_installations(queries: Variant = null, search: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if search != null and not search is String:
        return AppwriteException.new("Invalid type for parameter 'search'. Expected String.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/vcs/installations'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if search != null:
        _params['search'] = search
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteInstallationList

    return await _call('get', _path, _headers, _params, model_script)


## Get a VCS installation by its unique ID. This endpoint returns the installation&#039;s details including its provider, organization, and configuration. [br]
##[br]
## Parameters:[br]
## - [param installation_id] [String]: Installation Id[br]
##[br]
## Returns:[br]
## - [AppwriteInstallation] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_installation(installation_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/vcs/installations/{installationId}'
    _path = _path.replace('{installationId}', str(installation_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteInstallation

    return await _call('get', _path, _headers, _params, model_script)


## Delete a VCS installation by its unique ID. This endpoint removes the installation and all its associated repositories from the project.[br]
##[br]
## Parameters:[br]
## - [param installation_id] [String]: Installation Id[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_installation(installation_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/vcs/installations/{installationId}'
    _path = _path.replace('{installationId}', str(installation_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)

