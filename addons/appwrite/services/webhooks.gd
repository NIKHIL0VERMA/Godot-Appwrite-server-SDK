extends "../utils/service.gd"
## Service class.


## Get a list of all webhooks belonging to the project. You can use the query params to filter your results.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, url, authUsername, tls, events, enabled, logs, attempts[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteWebhookList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list(queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/webhooks'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteWebhookList


    return await _call('get', _path, _headers, _params, model_script)


## Create a new webhook. Use this endpoint to configure a URL that will receive events from Appwrite when specific events occur.[br]
##[br]
## Parameters:[br]
## - [param webhook_id] [String]: Webhook ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param url] [String]: Webhook URL.[br]
## - [param xname] [String]: Webhook name. Max length: 128 chars.[br]
## - [param events] [Array]: Events list. Maximum of 100 events are allowed.[br]
## - [param enabled] [bool]: Enable or disable a webhook.[br]
## - [param tls] [bool]: Certificate verification, false for disabled or true for enabled.[br]
## - [param auth_username] [String]: Webhook HTTP user. Max length: 256 chars.[br]
## - [param auth_password] [String]: Webhook HTTP password. Max length: 256 chars.[br]
## - [param secret] [String]: Webhook secret key. If not provided, a new key will be generated automatically. Key must be at least 8 characters long, and at max 256 characters.[br]
##[br]
## Returns:[br]
## - [AppwriteWebhook] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create(webhook_id: String, url: String, xname: String, events: Array, enabled: Variant = null, tls: Variant = null, auth_username: Variant = null, auth_password: Variant = null, secret: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")
    if tls != null and not tls is bool:
        return AppwriteException.new("Invalid type for parameter 'tls'. Expected bool.", 0, "argument_error", "")
    if auth_username != null and not auth_username is String:
        return AppwriteException.new("Invalid type for parameter 'auth_username'. Expected String.", 0, "argument_error", "")
    if auth_password != null and not auth_password is String:
        return AppwriteException.new("Invalid type for parameter 'auth_password'. Expected String.", 0, "argument_error", "")
    if secret != null and not secret is String:
        return AppwriteException.new("Invalid type for parameter 'secret'. Expected String.", 0, "argument_error", "")

    var _path := '/webhooks'

    var _params := {}
    _params['webhookId'] = webhook_id
    _params['url'] = url
    _params['name'] = xname
    _params['events'] = events
    if enabled != null:
        _params['enabled'] = enabled
    if tls != null:
        _params['tls'] = tls
    if auth_username != null:
        _params['authUsername'] = auth_username
    if auth_password != null:
        _params['authPassword'] = auth_password
    if secret != null:
        _params['secret'] = secret

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteWebhook


    return await _call('post', _path, _headers, _params, model_script)


## Get a webhook by its unique ID. This endpoint returns details about a specific webhook configured for a project. [br]
##[br]
## Parameters:[br]
## - [param webhook_id] [String]: Webhook ID.[br]
##[br]
## Returns:[br]
## - [AppwriteWebhook] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func xget(webhook_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/webhooks/{webhookId}'
    _path = _path.replace('{webhookId}', webhook_id.uri_encode())

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteWebhook


    return await _call('get', _path, _headers, _params, model_script)


## Update a webhook by its unique ID. Use this endpoint to update the URL, events, or status of an existing webhook.[br]
##[br]
## Parameters:[br]
## - [param webhook_id] [String]: Webhook ID.[br]
## - [param xname] [String]: Webhook name. Max length: 128 chars.[br]
## - [param url] [String]: Webhook URL.[br]
## - [param events] [Array]: Events list. Maximum of 100 events are allowed.[br]
## - [param enabled] [bool]: Enable or disable a webhook.[br]
## - [param tls] [bool]: Certificate verification, false for disabled or true for enabled.[br]
## - [param auth_username] [String]: Webhook HTTP user. Max length: 256 chars.[br]
## - [param auth_password] [String]: Webhook HTTP password. Max length: 256 chars.[br]
##[br]
## Returns:[br]
## - [AppwriteWebhook] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update(webhook_id: String, xname: String, url: String, events: Array, enabled: Variant = null, tls: Variant = null, auth_username: Variant = null, auth_password: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")
    if tls != null and not tls is bool:
        return AppwriteException.new("Invalid type for parameter 'tls'. Expected bool.", 0, "argument_error", "")
    if auth_username != null and not auth_username is String:
        return AppwriteException.new("Invalid type for parameter 'auth_username'. Expected String.", 0, "argument_error", "")
    if auth_password != null and not auth_password is String:
        return AppwriteException.new("Invalid type for parameter 'auth_password'. Expected String.", 0, "argument_error", "")

    var _path := '/webhooks/{webhookId}'
    _path = _path.replace('{webhookId}', webhook_id.uri_encode())

    var _params := {}
    _params['name'] = xname
    _params['url'] = url
    _params['events'] = events
    if enabled != null:
        _params['enabled'] = enabled
    if tls != null:
        _params['tls'] = tls
    if auth_username != null:
        _params['authUsername'] = auth_username
    if auth_password != null:
        _params['authPassword'] = auth_password

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteWebhook


    return await _call('put', _path, _headers, _params, model_script)


## Delete a webhook by its unique ID. Once deleted, the webhook will no longer receive project events. [br]
##[br]
## Parameters:[br]
## - [param webhook_id] [String]: Webhook ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete(webhook_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/webhooks/{webhookId}'
    _path = _path.replace('{webhookId}', webhook_id.uri_encode())

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null


    return await _call('delete', _path, _headers, _params, model_script)


## Update the webhook signing key. This endpoint can be used to regenerate the signing key used to sign and validate payload deliveries for a specific webhook.[br]
##[br]
## Parameters:[br]
## - [param webhook_id] [String]: Webhook ID.[br]
## - [param secret] [String]: Webhook secret key. If not provided, a new key will be generated automatically. Key must be at least 8 characters long, and at max 256 characters.[br]
##[br]
## Returns:[br]
## - [AppwriteWebhook] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_secret(webhook_id: String, secret: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if secret != null and not secret is String:
        return AppwriteException.new("Invalid type for parameter 'secret'. Expected String.", 0, "argument_error", "")

    var _path := '/webhooks/{webhookId}/secret'
    _path = _path.replace('{webhookId}', webhook_id.uri_encode())

    var _params := {}
    if secret != null:
        _params['secret'] = secret

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteWebhook


    return await _call('patch', _path, _headers, _params, model_script)

