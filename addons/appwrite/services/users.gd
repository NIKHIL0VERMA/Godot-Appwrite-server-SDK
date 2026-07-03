extends "../utils/service.gd"
## The Users service allows you to manage your project users.


## Get a list of all the project&#039;s users. You can use the query params to filter your results.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, email, phone, status, passwordUpdate, registration, emailVerification, phoneVerification, labels, impersonator[br]
## - [param search] [String]: Search term to filter your list results. Max length: 256 chars.[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteUserList] on success.[br]
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

    var _path := '/users'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if search != null:
        _params['search'] = search
    if total != null:
        _params['total'] = total

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteUserList


    return await _call('get', _path, _headers, _params, model_script)


## Create a new user.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param email] [String]: User email.[br]
## - [param phone] [String]: Phone number. Format this number with a leading &#039;+&#039; and a country code, e.g., +16175551212.[br]
## - [param password] [String]: Plain text user password. Must be at least 8 chars.[br]
## - [param xname] [String]: User name. Max length: 128 chars.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create(user_id: String, email: Variant = null, phone: Variant = null, password: Variant = null, xname: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if email != null and not email is String:
        return AppwriteException.new("Invalid type for parameter 'email'. Expected String.", 0, "argument_error", "")
    if phone != null and not phone is String:
        return AppwriteException.new("Invalid type for parameter 'phone'. Expected String.", 0, "argument_error", "")
    if password != null and not password is String:
        return AppwriteException.new("Invalid type for parameter 'password'. Expected String.", 0, "argument_error", "")
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")

    var _path := '/users'

    var _params := {}
    _params['userId'] = user_id
    if email != null:
        _params['email'] = email
    if phone != null:
        _params['phone'] = phone
    if password != null:
        _params['password'] = password
    if xname != null:
        _params['name'] = xname

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteUser


    return await _call('post', _path, _headers, _params, model_script)


## Create a new user. Password provided must be hashed with the [Argon2](https://en.wikipedia.org/wiki/Argon2) algorithm. Use the [POST /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to create users with a plain text password.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param email] [String]: User email.[br]
## - [param password] [String]: User password hashed using Argon2.[br]
## - [param xname] [String]: User name. Max length: 128 chars.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_argon2_user(user_id: String, email: String, password: String, xname: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")

    var _path := '/users/argon2'

    var _params := {}
    _params['userId'] = user_id
    _params['email'] = email
    _params['password'] = password
    if xname != null:
        _params['name'] = xname

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteUser


    return await _call('post', _path, _headers, _params, model_script)


## Create a new user. Password provided must be hashed with the [Bcrypt](https://en.wikipedia.org/wiki/Bcrypt) algorithm. Use the [POST /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to create users with a plain text password.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param email] [String]: User email.[br]
## - [param password] [String]: User password hashed using Bcrypt.[br]
## - [param xname] [String]: User name. Max length: 128 chars.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_bcrypt_user(user_id: String, email: String, password: String, xname: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")

    var _path := '/users/bcrypt'

    var _params := {}
    _params['userId'] = user_id
    _params['email'] = email
    _params['password'] = password
    if xname != null:
        _params['name'] = xname

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteUser


    return await _call('post', _path, _headers, _params, model_script)


## Get identities for all users.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: userId, provider, providerUid, providerEmail, providerAccessTokenExpiry[br]
## - [param search] [String]: Search term to filter your list results. Max length: 256 chars.[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteIdentityList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_identities(queries: Variant = null, search: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if search != null and not search is String:
        return AppwriteException.new("Invalid type for parameter 'search'. Expected String.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/users/identities'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if search != null:
        _params['search'] = search
    if total != null:
        _params['total'] = total

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteIdentityList


    return await _call('get', _path, _headers, _params, model_script)


## Delete an identity by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param identity_id] [String]: Identity ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_identity(identity_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/users/identities/{identityId}'
    _path = _path.replace('{identityId}', identity_id.uri_encode())

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null


    return await _call('delete', _path, _headers, _params, model_script)


## Create a new user. Password provided must be hashed with the [MD5](https://en.wikipedia.org/wiki/MD5) algorithm. Use the [POST /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to create users with a plain text password.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param email] [String]: User email.[br]
## - [param password] [String]: User password hashed using MD5.[br]
## - [param xname] [String]: User name. Max length: 128 chars.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_md5_user(user_id: String, email: String, password: String, xname: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")

    var _path := '/users/md5'

    var _params := {}
    _params['userId'] = user_id
    _params['email'] = email
    _params['password'] = password
    if xname != null:
        _params['name'] = xname

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteUser


    return await _call('post', _path, _headers, _params, model_script)


## Create a new user. Password provided must be hashed with the [PHPass](https://www.openwall.com/phpass/) algorithm. Use the [POST /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to create users with a plain text password.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID. Choose a custom ID or pass the string `ID.unique()`to auto generate it. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param email] [String]: User email.[br]
## - [param password] [String]: User password hashed using PHPass.[br]
## - [param xname] [String]: User name. Max length: 128 chars.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_ph_pass_user(user_id: String, email: String, password: String, xname: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")

    var _path := '/users/phpass'

    var _params := {}
    _params['userId'] = user_id
    _params['email'] = email
    _params['password'] = password
    if xname != null:
        _params['name'] = xname

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteUser


    return await _call('post', _path, _headers, _params, model_script)


## Create a new user. Password provided must be hashed with the [Scrypt](https://github.com/Tarsnap/scrypt) algorithm. Use the [POST /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to create users with a plain text password.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param email] [String]: User email.[br]
## - [param password] [String]: User password hashed using Scrypt.[br]
## - [param password_salt] [String]: Optional salt used to hash password.[br]
## - [param password_cpu] [int]: Optional CPU cost used to hash password.[br]
## - [param password_memory] [int]: Optional memory cost used to hash password.[br]
## - [param password_parallel] [int]: Optional parallelization cost used to hash password.[br]
## - [param password_length] [int]: Optional hash length used to hash password.[br]
## - [param xname] [String]: User name. Max length: 128 chars.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_scrypt_user(user_id: String, email: String, password: String, password_salt: String, password_cpu: int, password_memory: int, password_parallel: int, password_length: int, xname: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")

    var _path := '/users/scrypt'

    var _params := {}
    _params['userId'] = user_id
    _params['email'] = email
    _params['password'] = password
    _params['passwordSalt'] = password_salt
    _params['passwordCpu'] = password_cpu
    _params['passwordMemory'] = password_memory
    _params['passwordParallel'] = password_parallel
    _params['passwordLength'] = password_length
    if xname != null:
        _params['name'] = xname

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteUser


    return await _call('post', _path, _headers, _params, model_script)


## Create a new user. Password provided must be hashed with the [Scrypt Modified](https://gist.github.com/Meldiron/eecf84a0225eccb5a378d45bb27462cc) algorithm. Use the [POST /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to create users with a plain text password.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param email] [String]: User email.[br]
## - [param password] [String]: User password hashed using Scrypt Modified.[br]
## - [param password_salt] [String]: Salt used to hash password.[br]
## - [param password_salt_separator] [String]: Salt separator used to hash password.[br]
## - [param password_signer_key] [String]: Signer key used to hash password.[br]
## - [param xname] [String]: User name. Max length: 128 chars.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_scrypt_modified_user(user_id: String, email: String, password: String, password_salt: String, password_salt_separator: String, password_signer_key: String, xname: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")

    var _path := '/users/scrypt-modified'

    var _params := {}
    _params['userId'] = user_id
    _params['email'] = email
    _params['password'] = password
    _params['passwordSalt'] = password_salt
    _params['passwordSaltSeparator'] = password_salt_separator
    _params['passwordSignerKey'] = password_signer_key
    if xname != null:
        _params['name'] = xname

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteUser


    return await _call('post', _path, _headers, _params, model_script)


## Create a new user. Password provided must be hashed with the [SHA](https://en.wikipedia.org/wiki/Secure_Hash_Algorithm) algorithm. Use the [POST /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to create users with a plain text password.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param email] [String]: User email.[br]
## - [param password] [String]: User password hashed using SHA.[br]
## - [param password_version] [String]: Optional SHA version used to hash password. Allowed values are: &#039;sha1&#039;, &#039;sha224&#039;, &#039;sha256&#039;, &#039;sha384&#039;, &#039;sha512/224&#039;, &#039;sha512/256&#039;, &#039;sha512&#039;, &#039;sha3-224&#039;, &#039;sha3-256&#039;, &#039;sha3-384&#039;, &#039;sha3-512&#039;[br]
## - [param xname] [String]: User name. Max length: 128 chars.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_sha_user(user_id: String, email: String, password: String, password_version: Variant = null, xname: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if password_version != null and not password_version is String:
        return AppwriteException.new("Invalid type for parameter 'password_version'. Expected String.", 0, "argument_error", "")
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")

    var _path := '/users/sha'

    var _params := {}
    _params['userId'] = user_id
    _params['email'] = email
    _params['password'] = password
    if password_version != null:
        _params['passwordVersion'] = password_version
    if xname != null:
        _params['name'] = xname

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteUser


    return await _call('post', _path, _headers, _params, model_script)


## Get a user by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func xget(user_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/users/{userId}'
    _path = _path.replace('{userId}', user_id.uri_encode())

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteUser


    return await _call('get', _path, _headers, _params, model_script)


## Delete a user by its unique ID, thereby releasing it&#039;s ID. Since ID is released and can be reused, all user-related resources like documents or storage files should be deleted before user deletion. If you want to keep ID reserved, use the [updateStatus](https://appwrite.io/docs/server/users#usersUpdateStatus) endpoint instead.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete(user_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/users/{userId}'
    _path = _path.replace('{userId}', user_id.uri_encode())

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null


    return await _call('delete', _path, _headers, _params, model_script)


## Update the user email by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
## - [param email] [String]: User email.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_email(user_id: String, email: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/users/{userId}/email'
    _path = _path.replace('{userId}', user_id.uri_encode())

    var _params := {}
    _params['email'] = email

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteUser


    return await _call('patch', _path, _headers, _params, model_script)


## Enable or disable whether a user can impersonate other users. When impersonation headers are used, the request runs as the target user for API behavior, while internal audit logs still attribute the action to the original impersonator and store the impersonated target details only in internal audit payload data.[br]
##[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
## - [param impersonator] [bool]: Whether the user can impersonate other users. When true, the user can browse project users to choose a target and can pass impersonation headers to act as that user. Internal audit logs still attribute impersonated actions to the original impersonator and store the target user details only in internal audit payload data.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_impersonator(user_id: String, impersonator: bool) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/users/{userId}/impersonator'
    _path = _path.replace('{userId}', user_id.uri_encode())

    var _params := {}
    _params['impersonator'] = impersonator

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteUser


    return await _call('patch', _path, _headers, _params, model_script)


## Use this endpoint to create a JSON Web Token for user by its unique ID. You can use the resulting JWT to authenticate on behalf of the user. The JWT secret will become invalid if the session it uses gets deleted.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
## - [param session_id] [String]: Session ID. Use the string &#039;recent&#039; to use the most recent session. Defaults to the most recent session.[br]
## - [param duration] [int]: Time in seconds before JWT expires. Default duration is 900 seconds, and maximum is 3600 seconds.[br]
##[br]
## Returns:[br]
## - [AppwriteJwt] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_jwt(user_id: String, session_id: Variant = null, duration: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if session_id != null and not session_id is String:
        return AppwriteException.new("Invalid type for parameter 'session_id'. Expected String.", 0, "argument_error", "")
    if duration != null and not duration is int:
        return AppwriteException.new("Invalid type for parameter 'duration'. Expected int.", 0, "argument_error", "")

    var _path := '/users/{userId}/jwts'
    _path = _path.replace('{userId}', user_id.uri_encode())

    var _params := {}
    if session_id != null:
        _params['sessionId'] = session_id
    if duration != null:
        _params['duration'] = duration

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteJwt


    return await _call('post', _path, _headers, _params, model_script)


## Update the user labels by its unique ID. [br]
##[br]
##Labels can be used to grant access to resources. While teams are a way for user&#039;s to share access to a resource, labels can be defined by the developer to grant access without an invitation. See the [Permissions docs](https://appwrite.io/docs/permissions) for more info.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
## - [param labels] [Array]: Array of user labels. Replaces the previous labels. Maximum of 1000 labels are allowed, each up to 36 alphanumeric characters long.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_labels(user_id: String, labels: Array) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/users/{userId}/labels'
    _path = _path.replace('{userId}', user_id.uri_encode())

    var _params := {}
    _params['labels'] = labels

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteUser


    return await _call('put', _path, _headers, _params, model_script)


## Get the user activity logs list by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Only supported methods are limit and offset[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteLogList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_logs(user_id: String, queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/users/{userId}/logs'
    _path = _path.replace('{userId}', user_id.uri_encode())

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteLogList


    return await _call('get', _path, _headers, _params, model_script)


## Get the user membership list by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: userId, teamId, invited, joined, confirm, roles[br]
## - [param search] [String]: Search term to filter your list results. Max length: 256 chars.[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteMembershipList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_memberships(user_id: String, queries: Variant = null, search: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if search != null and not search is String:
        return AppwriteException.new("Invalid type for parameter 'search'. Expected String.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/users/{userId}/memberships'
    _path = _path.replace('{userId}', user_id.uri_encode())

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if search != null:
        _params['search'] = search
    if total != null:
        _params['total'] = total

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteMembershipList


    return await _call('get', _path, _headers, _params, model_script)


## Enable or disable MFA on a user account.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
## - [param mfa] [bool]: Enable or disable MFA.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_mfa(user_id: String, mfa: bool) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/users/{userId}/mfa'
    _path = _path.replace('{userId}', user_id.uri_encode())

    var _params := {}
    _params['mfa'] = mfa

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteUser


    return await _call('patch', _path, _headers, _params, model_script)


## Delete an authenticator app.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
## - [param xtype] [String]: Type of authenticator.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_mfa_authenticator(user_id: String, xtype: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/users/{userId}/mfa/authenticators/{type}'
    _path = _path.replace('{userId}', user_id.uri_encode())
    _path = _path.replace('{type}', xtype.uri_encode())

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null


    return await _call('delete', _path, _headers, _params, model_script)


## List the factors available on the account to be used as a MFA challange.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
##[br]
## Returns:[br]
## - [AppwriteMfaFactors] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_mfa_factors(user_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/users/{userId}/mfa/factors'
    _path = _path.replace('{userId}', user_id.uri_encode())

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteMfaFactors


    return await _call('get', _path, _headers, _params, model_script)


## Get recovery codes that can be used as backup for MFA flow by User ID. Before getting codes, they must be generated using [createMfaRecoveryCodes](/docs/references/cloud/client-web/account#createMfaRecoveryCodes) method.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
##[br]
## Returns:[br]
## - [AppwriteMfaRecoveryCodes] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_mfa_recovery_codes(user_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/users/{userId}/mfa/recovery-codes'
    _path = _path.replace('{userId}', user_id.uri_encode())

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteMfaRecoveryCodes


    return await _call('get', _path, _headers, _params, model_script)


## Regenerate recovery codes that can be used as backup for MFA flow by User ID. Before regenerating codes, they must be first generated using [createMfaRecoveryCodes](/docs/references/cloud/client-web/account#createMfaRecoveryCodes) method.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
##[br]
## Returns:[br]
## - [AppwriteMfaRecoveryCodes] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_mfa_recovery_codes(user_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/users/{userId}/mfa/recovery-codes'
    _path = _path.replace('{userId}', user_id.uri_encode())

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteMfaRecoveryCodes


    return await _call('put', _path, _headers, _params, model_script)


## Generate recovery codes used as backup for MFA flow for User ID. Recovery codes can be used as a MFA verification type in [createMfaChallenge](/docs/references/cloud/client-web/account#createMfaChallenge) method by client SDK.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
##[br]
## Returns:[br]
## - [AppwriteMfaRecoveryCodes] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_mfa_recovery_codes(user_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/users/{userId}/mfa/recovery-codes'
    _path = _path.replace('{userId}', user_id.uri_encode())

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteMfaRecoveryCodes


    return await _call('patch', _path, _headers, _params, model_script)


## Update the user name by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
## - [param xname] [String]: User name. Max length: 128 chars.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_name(user_id: String, xname: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/users/{userId}/name'
    _path = _path.replace('{userId}', user_id.uri_encode())

    var _params := {}
    _params['name'] = xname

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteUser


    return await _call('patch', _path, _headers, _params, model_script)


## Update the user password by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
## - [param password] [String]: New user password. Must be at least 8 chars.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_password(user_id: String, password: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/users/{userId}/password'
    _path = _path.replace('{userId}', user_id.uri_encode())

    var _params := {}
    _params['password'] = password

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteUser


    return await _call('patch', _path, _headers, _params, model_script)


## Update the user phone by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
## - [param number] [String]: User phone number.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_phone(user_id: String, number: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/users/{userId}/phone'
    _path = _path.replace('{userId}', user_id.uri_encode())

    var _params := {}
    _params['number'] = number

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteUser


    return await _call('patch', _path, _headers, _params, model_script)


## Get the user preferences by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
##[br]
## Returns:[br]
## - [AppwritePreferences] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_prefs(user_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/users/{userId}/prefs'
    _path = _path.replace('{userId}', user_id.uri_encode())

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwritePreferences


    return await _call('get', _path, _headers, _params, model_script)


## Update the user preferences by its unique ID. The object you pass is stored as is, and replaces any previous value. The maximum allowed prefs size is 64kB and throws error if exceeded.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
## - [param prefs] [Dictionary]: Prefs key-value JSON object.[br]
##[br]
## Returns:[br]
## - [AppwritePreferences] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_prefs(user_id: String, prefs: Dictionary) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/users/{userId}/prefs'
    _path = _path.replace('{userId}', user_id.uri_encode())

    var _params := {}
    _params['prefs'] = prefs

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwritePreferences


    return await _call('patch', _path, _headers, _params, model_script)


## Get the user sessions list by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteSessionList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_sessions(user_id: String, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/users/{userId}/sessions'
    _path = _path.replace('{userId}', user_id.uri_encode())

    var _params := {}
    if total != null:
        _params['total'] = total

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteSessionList


    return await _call('get', _path, _headers, _params, model_script)


## Creates a session for a user. Returns an immediately usable session object.[br]
##[br]
##If you want to generate a token for a custom authentication flow, use the [POST /users/{userId}/tokens](https://appwrite.io/docs/server/users#createToken) endpoint.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
##[br]
## Returns:[br]
## - [AppwriteSession] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_session(user_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/users/{userId}/sessions'
    _path = _path.replace('{userId}', user_id.uri_encode())

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteSession


    return await _call('post', _path, _headers, _params, model_script)


## Delete all user&#039;s sessions by using the user&#039;s unique ID.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_sessions(user_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/users/{userId}/sessions'
    _path = _path.replace('{userId}', user_id.uri_encode())

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null


    return await _call('delete', _path, _headers, _params, model_script)


## Delete a user sessions by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
## - [param session_id] [String]: Session ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_session(user_id: String, session_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/users/{userId}/sessions/{sessionId}'
    _path = _path.replace('{userId}', user_id.uri_encode())
    _path = _path.replace('{sessionId}', session_id.uri_encode())

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null


    return await _call('delete', _path, _headers, _params, model_script)


## Update the user status by its unique ID. Use this endpoint as an alternative to deleting a user if you want to keep user&#039;s ID reserved.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
## - [param status] [bool]: User Status. To activate the user pass `true` and to block the user pass `false`.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_status(user_id: String, status: bool) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/users/{userId}/status'
    _path = _path.replace('{userId}', user_id.uri_encode())

    var _params := {}
    _params['status'] = status

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteUser


    return await _call('patch', _path, _headers, _params, model_script)


## List the messaging targets that are associated with a user.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: userId, providerId, identifier, providerType[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteTargetList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_targets(user_id: String, queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/users/{userId}/targets'
    _path = _path.replace('{userId}', user_id.uri_encode())

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteTargetList


    return await _call('get', _path, _headers, _params, model_script)


## Create a messaging target.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
## - [param target_id] [String]: Target ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param provider_type] [String]: The target provider type. Can be one of the following: `email`, `sms` or `push`.[br]
## - [param identifier] [String]: The target identifier (token, email, phone etc.)[br]
## - [param provider_id] [String]: Provider ID. Message will be sent to this target from the specified provider ID. If no provider ID is set the first setup provider will be used.[br]
## - [param xname] [String]: Target name. Max length: 128 chars. For example: My Awesome App Galaxy S23.[br]
##[br]
## Returns:[br]
## - [AppwriteTarget] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_target(user_id: String, target_id: String, provider_type: String, identifier: String, provider_id: Variant = null, xname: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if provider_id != null and not provider_id is String:
        return AppwriteException.new("Invalid type for parameter 'provider_id'. Expected String.", 0, "argument_error", "")
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")

    var _path := '/users/{userId}/targets'
    _path = _path.replace('{userId}', user_id.uri_encode())

    var _params := {}
    _params['targetId'] = target_id
    _params['providerType'] = provider_type
    _params['identifier'] = identifier
    if provider_id != null:
        _params['providerId'] = provider_id
    if xname != null:
        _params['name'] = xname

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteTarget


    return await _call('post', _path, _headers, _params, model_script)


## Get a user&#039;s push notification target by ID.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
## - [param target_id] [String]: Target ID.[br]
##[br]
## Returns:[br]
## - [AppwriteTarget] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_target(user_id: String, target_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/users/{userId}/targets/{targetId}'
    _path = _path.replace('{userId}', user_id.uri_encode())
    _path = _path.replace('{targetId}', target_id.uri_encode())

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteTarget


    return await _call('get', _path, _headers, _params, model_script)


## Update a messaging target.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
## - [param target_id] [String]: Target ID.[br]
## - [param identifier] [String]: The target identifier (token, email, phone etc.)[br]
## - [param provider_id] [String]: Provider ID. Message will be sent to this target from the specified provider ID. If no provider ID is set the first setup provider will be used.[br]
## - [param xname] [String]: Target name. Max length: 128 chars. For example: My Awesome App Galaxy S23.[br]
##[br]
## Returns:[br]
## - [AppwriteTarget] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_target(user_id: String, target_id: String, identifier: Variant = null, provider_id: Variant = null, xname: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if identifier != null and not identifier is String:
        return AppwriteException.new("Invalid type for parameter 'identifier'. Expected String.", 0, "argument_error", "")
    if provider_id != null and not provider_id is String:
        return AppwriteException.new("Invalid type for parameter 'provider_id'. Expected String.", 0, "argument_error", "")
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")

    var _path := '/users/{userId}/targets/{targetId}'
    _path = _path.replace('{userId}', user_id.uri_encode())
    _path = _path.replace('{targetId}', target_id.uri_encode())

    var _params := {}
    if identifier != null:
        _params['identifier'] = identifier
    if provider_id != null:
        _params['providerId'] = provider_id
    if xname != null:
        _params['name'] = xname

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteTarget


    return await _call('patch', _path, _headers, _params, model_script)


## Delete a messaging target.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
## - [param target_id] [String]: Target ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_target(user_id: String, target_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/users/{userId}/targets/{targetId}'
    _path = _path.replace('{userId}', user_id.uri_encode())
    _path = _path.replace('{targetId}', target_id.uri_encode())

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null


    return await _call('delete', _path, _headers, _params, model_script)


## Returns a token with a secret key for creating a session. Use the user ID and secret and submit a request to the [PUT /account/sessions/token](https://appwrite.io/docs/references/cloud/client-web/account#createSession) endpoint to complete the login process.[br]
##[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
## - [param length] [int]: Token length in characters. The default length is 6 characters[br]
## - [param expire] [int]: Token expiration period in seconds. The default expiration is 15 minutes.[br]
##[br]
## Returns:[br]
## - [AppwriteToken] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_token(user_id: String, length: Variant = null, expire: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if length != null and not length is int:
        return AppwriteException.new("Invalid type for parameter 'length'. Expected int.", 0, "argument_error", "")
    if expire != null and not expire is int:
        return AppwriteException.new("Invalid type for parameter 'expire'. Expected int.", 0, "argument_error", "")

    var _path := '/users/{userId}/tokens'
    _path = _path.replace('{userId}', user_id.uri_encode())

    var _params := {}
    if length != null:
        _params['length'] = length
    if expire != null:
        _params['expire'] = expire

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteToken


    return await _call('post', _path, _headers, _params, model_script)


## Update the user email verification status by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
## - [param email_verification] [bool]: User email verification status.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_email_verification(user_id: String, email_verification: bool) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/users/{userId}/verification'
    _path = _path.replace('{userId}', user_id.uri_encode())

    var _params := {}
    _params['emailVerification'] = email_verification

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteUser


    return await _call('patch', _path, _headers, _params, model_script)


## Update the user phone verification status by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
## - [param phone_verification] [bool]: User phone verification status.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_phone_verification(user_id: String, phone_verification: bool) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/users/{userId}/verification/phone'
    _path = _path.replace('{userId}', user_id.uri_encode())

    var _params := {}
    _params['phoneVerification'] = phone_verification

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteUser


    return await _call('patch', _path, _headers, _params, model_script)

