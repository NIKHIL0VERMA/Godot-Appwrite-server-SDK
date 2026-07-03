extends "../utils/service.gd"
## Service class.


## List applications.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteAppsList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list(queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/apps'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteAppsList


    return await _call('get', _path, _headers, _params, model_script)


## Create a new application.[br]
##[br]
## Parameters:[br]
## - [param app_id] [String]: Application ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Application name.[br]
## - [param redirect_uris] [Array]: Redirect URIs (array of valid URLs).[br]
## - [param description] [String]: Application description shown to users during OAuth2 consent.[br]
## - [param client_uri] [String]: Application homepage URL shown to users during OAuth2 consent.[br]
## - [param logo_uri] [String]: Application logo URL shown to users during OAuth2 consent.[br]
## - [param privacy_policy_url] [String]: Application privacy policy URL shown to users during OAuth2 consent.[br]
## - [param terms_url] [String]: Application terms of service URL shown to users during OAuth2 consent.[br]
## - [param contacts] [Array]: Application support or security contact emails. Maximum of 100 contacts are allowed.[br]
## - [param tagline] [String]: Application tagline shown to users during OAuth2 consent.[br]
## - [param tags] [Array]: Application tags shown to users during OAuth2 consent. Maximum of 100 tags are allowed, each up to 64 characters long.[br]
## - [param images] [Array]: Application image URLs shown to users during OAuth2 consent. Maximum of 100 images are allowed.[br]
## - [param support_url] [String]: Application support URL shown to users during OAuth2 consent.[br]
## - [param data_deletion_url] [String]: Application data deletion URL shown to users during OAuth2 consent.[br]
## - [param post_logout_redirect_uris] [Array]: Post-logout redirect URIs for OpenID Connect RP-Initiated Logout (array of valid URLs). After ending the user session, the logout endpoint only redirects to URIs in this list.[br]
## - [param enabled] [bool]: Is application enabled?[br]
## - [param xtype] [String]: OAuth2 client type. Use `public` for SPAs, mobile, and native apps that cannot keep a `client_secret` — PKCE is then required at the token endpoint. Use `confidential` for server-side clients that present a `client_secret`. Defaults to `confidential`.[br]
## - [param device_flow] [bool]: Allow this client to use the OAuth2 Device Authorization Grant (RFC 8628) for input-constrained devices such as TVs and CLIs. Defaults to false.[br]
## - [param team_id] [String]: Team unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteApp] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create(app_id: String, xname: String, redirect_uris: Array, description: Variant = null, client_uri: Variant = null, logo_uri: Variant = null, privacy_policy_url: Variant = null, terms_url: Variant = null, contacts: Variant = null, tagline: Variant = null, tags: Variant = null, images: Variant = null, support_url: Variant = null, data_deletion_url: Variant = null, post_logout_redirect_uris: Variant = null, enabled: Variant = null, xtype: Variant = null, device_flow: Variant = null, team_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if description != null and not description is String:
        return AppwriteException.new("Invalid type for parameter 'description'. Expected String.", 0, "argument_error", "")
    if client_uri != null and not client_uri is String:
        return AppwriteException.new("Invalid type for parameter 'client_uri'. Expected String.", 0, "argument_error", "")
    if logo_uri != null and not logo_uri is String:
        return AppwriteException.new("Invalid type for parameter 'logo_uri'. Expected String.", 0, "argument_error", "")
    if privacy_policy_url != null and not privacy_policy_url is String:
        return AppwriteException.new("Invalid type for parameter 'privacy_policy_url'. Expected String.", 0, "argument_error", "")
    if terms_url != null and not terms_url is String:
        return AppwriteException.new("Invalid type for parameter 'terms_url'. Expected String.", 0, "argument_error", "")
    if contacts != null and not contacts is Array:
        return AppwriteException.new("Invalid type for parameter 'contacts'. Expected Array.", 0, "argument_error", "")
    if tagline != null and not tagline is String:
        return AppwriteException.new("Invalid type for parameter 'tagline'. Expected String.", 0, "argument_error", "")
    if tags != null and not tags is Array:
        return AppwriteException.new("Invalid type for parameter 'tags'. Expected Array.", 0, "argument_error", "")
    if images != null and not images is Array:
        return AppwriteException.new("Invalid type for parameter 'images'. Expected Array.", 0, "argument_error", "")
    if support_url != null and not support_url is String:
        return AppwriteException.new("Invalid type for parameter 'support_url'. Expected String.", 0, "argument_error", "")
    if data_deletion_url != null and not data_deletion_url is String:
        return AppwriteException.new("Invalid type for parameter 'data_deletion_url'. Expected String.", 0, "argument_error", "")
    if post_logout_redirect_uris != null and not post_logout_redirect_uris is Array:
        return AppwriteException.new("Invalid type for parameter 'post_logout_redirect_uris'. Expected Array.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")
    if xtype != null and not xtype is String:
        return AppwriteException.new("Invalid type for parameter 'xtype'. Expected String.", 0, "argument_error", "")
    if device_flow != null and not device_flow is bool:
        return AppwriteException.new("Invalid type for parameter 'device_flow'. Expected bool.", 0, "argument_error", "")
    if team_id != null and not team_id is String:
        return AppwriteException.new("Invalid type for parameter 'team_id'. Expected String.", 0, "argument_error", "")

    var _path := '/apps'

    var _params := {}
    _params['appId'] = app_id
    _params['name'] = xname
    if description != null:
        _params['description'] = description
    if client_uri != null:
        _params['clientUri'] = client_uri
    if logo_uri != null:
        _params['logoUri'] = logo_uri
    if privacy_policy_url != null:
        _params['privacyPolicyUrl'] = privacy_policy_url
    if terms_url != null:
        _params['termsUrl'] = terms_url
    if contacts != null:
        _params['contacts'] = contacts
    if tagline != null:
        _params['tagline'] = tagline
    if tags != null:
        _params['tags'] = tags
    if images != null:
        _params['images'] = images
    if support_url != null:
        _params['supportUrl'] = support_url
    if data_deletion_url != null:
        _params['dataDeletionUrl'] = data_deletion_url
    _params['redirectUris'] = redirect_uris
    if post_logout_redirect_uris != null:
        _params['postLogoutRedirectUris'] = post_logout_redirect_uris
    if enabled != null:
        _params['enabled'] = enabled
    if xtype != null:
        _params['type'] = xtype
    if device_flow != null:
        _params['deviceFlow'] = device_flow
    if team_id != null:
        _params['teamId'] = team_id

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteApp


    return await _call('post', _path, _headers, _params, model_script)


## Get an application by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param app_id] [String]: Application unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteApp] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func xget(app_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/apps/{appId}'
    _path = _path.replace('{appId}', app_id.uri_encode())

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteApp


    return await _call('get', _path, _headers, _params, model_script)


## Update an application by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param app_id] [String]: Application unique ID.[br]
## - [param xname] [String]: Application name.[br]
## - [param description] [String]: Application description shown to users during OAuth2 consent.[br]
## - [param client_uri] [String]: Application homepage URL shown to users during OAuth2 consent.[br]
## - [param logo_uri] [String]: Application logo URL shown to users during OAuth2 consent.[br]
## - [param privacy_policy_url] [String]: Application privacy policy URL shown to users during OAuth2 consent.[br]
## - [param terms_url] [String]: Application terms of service URL shown to users during OAuth2 consent.[br]
## - [param contacts] [Array]: Application support or security contact emails. Maximum of 100 contacts are allowed.[br]
## - [param tagline] [String]: Application tagline shown to users during OAuth2 consent.[br]
## - [param tags] [Array]: Application tags shown to users during OAuth2 consent. Maximum of 100 tags are allowed, each up to 64 characters long.[br]
## - [param images] [Array]: Application image URLs shown to users during OAuth2 consent. Maximum of 100 images are allowed.[br]
## - [param support_url] [String]: Application support URL shown to users during OAuth2 consent.[br]
## - [param data_deletion_url] [String]: Application data deletion URL shown to users during OAuth2 consent.[br]
## - [param enabled] [bool]: Is application enabled?[br]
## - [param redirect_uris] [Array]: Redirect URIs (array of valid URLs).[br]
## - [param post_logout_redirect_uris] [Array]: Post-logout redirect URIs for OpenID Connect RP-Initiated Logout (array of valid URLs). After ending the user session, the logout endpoint only redirects to URIs in this list.[br]
## - [param xtype] [String]: OAuth2 client type. Use `public` for SPAs, mobile, and native apps that cannot keep a `client_secret` — PKCE is then required at the token endpoint. Use `confidential` for server-side clients that present a `client_secret`. Defaults to `confidential`.[br]
## - [param device_flow] [bool]: Allow this client to use the OAuth2 Device Authorization Grant (RFC 8628) for input-constrained devices such as TVs and CLIs. Defaults to false.[br]
##[br]
## Returns:[br]
## - [AppwriteApp] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update(app_id: String, xname: String, description: Variant = null, client_uri: Variant = null, logo_uri: Variant = null, privacy_policy_url: Variant = null, terms_url: Variant = null, contacts: Variant = null, tagline: Variant = null, tags: Variant = null, images: Variant = null, support_url: Variant = null, data_deletion_url: Variant = null, enabled: Variant = null, redirect_uris: Variant = null, post_logout_redirect_uris: Variant = null, xtype: Variant = null, device_flow: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if description != null and not description is String:
        return AppwriteException.new("Invalid type for parameter 'description'. Expected String.", 0, "argument_error", "")
    if client_uri != null and not client_uri is String:
        return AppwriteException.new("Invalid type for parameter 'client_uri'. Expected String.", 0, "argument_error", "")
    if logo_uri != null and not logo_uri is String:
        return AppwriteException.new("Invalid type for parameter 'logo_uri'. Expected String.", 0, "argument_error", "")
    if privacy_policy_url != null and not privacy_policy_url is String:
        return AppwriteException.new("Invalid type for parameter 'privacy_policy_url'. Expected String.", 0, "argument_error", "")
    if terms_url != null and not terms_url is String:
        return AppwriteException.new("Invalid type for parameter 'terms_url'. Expected String.", 0, "argument_error", "")
    if contacts != null and not contacts is Array:
        return AppwriteException.new("Invalid type for parameter 'contacts'. Expected Array.", 0, "argument_error", "")
    if tagline != null and not tagline is String:
        return AppwriteException.new("Invalid type for parameter 'tagline'. Expected String.", 0, "argument_error", "")
    if tags != null and not tags is Array:
        return AppwriteException.new("Invalid type for parameter 'tags'. Expected Array.", 0, "argument_error", "")
    if images != null and not images is Array:
        return AppwriteException.new("Invalid type for parameter 'images'. Expected Array.", 0, "argument_error", "")
    if support_url != null and not support_url is String:
        return AppwriteException.new("Invalid type for parameter 'support_url'. Expected String.", 0, "argument_error", "")
    if data_deletion_url != null and not data_deletion_url is String:
        return AppwriteException.new("Invalid type for parameter 'data_deletion_url'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")
    if redirect_uris != null and not redirect_uris is Array:
        return AppwriteException.new("Invalid type for parameter 'redirect_uris'. Expected Array.", 0, "argument_error", "")
    if post_logout_redirect_uris != null and not post_logout_redirect_uris is Array:
        return AppwriteException.new("Invalid type for parameter 'post_logout_redirect_uris'. Expected Array.", 0, "argument_error", "")
    if xtype != null and not xtype is String:
        return AppwriteException.new("Invalid type for parameter 'xtype'. Expected String.", 0, "argument_error", "")
    if device_flow != null and not device_flow is bool:
        return AppwriteException.new("Invalid type for parameter 'device_flow'. Expected bool.", 0, "argument_error", "")

    var _path := '/apps/{appId}'
    _path = _path.replace('{appId}', app_id.uri_encode())

    var _params := {}
    _params['name'] = xname
    if description != null:
        _params['description'] = description
    if client_uri != null:
        _params['clientUri'] = client_uri
    if logo_uri != null:
        _params['logoUri'] = logo_uri
    if privacy_policy_url != null:
        _params['privacyPolicyUrl'] = privacy_policy_url
    if terms_url != null:
        _params['termsUrl'] = terms_url
    if contacts != null:
        _params['contacts'] = contacts
    if tagline != null:
        _params['tagline'] = tagline
    if tags != null:
        _params['tags'] = tags
    if images != null:
        _params['images'] = images
    if support_url != null:
        _params['supportUrl'] = support_url
    if data_deletion_url != null:
        _params['dataDeletionUrl'] = data_deletion_url
    if enabled != null:
        _params['enabled'] = enabled
    if redirect_uris != null:
        _params['redirectUris'] = redirect_uris
    if post_logout_redirect_uris != null:
        _params['postLogoutRedirectUris'] = post_logout_redirect_uris
    if xtype != null:
        _params['type'] = xtype
    if device_flow != null:
        _params['deviceFlow'] = device_flow

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteApp


    return await _call('put', _path, _headers, _params, model_script)


## Delete an application by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param app_id] [String]: Application unique ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete(app_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/apps/{appId}'
    _path = _path.replace('{appId}', app_id.uri_encode())

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = null


    return await _call('delete', _path, _headers, _params, model_script)


## List client secrets for an application.[br]
##[br]
## Parameters:[br]
## - [param app_id] [String]: Application unique ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteAppSecretList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_secrets(app_id: String, queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/apps/{appId}/secrets'
    _path = _path.replace('{appId}', app_id.uri_encode())

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteAppSecretList


    return await _call('get', _path, _headers, _params, model_script)


## Create a new client secret for an application.[br]
##[br]
## Parameters:[br]
## - [param app_id] [String]: Application unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteAppSecretPlaintext] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_secret(app_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/apps/{appId}/secrets'
    _path = _path.replace('{appId}', app_id.uri_encode())

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteAppSecretPlaintext


    return await _call('post', _path, _headers, _params, model_script)


## Get an application client secret by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param app_id] [String]: Application unique ID.[br]
## - [param secret_id] [String]: Secret unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteAppSecret] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_secret(app_id: String, secret_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/apps/{appId}/secrets/{secretId}'
    _path = _path.replace('{appId}', app_id.uri_encode())
    _path = _path.replace('{secretId}', secret_id.uri_encode())

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteAppSecret


    return await _call('get', _path, _headers, _params, model_script)


## Delete an application client secret by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param app_id] [String]: Application unique ID.[br]
## - [param secret_id] [String]: Secret unique ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_secret(app_id: String, secret_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/apps/{appId}/secrets/{secretId}'
    _path = _path.replace('{appId}', app_id.uri_encode())
    _path = _path.replace('{secretId}', secret_id.uri_encode())

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = null


    return await _call('delete', _path, _headers, _params, model_script)


## Transfer an application to another team by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param app_id] [String]: Application unique ID.[br]
## - [param team_id] [String]: Team ID of the team to transfer application to.[br]
##[br]
## Returns:[br]
## - [AppwriteApp] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_team(app_id: String, team_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/apps/{appId}/team'
    _path = _path.replace('{appId}', app_id.uri_encode())

    var _params := {}
    _params['teamId'] = team_id

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteApp


    return await _call('patch', _path, _headers, _params, model_script)


## Revoke all tokens for an application by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param app_id] [String]: Application unique ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_tokens(app_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/apps/{appId}/tokens'
    _path = _path.replace('{appId}', app_id.uri_encode())

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = null


    return await _call('delete', _path, _headers, _params, model_script)

