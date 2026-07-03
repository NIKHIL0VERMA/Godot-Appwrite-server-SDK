extends "../utils/service.gd"
## The OAuth2 service allows you to authorize apps and issue standards-based OAuth2 and OpenID Connect tokens.


## Approve an OAuth2 grant after the user gives consent. Returns the `redirectUrl` the end user should be sent to. The consent screen may optionally pass enriched `authorization_details` to record the concrete resources the user selected. You can pass Accept header of `application/json` to receive a JSON response instead of a redirect.[br]
##[br]
## Parameters:[br]
## - [param grant_id] [String]: Grant ID made during authorization, provided to consent screen in URL search params.[br]
## - [param authorization_details] [String]: Enriched `authorization_details` the user consented to, replacing what the client requested. Each entry must use a `type` the project accepts. Optional; omit to keep the originally requested details.[br]
##[br]
## Returns:[br]
## - [AppwriteOauth2Approve] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func approve(grant_id: String, authorization_details: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if authorization_details != null and not authorization_details is String:
        return AppwriteException.new("Invalid type for parameter 'authorization_details'. Expected String.", 0, "argument_error", "")

    var _path := '/oauth2/{project_id}/approve'
    _path = _path.replace('{project_id}', client.get_headers()['x-appwrite-project'].uri_encode())

    var _params := {}
    _params['grant_id'] = grant_id
    if authorization_details != null:
        _params['authorization_details'] = authorization_details

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOauth2Approve


    return await _call('post', _path, _headers, _params, model_script)


## Begin the OAuth2 authorization flow. When called without a session, the user is redirected to the consent screen without grant ID. When called with a session, the redirect URL includes param for grant ID. You can pass Accept header of `application/json` to receive a JSON response instead of a redirect.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: OAuth2 client ID.[br]
## - [param redirect_uri] [String]: Redirect URI where visitor will be redirected after authorization, whether successful or not.[br]
## - [param response_type] [String]: OAuth2 / OIDC response type. One of `code` (Authorization Code Flow), `id_token` (Implicit Flow, OIDC login only), or `code id_token` (Hybrid Flow).[br]
## - [param scope] [String]: Space-separated OAuth2 scopes. Can include project scopes, and built-in scopes: `openid`, `email`, `profile`.[br]
## - [param state] [String]: OAuth2 state. You receive this back in the redirect URI.[br]
## - [param nonce] [String]: OIDC nonce parameter to prevent replay attacks. Required when response_type includes `id_token`.[br]
## - [param code_challenge] [String]: PKCE code challenge. Required when OAuth2 app is public.[br]
## - [param code_challenge_method] [String]: PKCE code challenge method. Required when OAuth2 app is public.[br]
## - [param prompt] [String]: OIDC prompt parameter for customization of consent screen. Space-separated list of: none, login, consent, select_account.[br]
## - [param max_age] [int]: OIDC max_age paraleter for customization of consent screen. Maximum allowable elapsed time in seconds since the user last authenticated. If exceeded, re-authentication is required.[br]
## - [param authorization_details] [String]: Rich authorization request. JSON array of objects, each with a `type` and project-defined fields[br]
## - [param resource] [String]: RFC 8707 resource indicator URI or URI list. Each value must be an absolute URI without a fragment.[br]
##[br]
## Returns:[br]
## - [AppwriteOauth2Authorize] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func authorize(client_id: String, redirect_uri: String, response_type: String, scope: String, state: Variant = null, nonce: Variant = null, code_challenge: Variant = null, code_challenge_method: Variant = null, prompt: Variant = null, max_age: Variant = null, authorization_details: Variant = null, resource: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if state != null and not state is String:
        return AppwriteException.new("Invalid type for parameter 'state'. Expected String.", 0, "argument_error", "")
    if nonce != null and not nonce is String:
        return AppwriteException.new("Invalid type for parameter 'nonce'. Expected String.", 0, "argument_error", "")
    if code_challenge != null and not code_challenge is String:
        return AppwriteException.new("Invalid type for parameter 'code_challenge'. Expected String.", 0, "argument_error", "")
    if code_challenge_method != null and not code_challenge_method is String:
        return AppwriteException.new("Invalid type for parameter 'code_challenge_method'. Expected String.", 0, "argument_error", "")
    if prompt != null and not prompt is String:
        return AppwriteException.new("Invalid type for parameter 'prompt'. Expected String.", 0, "argument_error", "")
    if max_age != null and not max_age is int:
        return AppwriteException.new("Invalid type for parameter 'max_age'. Expected int.", 0, "argument_error", "")
    if authorization_details != null and not authorization_details is String:
        return AppwriteException.new("Invalid type for parameter 'authorization_details'. Expected String.", 0, "argument_error", "")
    if resource != null and not resource is String:
        return AppwriteException.new("Invalid type for parameter 'resource'. Expected String.", 0, "argument_error", "")

    var _path := '/oauth2/{project_id}/authorize'
    _path = _path.replace('{project_id}', client.get_headers()['x-appwrite-project'].uri_encode())

    var _params := {}
    _params['client_id'] = client_id
    _params['redirect_uri'] = redirect_uri
    _params['response_type'] = response_type
    _params['scope'] = scope
    if state != null:
        _params['state'] = state
    if nonce != null:
        _params['nonce'] = nonce
    if code_challenge != null:
        _params['code_challenge'] = code_challenge
    if code_challenge_method != null:
        _params['code_challenge_method'] = code_challenge_method
    if prompt != null:
        _params['prompt'] = prompt
    if max_age != null:
        _params['max_age'] = max_age
    if authorization_details != null:
        _params['authorization_details'] = authorization_details
    if resource != null:
        _params['resource'] = resource

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteOauth2Authorize


    return await _call('get', _path, _headers, _params, model_script)


## Start the OAuth2 Device Authorization Grant. Returns the device code, user code, verification URL, expiration, and polling interval.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: OAuth2 client ID.[br]
## - [param scope] [String]: Space-separated OAuth2 scopes. Can include project scopes, and built-in scopes: `openid`, `email`, `profile`.[br]
## - [param authorization_details] [String]: Rich authorization request. JSON array of objects, each with a `type` and project-defined fields[br]
## - [param resource] [String]: RFC 8707 resource indicator URI or URI list. Each value must be an absolute URI without a fragment.[br]
##[br]
## Returns:[br]
## - [AppwriteOauth2DeviceAuthorization] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_device_authorization(client_id: Variant = null, scope: Variant = null, authorization_details: Variant = null, resource: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if scope != null and not scope is String:
        return AppwriteException.new("Invalid type for parameter 'scope'. Expected String.", 0, "argument_error", "")
    if authorization_details != null and not authorization_details is String:
        return AppwriteException.new("Invalid type for parameter 'authorization_details'. Expected String.", 0, "argument_error", "")
    if resource != null and not resource is String:
        return AppwriteException.new("Invalid type for parameter 'resource'. Expected String.", 0, "argument_error", "")

    var _path := '/oauth2/{project_id}/device_authorization'
    _path = _path.replace('{project_id}', client.get_headers()['x-appwrite-project'].uri_encode())

    var _params := {}
    if client_id != null:
        _params['client_id'] = client_id
    if scope != null:
        _params['scope'] = scope
    if authorization_details != null:
        _params['authorization_details'] = authorization_details
    if resource != null:
        _params['resource'] = resource

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOauth2DeviceAuthorization


    return await _call('post', _path, _headers, _params, model_script)


## Exchange a device flow user code for an OAuth2 grant. The authenticated user is bound to the pending grant. Pass the returned grant ID to the get grant endpoint to render the consent screen, then to the approve or reject endpoint to complete the flow.[br]
##[br]
## Parameters:[br]
## - [param user_code] [String]: User code displayed on the device.[br]
##[br]
## Returns:[br]
## - [AppwriteOauth2Grant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_grant(user_code: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/oauth2/{project_id}/grants'
    _path = _path.replace('{project_id}', client.get_headers()['x-appwrite-project'].uri_encode())

    var _params := {}
    _params['user_code'] = user_code

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOauth2Grant


    return await _call('post', _path, _headers, _params, model_script)


## Get an OAuth2 grant by its ID. Used by the consent screen to display the details of the authorization the user is being asked to approve. A grant can only be read by the user it belongs to, or by server SDK.[br]
##[br]
## Parameters:[br]
## - [param grant_id] [String]: Grant ID made during authorization, provided to consent screen in URL search params.[br]
##[br]
## Returns:[br]
## - [AppwriteOauth2Grant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_grant(grant_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/oauth2/{project_id}/grants/{grant_id}'
    _path = _path.replace('{project_id}', client.get_headers()['x-appwrite-project'].uri_encode())
    _path = _path.replace('{grant_id}', grant_id.uri_encode())

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteOauth2Grant


    return await _call('get', _path, _headers, _params, model_script)


## Reject an OAuth2 grant when the user denies consent. Returns the `redirectUrl` the end user should be sent to with an `access_denied` error. You can pass Accept header of `application/json` to receive a JSON response instead of a redirect.[br]
##[br]
## Parameters:[br]
## - [param grant_id] [String]: Grant ID made during authorization, provided to consent screen in URL search params.[br]
##[br]
## Returns:[br]
## - [AppwriteOauth2Reject] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func reject(grant_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/oauth2/{project_id}/reject'
    _path = _path.replace('{project_id}', client.get_headers()['x-appwrite-project'].uri_encode())

    var _params := {}
    _params['grant_id'] = grant_id

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOauth2Reject


    return await _call('post', _path, _headers, _params, model_script)


## Revoke an OAuth2 access token or refresh token.[br]
##[br]
## Parameters:[br]
## - [param token] [String]: The access or refresh token to revoke.[br]
## - [param token_type_hint] [String]: Type of token to revoke (access_token or refresh_token).[br]
## - [param client_id] [String]: OAuth2 client ID.[br]
## - [param client_secret] [String]: OAuth2 client secret. Required for confidential apps; omitted for public apps.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func revoke(token: String, token_type_hint: Variant = null, client_id: Variant = null, client_secret: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if token_type_hint != null and not token_type_hint is String:
        return AppwriteException.new("Invalid type for parameter 'token_type_hint'. Expected String.", 0, "argument_error", "")
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if client_secret != null and not client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'client_secret'. Expected String.", 0, "argument_error", "")

    var _path := '/oauth2/{project_id}/revoke'
    _path = _path.replace('{project_id}', client.get_headers()['x-appwrite-project'].uri_encode())

    var _params := {}
    _params['token'] = token
    if token_type_hint != null:
        _params['token_type_hint'] = token_type_hint
    if client_id != null:
        _params['client_id'] = client_id
    if client_secret != null:
        _params['client_secret'] = client_secret

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = null


    return await _call('post', _path, _headers, _params, model_script)


## Exchange an OAuth2 authorization code, refresh token, or device code for access and refresh tokens.[br]
##[br]
## Parameters:[br]
## - [param grant_type] [String]: OAuth2 grant type. Can be one of: `authorization_code`, `refresh_token`, `urn:ietf:params:oauth:grant-type:device_code`.[br]
## - [param code] [String]: Authorization code to be exchanged for access and refresh tokens. Required for `authorization_code` grant type.[br]
## - [param refresh_token] [String]: Refresh token to be exchanged for a new access and refresh tokens. Required for `refresh_token` grant type.[br]
## - [param device_code] [String]: Device code obtained from the device authorization endpoint. Required for `urn:ietf:params:oauth:grant-type:device_code` grant type.[br]
## - [param client_id] [String]: OAuth2 client ID.[br]
## - [param client_secret] [String]: OAuth2 client secret. Required for confidential apps.[br]
## - [param code_verifier] [String]: PKCE code verifier. Required for public apps.[br]
## - [param redirect_uri] [String]: Redirect URI. Required for `authorization_code` grant type.[br]
## - [param resource] [String]: RFC 8707 resource indicator URI or URI list. Each value must be an absolute URI without a fragment.[br]
##[br]
## Returns:[br]
## - [AppwriteOauth2Token] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_token(grant_type: String, code: Variant = null, refresh_token: Variant = null, device_code: Variant = null, client_id: Variant = null, client_secret: Variant = null, code_verifier: Variant = null, redirect_uri: Variant = null, resource: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if code != null and not code is String:
        return AppwriteException.new("Invalid type for parameter 'code'. Expected String.", 0, "argument_error", "")
    if refresh_token != null and not refresh_token is String:
        return AppwriteException.new("Invalid type for parameter 'refresh_token'. Expected String.", 0, "argument_error", "")
    if device_code != null and not device_code is String:
        return AppwriteException.new("Invalid type for parameter 'device_code'. Expected String.", 0, "argument_error", "")
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if client_secret != null and not client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'client_secret'. Expected String.", 0, "argument_error", "")
    if code_verifier != null and not code_verifier is String:
        return AppwriteException.new("Invalid type for parameter 'code_verifier'. Expected String.", 0, "argument_error", "")
    if redirect_uri != null and not redirect_uri is String:
        return AppwriteException.new("Invalid type for parameter 'redirect_uri'. Expected String.", 0, "argument_error", "")
    if resource != null and not resource is String:
        return AppwriteException.new("Invalid type for parameter 'resource'. Expected String.", 0, "argument_error", "")

    var _path := '/oauth2/{project_id}/token'
    _path = _path.replace('{project_id}', client.get_headers()['x-appwrite-project'].uri_encode())

    var _params := {}
    _params['grant_type'] = grant_type
    if code != null:
        _params['code'] = code
    if refresh_token != null:
        _params['refresh_token'] = refresh_token
    if device_code != null:
        _params['device_code'] = device_code
    if client_id != null:
        _params['client_id'] = client_id
    if client_secret != null:
        _params['client_secret'] = client_secret
    if code_verifier != null:
        _params['code_verifier'] = code_verifier
    if redirect_uri != null:
        _params['redirect_uri'] = redirect_uri
    if resource != null:
        _params['resource'] = resource

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOauth2Token


    return await _call('post', _path, _headers, _params, model_script)

