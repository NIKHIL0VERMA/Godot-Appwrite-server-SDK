extends "../utils/service.gd"
## Service class.


## Creates a new resource block.[br]
##[br]
## Parameters:[br]
## - [param project_id] [String]: Project ID[br]
## - [param resource_type] [String]: Resource type to block (e.g., projects, functions, databases, storage, etc.)[br]
## - [param resource_id] [String]: Optional resource ID (if omitted, all resources of this type will be blocked)[br]
## - [param reason] [String]: Optional reason why the resource is blocked[br]
## - [param expired_at] [String]: Optional expiration date for the block[br]
##[br]
## Returns:[br]
## - [AppwriteBlock] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_block(project_id: String, resource_type: String, resource_id: Variant = null, reason: Variant = null, expired_at: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if resource_id != null and not resource_id is String:
        return AppwriteException.new("Invalid type for parameter 'resource_id'. Expected String.", 0, "argument_error", "")
    if reason != null and not reason is String:
        return AppwriteException.new("Invalid type for parameter 'reason'. Expected String.", 0, "argument_error", "")
    if expired_at != null and not expired_at is String:
        return AppwriteException.new("Invalid type for parameter 'expired_at'. Expected String.", 0, "argument_error", "")

    var _path := '/manager/blocks'

    var _params := {}
    _params['projectId'] = project_id
    _params['resourceType'] = resource_type
    if resource_id != null:
        _params['resourceId'] = resource_id
    if reason != null:
        _params['reason'] = reason
    if expired_at != null:
        _params['expiredAt'] = expired_at

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteBlock

    return await _call('post', _path, _headers, _params, model_script)


## Deletes resource blocks for a project.[br]
##[br]
## Parameters:[br]
## - [param project_id] [String]: Project ID[br]
## - [param resource_type] [String]: Resource type to unblock[br]
## - [param resource_id] [String]: Optional resource ID (if omitted, all blocks of this type will be removed)[br]
##[br]
## Returns:[br]
## - [AppwriteBlockDelete] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_block(project_id: String, resource_type: String, resource_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if resource_id != null and not resource_id is String:
        return AppwriteException.new("Invalid type for parameter 'resource_id'. Expected String.", 0, "argument_error", "")

    var _path := '/manager/blocks'

    var _params := {}
    _params['projectId'] = project_id
    _params['resourceType'] = resource_type
    if resource_id != null:
        _params['resourceId'] = resource_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteBlockDelete

    return await _call('delete', _path, _headers, _params, model_script)


## Lists all resource blocks for a project.[br]
##[br]
## Parameters:[br]
## - [param project_id] [String]: Project ID[br]
##[br]
## Returns:[br]
## - [AppwriteBlockList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_blocks(project_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/manager/blocks/{projectId}'
    _path = _path.replace('{projectId}', str(project_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteBlockList

    return await _call('get', _path, _headers, _params, model_script)


## Updates a console user status using a user ID or email address.[br]
##[br]
## Parameters:[br]
## - [param status] [bool]: User status. Set to `false` to block and `true` to unblock.[br]
## - [param user_id] [String]: User ID.[br]
## - [param email] [String]: User email address.[br]
## - [param reason] [String]: Optional reason when blocking a user. Accepted for parity with the CLI task but not persisted.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_user_status(status: bool, user_id: Variant = null, email: Variant = null, reason: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if user_id != null and not user_id is String:
        return AppwriteException.new("Invalid type for parameter 'user_id'. Expected String.", 0, "argument_error", "")
    if email != null and not email is String:
        return AppwriteException.new("Invalid type for parameter 'email'. Expected String.", 0, "argument_error", "")
    if reason != null and not reason is String:
        return AppwriteException.new("Invalid type for parameter 'reason'. Expected String.", 0, "argument_error", "")

    var _path := '/manager/users/status'

    var _params := {}
    if user_id != null:
        _params['userId'] = user_id
    if email != null:
        _params['email'] = email
    _params['status'] = status
    if reason != null:
        _params['reason'] = reason

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteUser

    return await _call('patch', _path, _headers, _params, model_script)

