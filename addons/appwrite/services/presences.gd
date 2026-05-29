extends "../utils/service.gd"
## Service class.


## List presence logs. Expired entries are filtered out automatically.[br]
##[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK.[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
## - [param ttl] [int]: TTL (seconds) for caching list responses. Responses are stored in an in-memory key-value cache, keyed per project, collection, schema version (attributes and indexes), caller authorization roles, and the exact query — so users with different permissions never share cached entries. Schema changes invalidate cached entries automatically; document writes do not, so choose a TTL you are comfortable serving as stale data. Set to 0 to disable caching. Must be between 0 and 86400 (24 hours).[br]
##[br]
## Returns:[br]
## - [AppwritePresenceList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list(queries: Variant = null, total: Variant = null, ttl: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")
    if ttl != null and not ttl is int:
        return AppwriteException.new("Invalid type for parameter 'ttl'. Expected int.", 0, "argument_error", "")

    var _path := '/presences'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total
    if ttl != null:
        _params['ttl'] = ttl

    var _headers := {
    }

    var model_script = AppwritePresenceList

    return await _call('get', _path, _headers, _params, model_script)


## Get presence usage metrics, including the current total of online users and historical online user counts for the selected time range.[br]
##[br]
##[br]
## Parameters:[br]
## - [param xrange] [String]: Date range.[br]
##[br]
## Returns:[br]
## - [AppwriteUsagePresence] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_usage(xrange: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xrange != null and not xrange is String:
        return AppwriteException.new("Invalid type for parameter 'xrange'. Expected String.", 0, "argument_error", "")

    var _path := '/presences/usage'

    var _params := {}
    if xrange != null:
        _params['range'] = xrange

    var _headers := {
    }

    var model_script = AppwriteUsagePresence

    return await _call('get', _path, _headers, _params, model_script)


## Get a presence log by its unique ID. Entries whose `expiresAt` is in the past are treated as not found.[br]
##[br]
##[br]
## Parameters:[br]
## - [param presence_id] [String]: Presence unique ID.[br]
##[br]
## Returns:[br]
## - [AppwritePresence] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func xget(presence_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/presences/{presenceId}'
    _path = _path.replace('{presenceId}', str(presence_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwritePresence

    return await _call('get', _path, _headers, _params, model_script)


## Create or update a presence log by its user ID.[br]
##[br]
##[br]
## Parameters:[br]
## - [param presence_id] [String]: Presence unique ID.[br]
## - [param user_id] [String]: User ID.[br]
## - [param status] [String]: Presence status.[br]
## - [param permissions] [Array]: An array of permissions strings. By default, only the current user is granted all permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).[br]
## - [param expires_at] [String]: Presence expiry datetime.[br]
## - [param metadata] [Dictionary]: Presence metadata object.[br]
##[br]
## Returns:[br]
## - [AppwritePresence] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func upsert(presence_id: String, user_id: String, status: String, permissions: Variant = null, expires_at: Variant = null, metadata: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if permissions != null and not permissions is Array:
        return AppwriteException.new("Invalid type for parameter 'permissions'. Expected Array.", 0, "argument_error", "")
    if expires_at != null and not expires_at is String:
        return AppwriteException.new("Invalid type for parameter 'expires_at'. Expected String.", 0, "argument_error", "")
    if metadata != null and not metadata is Dictionary:
        return AppwriteException.new("Invalid type for parameter 'metadata'. Expected Dictionary.", 0, "argument_error", "")

    var _path := '/presences/{presenceId}'
    _path = _path.replace('{presenceId}', str(presence_id))

    var _params := {}
    _params['userId'] = user_id
    _params['status'] = status
    if permissions != null:
        _params['permissions'] = permissions
    if expires_at != null:
        _params['expiresAt'] = expires_at
    if metadata != null:
        _params['metadata'] = metadata

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwritePresence

    return await _call('put', _path, _headers, _params, model_script)


## Update a presence log by its unique ID. Using the patch method you can pass only specific fields that will get updated.[br]
##[br]
##[br]
## Parameters:[br]
## - [param presence_id] [String]: Presence unique ID.[br]
## - [param user_id] [String]: User ID.[br]
## - [param status] [String]: Presence status.[br]
## - [param expires_at] [String]: Presence expiry datetime.[br]
## - [param metadata] [Dictionary]: Presence metadata object.[br]
## - [param permissions] [Array]: An array of permissions strings. By default, only the current user is granted all permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).[br]
## - [param purge] [bool]: When true, purge cached responses used by list presences endpoint.[br]
##[br]
## Returns:[br]
## - [AppwritePresence] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_presence(presence_id: String, user_id: String, status: Variant = null, expires_at: Variant = null, metadata: Variant = null, permissions: Variant = null, purge: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if status != null and not status is String:
        return AppwriteException.new("Invalid type for parameter 'status'. Expected String.", 0, "argument_error", "")
    if expires_at != null and not expires_at is String:
        return AppwriteException.new("Invalid type for parameter 'expires_at'. Expected String.", 0, "argument_error", "")
    if metadata != null and not metadata is Dictionary:
        return AppwriteException.new("Invalid type for parameter 'metadata'. Expected Dictionary.", 0, "argument_error", "")
    if permissions != null and not permissions is Array:
        return AppwriteException.new("Invalid type for parameter 'permissions'. Expected Array.", 0, "argument_error", "")
    if purge != null and not purge is bool:
        return AppwriteException.new("Invalid type for parameter 'purge'. Expected bool.", 0, "argument_error", "")

    var _path := '/presences/{presenceId}'
    _path = _path.replace('{presenceId}', str(presence_id))

    var _params := {}
    _params['userId'] = user_id
    if status != null:
        _params['status'] = status
    if expires_at != null:
        _params['expiresAt'] = expires_at
    if metadata != null:
        _params['metadata'] = metadata
    if permissions != null:
        _params['permissions'] = permissions
    if purge != null:
        _params['purge'] = purge

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwritePresence

    return await _call('patch', _path, _headers, _params, model_script)


## Delete a presence log by its unique ID.[br]
##[br]
##[br]
## Parameters:[br]
## - [param presence_id] [String]: Presence unique ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete(presence_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/presences/{presenceId}'
    _path = _path.replace('{presenceId}', str(presence_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)

