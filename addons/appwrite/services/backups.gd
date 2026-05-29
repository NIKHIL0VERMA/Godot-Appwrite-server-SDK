extends "../utils/service.gd"
## Service class.


## List all archives for a project.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.[br]
##[br]
## Returns:[br]
## - [AppwriteBackupArchiveList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_archives(queries: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")

    var _path := '/backups/archives'

    var _params := {}
    if queries != null:
        _params['queries'] = queries

    var _headers := {
    }

    var model_script = AppwriteBackupArchiveList

    return await _call('get', _path, _headers, _params, model_script)


## Create a new archive asynchronously for a project.[br]
##[br]
## Parameters:[br]
## - [param services] [Array[String]]: Array of services to backup[br]
## - [param resource_id] [String]: Resource ID. When set, only this single resource will be backed up.[br]
##[br]
## Returns:[br]
## - [AppwriteBackupArchive] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_archive(services: Array[String], resource_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if resource_id != null and not resource_id is String:
        return AppwriteException.new("Invalid type for parameter 'resource_id'. Expected String.", 0, "argument_error", "")

    var _path := '/backups/archives'

    var _params := {}
    _params['services'] = services
    if resource_id != null:
        _params['resourceId'] = resource_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteBackupArchive

    return await _call('post', _path, _headers, _params, model_script)


## Get a backup archive using it&#039;s ID.[br]
##[br]
## Parameters:[br]
## - [param archive_id] [String]: Archive ID. Choose a custom ID`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
##[br]
## Returns:[br]
## - [AppwriteBackupArchive] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_archive(archive_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/backups/archives/{archiveId}'
    _path = _path.replace('{archiveId}', str(archive_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteBackupArchive

    return await _call('get', _path, _headers, _params, model_script)


## Delete an existing archive for a project.[br]
##[br]
## Parameters:[br]
## - [param archive_id] [String]: Policy ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_archive(archive_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/backups/archives/{archiveId}'
    _path = _path.replace('{archiveId}', str(archive_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## List all policies for a project.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.[br]
##[br]
## Returns:[br]
## - [AppwriteBackupPolicyList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_policies(queries: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")

    var _path := '/backups/policies'

    var _params := {}
    if queries != null:
        _params['queries'] = queries

    var _headers := {
    }

    var model_script = AppwriteBackupPolicyList

    return await _call('get', _path, _headers, _params, model_script)


## Create a new backup policy.[br]
##[br]
## Parameters:[br]
## - [param policy_id] [String]: Policy ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param services] [Array[String]]: Array of services to backup[br]
## - [param retention] [int]: Days to keep backups before deletion[br]
## - [param schedule] [String]: Schedule CRON syntax.[br]
## - [param xname] [String]: Policy name. Max length: 128 chars.[br]
## - [param resource_id] [String]: Resource ID. When set, only this single resource will be backed up.[br]
## - [param enabled] [bool]: Is policy enabled? When set to &#039;disabled&#039;, no backups will be taken[br]
##[br]
## Returns:[br]
## - [AppwriteBackupPolicy] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_policy(policy_id: String, services: Array[String], retention: int, schedule: String, xname: Variant = null, resource_id: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")
    if resource_id != null and not resource_id is String:
        return AppwriteException.new("Invalid type for parameter 'resource_id'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/backups/policies'

    var _params := {}
    _params['policyId'] = policy_id
    if xname != null:
        _params['name'] = xname
    _params['services'] = services
    if resource_id != null:
        _params['resourceId'] = resource_id
    if enabled != null:
        _params['enabled'] = enabled
    _params['retention'] = retention
    _params['schedule'] = schedule

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteBackupPolicy

    return await _call('post', _path, _headers, _params, model_script)


## Get a backup policy using it&#039;s ID.[br]
##[br]
## Parameters:[br]
## - [param policy_id] [String]: Policy ID. Choose a custom ID`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
##[br]
## Returns:[br]
## - [AppwriteBackupPolicy] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_policy(policy_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/backups/policies/{policyId}'
    _path = _path.replace('{policyId}', str(policy_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteBackupPolicy

    return await _call('get', _path, _headers, _params, model_script)


## Update an existing policy using it&#039;s ID.[br]
##[br]
## Parameters:[br]
## - [param policy_id] [String]: Policy ID. Choose a custom ID`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Policy name. Max length: 128 chars.[br]
## - [param retention] [int]: Days to keep backups before deletion[br]
## - [param schedule] [String]: Cron expression[br]
## - [param enabled] [bool]: Is Backup enabled? When set to &#039;disabled&#039;, No backup will be taken[br]
##[br]
## Returns:[br]
## - [AppwriteBackupPolicy] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_policy(policy_id: String, xname: Variant = null, retention: Variant = null, schedule: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")
    if retention != null and not retention is int:
        return AppwriteException.new("Invalid type for parameter 'retention'. Expected int.", 0, "argument_error", "")
    if schedule != null and not schedule is String:
        return AppwriteException.new("Invalid type for parameter 'schedule'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/backups/policies/{policyId}'
    _path = _path.replace('{policyId}', str(policy_id))

    var _params := {}
    if xname != null:
        _params['name'] = xname
    if retention != null:
        _params['retention'] = retention
    if schedule != null:
        _params['schedule'] = schedule
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteBackupPolicy

    return await _call('patch', _path, _headers, _params, model_script)


## Delete a policy using it&#039;s ID.[br]
##[br]
## Parameters:[br]
## - [param policy_id] [String]: Policy ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_policy(policy_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/backups/policies/{policyId}'
    _path = _path.replace('{policyId}', str(policy_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Create and trigger a new restoration for a backup on a project.[br]
##[br]
## Parameters:[br]
## - [param archive_id] [String]: Backup archive ID to restore[br]
## - [param services] [Array[String]]: Array of services to restore[br]
## - [param new_resource_id] [String]: Unique Id. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param new_resource_name] [String]: Database name. Max length: 128 chars.[br]
##[br]
## Returns:[br]
## - [AppwriteBackupRestoration] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_restoration(archive_id: String, services: Array[String], new_resource_id: Variant = null, new_resource_name: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if new_resource_id != null and not new_resource_id is String:
        return AppwriteException.new("Invalid type for parameter 'new_resource_id'. Expected String.", 0, "argument_error", "")
    if new_resource_name != null and not new_resource_name is String:
        return AppwriteException.new("Invalid type for parameter 'new_resource_name'. Expected String.", 0, "argument_error", "")

    var _path := '/backups/restoration'

    var _params := {}
    _params['archiveId'] = archive_id
    _params['services'] = services
    if new_resource_id != null:
        _params['newResourceId'] = new_resource_id
    if new_resource_name != null:
        _params['newResourceName'] = new_resource_name

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteBackupRestoration

    return await _call('post', _path, _headers, _params, model_script)


## List all backup restorations for a project.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.[br]
##[br]
## Returns:[br]
## - [AppwriteBackupRestorationList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_restorations(queries: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")

    var _path := '/backups/restorations'

    var _params := {}
    if queries != null:
        _params['queries'] = queries

    var _headers := {
    }

    var model_script = AppwriteBackupRestorationList

    return await _call('get', _path, _headers, _params, model_script)


## Get the current status of a backup restoration.[br]
##[br]
## Parameters:[br]
## - [param restoration_id] [String]: Restoration ID. Choose a custom ID`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
##[br]
## Returns:[br]
## - [AppwriteBackupRestoration] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_restoration(restoration_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/backups/restorations/{restorationId}'
    _path = _path.replace('{restorationId}', str(restoration_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteBackupRestoration

    return await _call('get', _path, _headers, _params, model_script)

