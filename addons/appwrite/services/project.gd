extends "../utils/service.gd"
## The Project service allows you to manage all the projects in your Appwrite server.


## Get a project.[br]
##[br]
## Returns:[br]
## - [AppwriteProject] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func xget() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project'

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteProject


    return await _call('get', _path, _headers, _params, model_script)


## Delete a project.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project'

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null


    return await _call('delete', _path, _headers, _params, model_script)


## Update properties of a specific auth method. Use this endpoint to enable or disable a method in your project. [br]
##[br]
## Parameters:[br]
## - [param method_id] [String]: Auth Method ID. Possible values: email-password,magic-url,email-otp,anonymous,invites,jwt,phone[br]
## - [param enabled] [bool]: Auth method status.[br]
##[br]
## Returns:[br]
## - [AppwriteProject] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_auth_method(method_id: String, enabled: bool) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/auth-methods/{methodId}'
    _path = _path.replace('{methodId}', method_id.uri_encode())

    var _params := {}
    _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteProject


    return await _call('patch', _path, _headers, _params, model_script)


## Get a list of all API keys from the current project.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: expire, accessedAt, name, scopes[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteKeyList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_keys(queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/keys'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteKeyList


    return await _call('get', _path, _headers, _params, model_script)


## Create a new API key. It&#039;s recommended to have multiple API keys with strict scopes for separate functions within your project.[br]
##[br]
##You can also create an ephemeral API key if you need a short-lived key instead.[br]
##[br]
## Parameters:[br]
## - [param key_id] [String]: Key ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Key name. Max length: 128 chars.[br]
## - [param scopes] [Array[String]]: Key scopes list. Maximum of 100 scopes are allowed.[br]
## - [param expire] [String]: Expiration time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. Use null for unlimited expiration.[br]
##[br]
## Returns:[br]
## - [AppwriteKey] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_key(key_id: String, xname: String, scopes: Array[String], expire: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if expire != null and not expire is String:
        return AppwriteException.new("Invalid type for parameter 'expire'. Expected String.", 0, "argument_error", "")

    var _path := '/project/keys'

    var _params := {}
    _params['keyId'] = key_id
    _params['name'] = xname
    _params['scopes'] = scopes
    if expire != null:
        _params['expire'] = expire

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteKey


    return await _call('post', _path, _headers, _params, model_script)


## Create a new ephemeral API key. It&#039;s recommended to have multiple API keys with strict scopes for separate functions within your project.[br]
##[br]
##You can also create a standard API key if you need a longer-lived key instead.[br]
##[br]
## Parameters:[br]
## - [param scopes] [Array[String]]: Key scopes list. Maximum of 100 scopes are allowed.[br]
## - [param duration] [int]: Time in seconds before ephemeral key expires. Maximum duration is 3600 seconds.[br]
##[br]
## Returns:[br]
## - [AppwriteEphemeralKey] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_ephemeral_key(scopes: Array[String], duration: int) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/keys/ephemeral'

    var _params := {}
    _params['scopes'] = scopes
    _params['duration'] = duration

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteEphemeralKey


    return await _call('post', _path, _headers, _params, model_script)


## Get a key by its unique ID. [br]
##[br]
## Parameters:[br]
## - [param key_id] [String]: Key ID.[br]
##[br]
## Returns:[br]
## - [AppwriteKey] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_key(key_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/keys/{keyId}'
    _path = _path.replace('{keyId}', key_id.uri_encode())

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteKey


    return await _call('get', _path, _headers, _params, model_script)


## Update a key by its unique ID. Use this endpoint to update the name, scopes, or expiration time of an API key.[br]
##[br]
## Parameters:[br]
## - [param key_id] [String]: Key ID.[br]
## - [param xname] [String]: Key name. Max length: 128 chars.[br]
## - [param scopes] [Array[String]]: Key scopes list. Maximum of 100 scopes are allowed.[br]
## - [param expire] [String]: Expiration time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. Use null for unlimited expiration.[br]
##[br]
## Returns:[br]
## - [AppwriteKey] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_key(key_id: String, xname: String, scopes: Array[String], expire: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if expire != null and not expire is String:
        return AppwriteException.new("Invalid type for parameter 'expire'. Expected String.", 0, "argument_error", "")

    var _path := '/project/keys/{keyId}'
    _path = _path.replace('{keyId}', key_id.uri_encode())

    var _params := {}
    _params['name'] = xname
    _params['scopes'] = scopes
    if expire != null:
        _params['expire'] = expire

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteKey


    return await _call('put', _path, _headers, _params, model_script)


## Delete a key by its unique ID. Once deleted, the key can no longer be used to authenticate API calls.[br]
##[br]
## Parameters:[br]
## - [param key_id] [String]: Key ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_key(key_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/keys/{keyId}'
    _path = _path.replace('{keyId}', key_id.uri_encode())

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null


    return await _call('delete', _path, _headers, _params, model_script)


## Update the project labels. Labels can be used to easily filter projects in an organization.[br]
##[br]
## Parameters:[br]
## - [param labels] [Array]: Array of project labels. Replaces the previous labels. Maximum of 1000 labels are allowed, each up to 36 alphanumeric characters long.[br]
##[br]
## Returns:[br]
## - [AppwriteProject] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_labels(labels: Array) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/labels'

    var _params := {}
    _params['labels'] = labels

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteProject


    return await _call('put', _path, _headers, _params, model_script)


## Get a list of all mock phones in the project. This endpoint returns an array of all mock phones and their OTPs.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Only supported methods are limit and offset[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteMockNumberList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_mock_phones(queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/mock-phones'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteMockNumberList


    return await _call('get', _path, _headers, _params, model_script)


## Create a new mock phone for your project. Use this endpoint to register a mock phone number and its sign-in OTP for your testers.[br]
##[br]
## Parameters:[br]
## - [param number] [String]: Phone number to associate with the mock phone. Must be a valid E.164 formatted phone number.[br]
## - [param otp] [String]: One-time password (OTP) to associate with the mock phone. Must be a 6-digit numeric code.[br]
##[br]
## Returns:[br]
## - [AppwriteMockNumber] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_mock_phone(number: String, otp: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/mock-phones'

    var _params := {}
    _params['number'] = number
    _params['otp'] = otp

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteMockNumber


    return await _call('post', _path, _headers, _params, model_script)


## Get a mock phone by its unique number. This endpoint returns the mock phone&#039;s OTP.[br]
##[br]
## Parameters:[br]
## - [param number] [String]: Phone number associated with the mock phone. Must be a valid E.164 formatted phone number.[br]
##[br]
## Returns:[br]
## - [AppwriteMockNumber] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_mock_phone(number: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/mock-phones/{number}'
    _path = _path.replace('{number}', number.uri_encode())

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteMockNumber


    return await _call('get', _path, _headers, _params, model_script)


## Update a mock phone by its unique number. Use this endpoint to update the mock phone&#039;s OTP.[br]
##[br]
## Parameters:[br]
## - [param number] [String]: Phone number associated with the mock phone. Must be a valid E.164 formatted phone number.[br]
## - [param otp] [String]: One-time password (OTP) to associate with the mock phone. Must be a 6-digit numeric code.[br]
##[br]
## Returns:[br]
## - [AppwriteMockNumber] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_mock_phone(number: String, otp: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/mock-phones/{number}'
    _path = _path.replace('{number}', number.uri_encode())

    var _params := {}
    _params['otp'] = otp

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteMockNumber


    return await _call('put', _path, _headers, _params, model_script)


## Delete a mock phone by its unique number. This endpoint removes the mock phone and its OTP configuration from the project.[br]
##[br]
## Parameters:[br]
## - [param number] [String]: Phone number associated with the mock phone. Must be a valid E.164 formatted phone number.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_mock_phone(number: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/mock-phones/{number}'
    _path = _path.replace('{number}', number.uri_encode())

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null


    return await _call('delete', _path, _headers, _params, model_script)


## Get a list of all OAuth2 providers supported by the server, along with the project&#039;s configuration for each. Credential fields are write-only and always returned empty.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Only supported methods are limit and offset[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2ProviderList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_o_auth2_providers(queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2ProviderList


    return await _call('get', _path, _headers, _params, model_script)


## Update the OAuth2 server (OIDC provider) configuration.[br]
##[br]
## Parameters:[br]
## - [param enabled] [bool]: Enable or disable the OAuth2 server.[br]
## - [param authorization_url] [String]: URL to your application with consent screen.[br]
## - [param scopes] [Array]: List of allowed OAuth2 scopes. Maximum of 100 scopes are allowed, each up to 128 characters long.[br]
## - [param authorization_details_types] [Array]: List of accepted `authorization_details` types. Maximum of 100 types are allowed, each up to 128 characters long.[br]
## - [param access_token_duration] [int]: Access token duration in seconds for confidential clients (server-side apps that authenticate with a client secret). Leave empty to use default 8 hours.[br]
## - [param refresh_token_duration] [int]: Refresh token duration in seconds for confidential clients (server-side apps that authenticate with a client secret). Leave empty to use default 1 year.[br]
## - [param public_access_token_duration] [int]: Access token duration in seconds for public clients (SPAs, mobile, and native apps that cannot keep a client secret). Leave empty to use default 1 hour.[br]
## - [param public_refresh_token_duration] [int]: Refresh token duration in seconds for public clients (SPAs, mobile, and native apps that cannot keep a client secret). Leave empty to use default 30 days.[br]
## - [param confidential_pkce] [bool]: When enabled, PKCE is required for confidential clients (server-side flows using client_secret). PKCE is always required for public clients regardless of this setting.[br]
## - [param verification_url] [String]: URL to your application page where users enter the device flow user code. Required to enable the Device Authorization Grant.[br]
## - [param user_code_length] [int]: Number of characters in the device flow user code, excluding the formatting separator. Shorter codes are easier to type but weaker; pair short codes with short expiry. Leave empty to use default 8.[br]
## - [param user_code_format] [String]: Character set for device flow user codes: `numeric` (digits only — best for numeric keypads and TV remotes), `alphabetic` (letters only), or `alphanumeric` (letters and digits — highest entropy per character). Defaults to `alphanumeric`.[br]
## - [param device_code_duration] [int]: Lifetime in seconds of device flow device codes and user codes. Device codes are intentionally short-lived. Leave empty to use default 600.[br]
##[br]
## Returns:[br]
## - [AppwriteProject] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_server(enabled: bool, authorization_url: String, scopes: Variant = null, authorization_details_types: Variant = null, access_token_duration: Variant = null, refresh_token_duration: Variant = null, public_access_token_duration: Variant = null, public_refresh_token_duration: Variant = null, confidential_pkce: Variant = null, verification_url: Variant = null, user_code_length: Variant = null, user_code_format: Variant = null, device_code_duration: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if scopes != null and not scopes is Array:
        return AppwriteException.new("Invalid type for parameter 'scopes'. Expected Array.", 0, "argument_error", "")
    if authorization_details_types != null and not authorization_details_types is Array:
        return AppwriteException.new("Invalid type for parameter 'authorization_details_types'. Expected Array.", 0, "argument_error", "")
    if access_token_duration != null and not access_token_duration is int:
        return AppwriteException.new("Invalid type for parameter 'access_token_duration'. Expected int.", 0, "argument_error", "")
    if refresh_token_duration != null and not refresh_token_duration is int:
        return AppwriteException.new("Invalid type for parameter 'refresh_token_duration'. Expected int.", 0, "argument_error", "")
    if public_access_token_duration != null and not public_access_token_duration is int:
        return AppwriteException.new("Invalid type for parameter 'public_access_token_duration'. Expected int.", 0, "argument_error", "")
    if public_refresh_token_duration != null and not public_refresh_token_duration is int:
        return AppwriteException.new("Invalid type for parameter 'public_refresh_token_duration'. Expected int.", 0, "argument_error", "")
    if confidential_pkce != null and not confidential_pkce is bool:
        return AppwriteException.new("Invalid type for parameter 'confidential_pkce'. Expected bool.", 0, "argument_error", "")
    if verification_url != null and not verification_url is String:
        return AppwriteException.new("Invalid type for parameter 'verification_url'. Expected String.", 0, "argument_error", "")
    if user_code_length != null and not user_code_length is int:
        return AppwriteException.new("Invalid type for parameter 'user_code_length'. Expected int.", 0, "argument_error", "")
    if user_code_format != null and not user_code_format is String:
        return AppwriteException.new("Invalid type for parameter 'user_code_format'. Expected String.", 0, "argument_error", "")
    if device_code_duration != null and not device_code_duration is int:
        return AppwriteException.new("Invalid type for parameter 'device_code_duration'. Expected int.", 0, "argument_error", "")

    var _path := '/project/oauth2-server'

    var _params := {}
    _params['enabled'] = enabled
    _params['authorizationUrl'] = authorization_url
    if scopes != null:
        _params['scopes'] = scopes
    if authorization_details_types != null:
        _params['authorizationDetailsTypes'] = authorization_details_types
    if access_token_duration != null:
        _params['accessTokenDuration'] = access_token_duration
    if refresh_token_duration != null:
        _params['refreshTokenDuration'] = refresh_token_duration
    if public_access_token_duration != null:
        _params['publicAccessTokenDuration'] = public_access_token_duration
    if public_refresh_token_duration != null:
        _params['publicRefreshTokenDuration'] = public_refresh_token_duration
    if confidential_pkce != null:
        _params['confidentialPkce'] = confidential_pkce
    if verification_url != null:
        _params['verificationUrl'] = verification_url
    if user_code_length != null:
        _params['userCodeLength'] = user_code_length
    if user_code_format != null:
        _params['userCodeFormat'] = user_code_format
    if device_code_duration != null:
        _params['deviceCodeDuration'] = device_code_duration

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteProject


    return await _call('put', _path, _headers, _params, model_script)


## Update the project OAuth2 Amazon configuration.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: &#039;Client ID&#039; of Amazon OAuth2 app. For example: amzn1.application-oa2-client.87400c00000000000000000000063d5b2[br]
## - [param client_secret] [String]: &#039;Client Secret&#039; of Amazon OAuth2 app. For example: 79ffe4000000000000000000000000000000000000000000000000000002de55[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Amazon] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_amazon(client_id: Variant = null, client_secret: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if client_secret != null and not client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'client_secret'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/amazon'

    var _params := {}
    if client_id != null:
        _params['clientId'] = client_id
    if client_secret != null:
        _params['clientSecret'] = client_secret
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Amazon


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Apple configuration.[br]
##[br]
## Parameters:[br]
## - [param service_id] [String]: &#039;Service ID&#039; of Apple OAuth2 app. For example: ip.appwrite.app.web[br]
## - [param key_id] [String]: &#039;Key ID&#039; of Apple OAuth2 app. For example: P4000000N8[br]
## - [param team_id] [String]: &#039;Team ID&#039; of Apple OAuth2 app. For example: D4000000R6[br]
## - [param p8_file] [String]: Contents of the Apple OAuth2 app .p8 private key file. The secret key wrapped by the PEM markers is 200 characters long. For example: -----BEGIN PRIVATE KEY-----MIGTAg...jy2Xbna-----END PRIVATE KEY-----[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Apple] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_apple(service_id: Variant = null, key_id: Variant = null, team_id: Variant = null, p8_file: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if service_id != null and not service_id is String:
        return AppwriteException.new("Invalid type for parameter 'service_id'. Expected String.", 0, "argument_error", "")
    if key_id != null and not key_id is String:
        return AppwriteException.new("Invalid type for parameter 'key_id'. Expected String.", 0, "argument_error", "")
    if team_id != null and not team_id is String:
        return AppwriteException.new("Invalid type for parameter 'team_id'. Expected String.", 0, "argument_error", "")
    if p8_file != null and not p8_file is String:
        return AppwriteException.new("Invalid type for parameter 'p8_file'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/apple'

    var _params := {}
    if service_id != null:
        _params['serviceId'] = service_id
    if key_id != null:
        _params['keyId'] = key_id
    if team_id != null:
        _params['teamId'] = team_id
    if p8_file != null:
        _params['p8File'] = p8_file
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Apple


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Auth0 configuration.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: &#039;Client ID&#039; of Auth0 OAuth2 app. For example: OaOkIA000000000000000000005KLSYq[br]
## - [param client_secret] [String]: &#039;Client Secret&#039; of Auth0 OAuth2 app. For example: zXz0000-00000000000000000000000000000-00000000000000000000PJafnF[br]
## - [param endpoint] [String]: Domain of Auth0 instance. For example: example.us.auth0.com[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Auth0] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_auth0(client_id: Variant = null, client_secret: Variant = null, endpoint: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if client_secret != null and not client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'client_secret'. Expected String.", 0, "argument_error", "")
    if endpoint != null and not endpoint is String:
        return AppwriteException.new("Invalid type for parameter 'endpoint'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/auth0'

    var _params := {}
    if client_id != null:
        _params['clientId'] = client_id
    if client_secret != null:
        _params['clientSecret'] = client_secret
    if endpoint != null:
        _params['endpoint'] = endpoint
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Auth0


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Authentik configuration.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: &#039;Client ID&#039; of Authentik OAuth2 app. For example: dTKOPa0000000000000000000000000000e7G8hv[br]
## - [param client_secret] [String]: &#039;Client Secret&#039; of Authentik OAuth2 app. For example: ntQadq000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000Hp5WK[br]
## - [param endpoint] [String]: Domain of Authentik instance. For example: example.authentik.com[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Authentik] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_authentik(client_id: Variant = null, client_secret: Variant = null, endpoint: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if client_secret != null and not client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'client_secret'. Expected String.", 0, "argument_error", "")
    if endpoint != null and not endpoint is String:
        return AppwriteException.new("Invalid type for parameter 'endpoint'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/authentik'

    var _params := {}
    if client_id != null:
        _params['clientId'] = client_id
    if client_secret != null:
        _params['clientSecret'] = client_secret
    if endpoint != null:
        _params['endpoint'] = endpoint
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Authentik


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Autodesk configuration.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: &#039;Client ID&#039; of Autodesk OAuth2 app. For example: 5zw90v00000000000000000000kVYXN7[br]
## - [param client_secret] [String]: &#039;Client Secret&#039; of Autodesk OAuth2 app. For example: 7I000000000000MW[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Autodesk] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_autodesk(client_id: Variant = null, client_secret: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if client_secret != null and not client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'client_secret'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/autodesk'

    var _params := {}
    if client_id != null:
        _params['clientId'] = client_id
    if client_secret != null:
        _params['clientSecret'] = client_secret
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Autodesk


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Bitbucket configuration.[br]
##[br]
## Parameters:[br]
## - [param key] [String]: &#039;Key&#039; of Bitbucket OAuth2 app. For example: Knt70000000000ByRc[br]
## - [param secret] [String]: &#039;Secret&#039; of Bitbucket OAuth2 app. For example: NMfLZJ00000000000000000000TLQdDx[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Bitbucket] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_bitbucket(key: Variant = null, secret: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if key != null and not key is String:
        return AppwriteException.new("Invalid type for parameter 'key'. Expected String.", 0, "argument_error", "")
    if secret != null and not secret is String:
        return AppwriteException.new("Invalid type for parameter 'secret'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/bitbucket'

    var _params := {}
    if key != null:
        _params['key'] = key
    if secret != null:
        _params['secret'] = secret
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Bitbucket


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Bitly configuration.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: &#039;Client ID&#039; of Bitly OAuth2 app. For example: d95151000000000000000000000000000067af9b[br]
## - [param client_secret] [String]: &#039;Client Secret&#039; of Bitly OAuth2 app. For example: a13e250000000000000000000000000000d73095[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Bitly] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_bitly(client_id: Variant = null, client_secret: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if client_secret != null and not client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'client_secret'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/bitly'

    var _params := {}
    if client_id != null:
        _params['clientId'] = client_id
    if client_secret != null:
        _params['clientSecret'] = client_secret
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Bitly


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Box configuration.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: &#039;Client ID&#039; of Box OAuth2 app. For example: deglcs00000000000000000000x2og6y[br]
## - [param client_secret] [String]: &#039;Client Secret&#039; of Box OAuth2 app. For example: OKM1f100000000000000000000eshEif[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Box] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_box(client_id: Variant = null, client_secret: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if client_secret != null and not client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'client_secret'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/box'

    var _params := {}
    if client_id != null:
        _params['clientId'] = client_id
    if client_secret != null:
        _params['clientSecret'] = client_secret
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Box


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Dailymotion configuration.[br]
##[br]
## Parameters:[br]
## - [param api_key] [String]: &#039;API Key&#039; of Dailymotion OAuth2 app. For example: 07a9000000000000067f[br]
## - [param api_secret] [String]: &#039;API Secret&#039; of Dailymotion OAuth2 app. For example: a399a90000000000000000000000000000d90639[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Dailymotion] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_dailymotion(api_key: Variant = null, api_secret: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if api_key != null and not api_key is String:
        return AppwriteException.new("Invalid type for parameter 'api_key'. Expected String.", 0, "argument_error", "")
    if api_secret != null and not api_secret is String:
        return AppwriteException.new("Invalid type for parameter 'api_secret'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/dailymotion'

    var _params := {}
    if api_key != null:
        _params['apiKey'] = api_key
    if api_secret != null:
        _params['apiSecret'] = api_secret
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Dailymotion


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Discord configuration.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: &#039;Client ID&#039; of Discord OAuth2 app. For example: 950722000000343754[br]
## - [param client_secret] [String]: &#039;Client Secret&#039; of Discord OAuth2 app. For example: YmPXnM000000000000000000002zFg5D[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Discord] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_discord(client_id: Variant = null, client_secret: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if client_secret != null and not client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'client_secret'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/discord'

    var _params := {}
    if client_id != null:
        _params['clientId'] = client_id
    if client_secret != null:
        _params['clientSecret'] = client_secret
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Discord


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Disqus configuration.[br]
##[br]
## Parameters:[br]
## - [param public_key] [String]: &#039;Public Key, also known as API Key&#039; of Disqus OAuth2 app. For example: cgegH70000000000000000000000000000000000000000000000000000Hr1nYX[br]
## - [param secret_key] [String]: &#039;Secret Key, also known as API Secret&#039; of Disqus OAuth2 app. For example: W7Bykj00000000000000000000000000000000000000000000000000003o43w9[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Disqus] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_disqus(public_key: Variant = null, secret_key: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if public_key != null and not public_key is String:
        return AppwriteException.new("Invalid type for parameter 'public_key'. Expected String.", 0, "argument_error", "")
    if secret_key != null and not secret_key is String:
        return AppwriteException.new("Invalid type for parameter 'secret_key'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/disqus'

    var _params := {}
    if public_key != null:
        _params['publicKey'] = public_key
    if secret_key != null:
        _params['secretKey'] = secret_key
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Disqus


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Dropbox configuration.[br]
##[br]
## Parameters:[br]
## - [param app_key] [String]: &#039;App Key&#039; of Dropbox OAuth2 app. For example: jl000000000009t[br]
## - [param app_secret] [String]: &#039;App Secret&#039; of Dropbox OAuth2 app. For example: g200000000000vw[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Dropbox] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_dropbox(app_key: Variant = null, app_secret: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if app_key != null and not app_key is String:
        return AppwriteException.new("Invalid type for parameter 'app_key'. Expected String.", 0, "argument_error", "")
    if app_secret != null and not app_secret is String:
        return AppwriteException.new("Invalid type for parameter 'app_secret'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/dropbox'

    var _params := {}
    if app_key != null:
        _params['appKey'] = app_key
    if app_secret != null:
        _params['appSecret'] = app_secret
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Dropbox


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Etsy configuration.[br]
##[br]
## Parameters:[br]
## - [param key_string] [String]: &#039;Keystring&#039; of Etsy OAuth2 app. For example: nsgzxh0000000000008j85a2[br]
## - [param shared_secret] [String]: &#039;Shared Secret&#039; of Etsy OAuth2 app. For example: tp000000ru[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Etsy] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_etsy(key_string: Variant = null, shared_secret: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if key_string != null and not key_string is String:
        return AppwriteException.new("Invalid type for parameter 'key_string'. Expected String.", 0, "argument_error", "")
    if shared_secret != null and not shared_secret is String:
        return AppwriteException.new("Invalid type for parameter 'shared_secret'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/etsy'

    var _params := {}
    if key_string != null:
        _params['keyString'] = key_string
    if shared_secret != null:
        _params['sharedSecret'] = shared_secret
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Etsy


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Facebook configuration.[br]
##[br]
## Parameters:[br]
## - [param app_id] [String]: &#039;App ID&#039; of Facebook OAuth2 app. For example: 260600000007694[br]
## - [param app_secret] [String]: &#039;App Secret&#039; of Facebook OAuth2 app. For example: 2d0b2800000000000000000000d38af4[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Facebook] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_facebook(app_id: Variant = null, app_secret: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if app_id != null and not app_id is String:
        return AppwriteException.new("Invalid type for parameter 'app_id'. Expected String.", 0, "argument_error", "")
    if app_secret != null and not app_secret is String:
        return AppwriteException.new("Invalid type for parameter 'app_secret'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/facebook'

    var _params := {}
    if app_id != null:
        _params['appId'] = app_id
    if app_secret != null:
        _params['appSecret'] = app_secret
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Facebook


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Figma configuration.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: &#039;Client ID&#039; of Figma OAuth2 app. For example: byay5H0000000000VtiI40[br]
## - [param client_secret] [String]: &#039;Client Secret&#039; of Figma OAuth2 app. For example: yEpOYn0000000000000000004iIsU5[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Figma] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_figma(client_id: Variant = null, client_secret: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if client_secret != null and not client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'client_secret'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/figma'

    var _params := {}
    if client_id != null:
        _params['clientId'] = client_id
    if client_secret != null:
        _params['clientSecret'] = client_secret
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Figma


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 FusionAuth configuration.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: &#039;Client ID&#039; of FusionAuth OAuth2 app. For example: b2222c00-0000-0000-0000-000000862097[br]
## - [param client_secret] [String]: &#039;Client Secret&#039; of FusionAuth OAuth2 app. For example: Jx4s0C0000000000000000000000000000000wGqLsc[br]
## - [param endpoint] [String]: Domain of FusionAuth instance. For example: example.fusionauth.io[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2FusionAuth] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_fusion_auth(client_id: Variant = null, client_secret: Variant = null, endpoint: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if client_secret != null and not client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'client_secret'. Expected String.", 0, "argument_error", "")
    if endpoint != null and not endpoint is String:
        return AppwriteException.new("Invalid type for parameter 'endpoint'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/fusionauth'

    var _params := {}
    if client_id != null:
        _params['clientId'] = client_id
    if client_secret != null:
        _params['clientSecret'] = client_secret
    if endpoint != null:
        _params['endpoint'] = endpoint
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2FusionAuth


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 GitHub configuration.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: &#039;OAuth2 app Client ID, or App ID&#039; of GitHub OAuth2 app. For example: e4d87900000000540733. Example of wrong value: 370006[br]
## - [param client_secret] [String]: &#039;Client Secret&#039; of GitHub OAuth2 app. For example: 5e07c00000000000000000000000000000198bcc[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Github] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_git_hub(client_id: Variant = null, client_secret: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if client_secret != null and not client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'client_secret'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/github'

    var _params := {}
    if client_id != null:
        _params['clientId'] = client_id
    if client_secret != null:
        _params['clientSecret'] = client_secret
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Github


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Gitlab configuration.[br]
##[br]
## Parameters:[br]
## - [param application_id] [String]: &#039;Application ID&#039; of Gitlab OAuth2 app. For example: d41ffe0000000000000000000000000000000000000000000000000000d5e252[br]
## - [param secret] [String]: &#039;Secret&#039; of Gitlab OAuth2 app. For example: gloas-838cfa0000000000000000000000000000000000000000000000000000ecbb38[br]
## - [param endpoint] [String]: Endpoint URL of self-hosted GitLab instance. For example: https://gitlab.com[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Gitlab] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_gitlab(application_id: Variant = null, secret: Variant = null, endpoint: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if application_id != null and not application_id is String:
        return AppwriteException.new("Invalid type for parameter 'application_id'. Expected String.", 0, "argument_error", "")
    if secret != null and not secret is String:
        return AppwriteException.new("Invalid type for parameter 'secret'. Expected String.", 0, "argument_error", "")
    if endpoint != null and not endpoint is String:
        return AppwriteException.new("Invalid type for parameter 'endpoint'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/gitlab'

    var _params := {}
    if application_id != null:
        _params['applicationId'] = application_id
    if secret != null:
        _params['secret'] = secret
    if endpoint != null:
        _params['endpoint'] = endpoint
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Gitlab


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Google configuration.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: &#039;Client ID&#039; of Google OAuth2 app. For example: 120000000095-92ifjb00000000000000000000g7ijfb.apps.googleusercontent.com[br]
## - [param client_secret] [String]: &#039;Client Secret&#039; of Google OAuth2 app. For example: GOCSPX-2k8gsR0000000000000000VNahJj[br]
## - [param prompt] [Array[String]]: Array of Google OAuth2 prompt values. If &quot;none&quot; is included, it must be the only element. &quot;none&quot; means: don&#039;t display any authentication or consent screens. Must not be specified with other values. &quot;consent&quot; means: prompt the user for consent. &quot;select_account&quot; means: prompt the user to select an account.[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Google] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_google(client_id: Variant = null, client_secret: Variant = null, prompt: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if client_secret != null and not client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'client_secret'. Expected String.", 0, "argument_error", "")
    if prompt != null and not prompt is Array:
        return AppwriteException.new("Invalid type for parameter 'prompt'. Expected Array[String].", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/google'

    var _params := {}
    if client_id != null:
        _params['clientId'] = client_id
    if client_secret != null:
        _params['clientSecret'] = client_secret
    if prompt != null:
        _params['prompt'] = prompt
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Google


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Keycloak configuration.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: &#039;Client ID&#039; of Keycloak OAuth2 app. For example: appwrite-o0000000st-app[br]
## - [param client_secret] [String]: &#039;Client Secret&#039; of Keycloak OAuth2 app. For example: jdjrJd00000000000000000000HUsaZO[br]
## - [param endpoint] [String]: Domain of Keycloak instance. For example: keycloak.example.com[br]
## - [param realm_name] [String]: Keycloak realm name. For example: appwrite-realm[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Keycloak] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_keycloak(client_id: Variant = null, client_secret: Variant = null, endpoint: Variant = null, realm_name: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if client_secret != null and not client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'client_secret'. Expected String.", 0, "argument_error", "")
    if endpoint != null and not endpoint is String:
        return AppwriteException.new("Invalid type for parameter 'endpoint'. Expected String.", 0, "argument_error", "")
    if realm_name != null and not realm_name is String:
        return AppwriteException.new("Invalid type for parameter 'realm_name'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/keycloak'

    var _params := {}
    if client_id != null:
        _params['clientId'] = client_id
    if client_secret != null:
        _params['clientSecret'] = client_secret
    if endpoint != null:
        _params['endpoint'] = endpoint
    if realm_name != null:
        _params['realmName'] = realm_name
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Keycloak


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Kick configuration.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: &#039;Client ID&#039; of Kick OAuth2 app. For example: 01KQ7C00000000000001MFHS32[br]
## - [param client_secret] [String]: &#039;Client Secret&#039; of Kick OAuth2 app. For example: 34ac5600000000000000000000000000000000000000000000000000e830c8b[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Kick] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_kick(client_id: Variant = null, client_secret: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if client_secret != null and not client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'client_secret'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/kick'

    var _params := {}
    if client_id != null:
        _params['clientId'] = client_id
    if client_secret != null:
        _params['clientSecret'] = client_secret
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Kick


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Linkedin configuration.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: &#039;Client ID&#039; of Linkedin OAuth2 app. For example: 770000000000dv[br]
## - [param primary_client_secret] [String]: &#039;Primary Client Secret or Secondary Client Secret&#039; of Linkedin OAuth2 app. For example: WPL_AP1.2Bf0000000000000./HtlYw==[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Linkedin] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_linkedin(client_id: Variant = null, primary_client_secret: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if primary_client_secret != null and not primary_client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'primary_client_secret'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/linkedin'

    var _params := {}
    if client_id != null:
        _params['clientId'] = client_id
    if primary_client_secret != null:
        _params['primaryClientSecret'] = primary_client_secret
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Linkedin


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Microsoft configuration.[br]
##[br]
## Parameters:[br]
## - [param application_id] [String]: &#039;Entra ID Application ID, also known as Client ID&#039; of Microsoft OAuth2 app. For example: 00001111-aaaa-2222-bbbb-3333cccc4444[br]
## - [param application_secret] [String]: &#039;Entra ID Application Secret, also known as Client Secret&#039; of Microsoft OAuth2 app. For example: A1bC2dE3fH4iJ5kL6mN7oP8qR9sT0u[br]
## - [param tenant] [String]: Microsoft Entra ID tenant identifier. Use &#039;common&#039;, &#039;organizations&#039;, &#039;consumers&#039; or a specific tenant ID. For example: common[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Microsoft] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_microsoft(application_id: Variant = null, application_secret: Variant = null, tenant: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if application_id != null and not application_id is String:
        return AppwriteException.new("Invalid type for parameter 'application_id'. Expected String.", 0, "argument_error", "")
    if application_secret != null and not application_secret is String:
        return AppwriteException.new("Invalid type for parameter 'application_secret'. Expected String.", 0, "argument_error", "")
    if tenant != null and not tenant is String:
        return AppwriteException.new("Invalid type for parameter 'tenant'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/microsoft'

    var _params := {}
    if application_id != null:
        _params['applicationId'] = application_id
    if application_secret != null:
        _params['applicationSecret'] = application_secret
    if tenant != null:
        _params['tenant'] = tenant
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Microsoft


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Notion configuration.[br]
##[br]
## Parameters:[br]
## - [param oauth_client_id] [String]: &#039;OAuth Client ID&#039; of Notion OAuth2 app. For example: 341d8700-0000-0000-0000-000000446ee3[br]
## - [param oauth_client_secret] [String]: &#039;OAuth Client Secret&#039; of Notion OAuth2 app. For example: secret_dLUr4b000000000000000000000000000000lFHAa9[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Notion] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_notion(oauth_client_id: Variant = null, oauth_client_secret: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if oauth_client_id != null and not oauth_client_id is String:
        return AppwriteException.new("Invalid type for parameter 'oauth_client_id'. Expected String.", 0, "argument_error", "")
    if oauth_client_secret != null and not oauth_client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'oauth_client_secret'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/notion'

    var _params := {}
    if oauth_client_id != null:
        _params['oauthClientId'] = oauth_client_id
    if oauth_client_secret != null:
        _params['oauthClientSecret'] = oauth_client_secret
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Notion


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Oidc configuration.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: &#039;Client ID&#039; of Oidc OAuth2 app. For example: qibI2x0000000000000000000000000006L2YFoG[br]
## - [param client_secret] [String]: &#039;Client Secret&#039; of Oidc OAuth2 app. For example: Ah68ed000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003qpcHV[br]
## - [param well_known_url] [String]: OpenID Connect well-known configuration URL. When provided, authorization, token, and user info endpoints can be discovered automatically. For example: https://myoauth.com/.well-known/openid-configuration[br]
## - [param authorization_url] [String]: OpenID Connect authorization endpoint URL. Required when wellKnownURL is not provided. For example: https://myoauth.com/oauth2/authorize[br]
## - [param token_url] [String]: OpenID Connect token endpoint URL. Required when wellKnownURL is not provided. For example: https://myoauth.com/oauth2/token[br]
## - [param user_info_url] [String]: OpenID Connect user info endpoint URL. Required when wellKnownURL is not provided. For example: https://myoauth.com/oauth2/userinfo[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Oidc] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_oidc(client_id: Variant = null, client_secret: Variant = null, well_known_url: Variant = null, authorization_url: Variant = null, token_url: Variant = null, user_info_url: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if client_secret != null and not client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'client_secret'. Expected String.", 0, "argument_error", "")
    if well_known_url != null and not well_known_url is String:
        return AppwriteException.new("Invalid type for parameter 'well_known_url'. Expected String.", 0, "argument_error", "")
    if authorization_url != null and not authorization_url is String:
        return AppwriteException.new("Invalid type for parameter 'authorization_url'. Expected String.", 0, "argument_error", "")
    if token_url != null and not token_url is String:
        return AppwriteException.new("Invalid type for parameter 'token_url'. Expected String.", 0, "argument_error", "")
    if user_info_url != null and not user_info_url is String:
        return AppwriteException.new("Invalid type for parameter 'user_info_url'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/oidc'

    var _params := {}
    if client_id != null:
        _params['clientId'] = client_id
    if client_secret != null:
        _params['clientSecret'] = client_secret
    if well_known_url != null:
        _params['wellKnownURL'] = well_known_url
    if authorization_url != null:
        _params['authorizationURL'] = authorization_url
    if token_url != null:
        _params['tokenURL'] = token_url
    if user_info_url != null:
        _params['userInfoURL'] = user_info_url
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Oidc


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Okta configuration.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: &#039;Client ID&#039; of Okta OAuth2 app. For example: 0oa00000000000000698[br]
## - [param client_secret] [String]: &#039;Client Secret&#039; of Okta OAuth2 app. For example: Kiq0000000000000000000000000000000000000-00000000000H2L5-3SJ-vRV[br]
## - [param domain] [String]: Okta company domain. Required when enabling the provider. For example: trial-6400025.okta.com. Example of wrong value: trial-6400025-admin.okta.com, or https://trial-6400025.okta.com/[br]
## - [param authorization_server_id] [String]: Custom Authorization Servers. Optional, can be left empty or unconfigured. For example: aus000000000000000h7z[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Okta] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_okta(client_id: Variant = null, client_secret: Variant = null, domain: Variant = null, authorization_server_id: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if client_secret != null and not client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'client_secret'. Expected String.", 0, "argument_error", "")
    if domain != null and not domain is String:
        return AppwriteException.new("Invalid type for parameter 'domain'. Expected String.", 0, "argument_error", "")
    if authorization_server_id != null and not authorization_server_id is String:
        return AppwriteException.new("Invalid type for parameter 'authorization_server_id'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/okta'

    var _params := {}
    if client_id != null:
        _params['clientId'] = client_id
    if client_secret != null:
        _params['clientSecret'] = client_secret
    if domain != null:
        _params['domain'] = domain
    if authorization_server_id != null:
        _params['authorizationServerId'] = authorization_server_id
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Okta


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Paypal configuration.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: &#039;Client ID&#039; of Paypal OAuth2 app. For example: AdhIEG7-000000000000-0000000000000000000000000000000-0000000000000000000000-2pyB[br]
## - [param secret_key] [String]: &#039;Secret Key 1 or Secret Key 2&#039; of Paypal OAuth2 app. For example: EH8KCXtew--000000000000000000000000000000000000000_C-1_5UP_000000000000000CB7KDp[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Paypal] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_paypal(client_id: Variant = null, secret_key: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if secret_key != null and not secret_key is String:
        return AppwriteException.new("Invalid type for parameter 'secret_key'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/paypal'

    var _params := {}
    if client_id != null:
        _params['clientId'] = client_id
    if secret_key != null:
        _params['secretKey'] = secret_key
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Paypal


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 PaypalSandbox configuration.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: &#039;Client ID&#039; of PaypalSandbox OAuth2 app. For example: AdhIEG7-000000000000-0000000000000000000000000000000-0000000000000000000000-2pyB[br]
## - [param secret_key] [String]: &#039;Secret Key 1 or Secret Key 2&#039; of PaypalSandbox OAuth2 app. For example: EH8KCXtew--000000000000000000000000000000000000000_C-1_5UP_000000000000000CB7KDp[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Paypal] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_paypal_sandbox(client_id: Variant = null, secret_key: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if secret_key != null and not secret_key is String:
        return AppwriteException.new("Invalid type for parameter 'secret_key'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/paypalSandbox'

    var _params := {}
    if client_id != null:
        _params['clientId'] = client_id
    if secret_key != null:
        _params['secretKey'] = secret_key
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Paypal


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Podio configuration.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: &#039;Client ID&#039; of Podio OAuth2 app. For example: appwrite-o0000000st-app[br]
## - [param client_secret] [String]: &#039;Client Secret&#039; of Podio OAuth2 app. For example: Rn247T0000000000000000000000000000000000000000000000000000W2zWTN[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Podio] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_podio(client_id: Variant = null, client_secret: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if client_secret != null and not client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'client_secret'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/podio'

    var _params := {}
    if client_id != null:
        _params['clientId'] = client_id
    if client_secret != null:
        _params['clientSecret'] = client_secret
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Podio


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Salesforce configuration.[br]
##[br]
## Parameters:[br]
## - [param customer_key] [String]: &#039;Consumer Key&#039; of Salesforce OAuth2 app. For example: 3MVG9I0000000000000000000000000000000000000000000000000000000000000000000000000C5Aejq[br]
## - [param customer_secret] [String]: &#039;Consumer Secret&#039; of Salesforce OAuth2 app. For example: 3w000000000000e2[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Salesforce] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_salesforce(customer_key: Variant = null, customer_secret: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if customer_key != null and not customer_key is String:
        return AppwriteException.new("Invalid type for parameter 'customer_key'. Expected String.", 0, "argument_error", "")
    if customer_secret != null and not customer_secret is String:
        return AppwriteException.new("Invalid type for parameter 'customer_secret'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/salesforce'

    var _params := {}
    if customer_key != null:
        _params['customerKey'] = customer_key
    if customer_secret != null:
        _params['customerSecret'] = customer_secret
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Salesforce


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Slack configuration.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: &#039;Client ID&#039; of Slack OAuth2 app. For example: 23000000089.15000000000023[br]
## - [param client_secret] [String]: &#039;Client Secret&#039; of Slack OAuth2 app. For example: 81656000000000000000000000f3d2fd[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Slack] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_slack(client_id: Variant = null, client_secret: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if client_secret != null and not client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'client_secret'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/slack'

    var _params := {}
    if client_id != null:
        _params['clientId'] = client_id
    if client_secret != null:
        _params['clientSecret'] = client_secret
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Slack


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Spotify configuration.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: &#039;Client ID&#039; of Spotify OAuth2 app. For example: 6ec271000000000000000000009beace[br]
## - [param client_secret] [String]: &#039;Client Secret&#039; of Spotify OAuth2 app. For example: db068a000000000000000000008b5b9f[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Spotify] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_spotify(client_id: Variant = null, client_secret: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if client_secret != null and not client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'client_secret'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/spotify'

    var _params := {}
    if client_id != null:
        _params['clientId'] = client_id
    if client_secret != null:
        _params['clientSecret'] = client_secret
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Spotify


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Stripe configuration.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: &#039;Client ID&#039; of Stripe OAuth2 app. For example: ca_UKibXX0000000000000000000006byvR[br]
## - [param api_secret_key] [String]: &#039;API Secret Key&#039; of Stripe OAuth2 app. For example: sk_51SfOd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000QGWYfp[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Stripe] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_stripe(client_id: Variant = null, api_secret_key: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if api_secret_key != null and not api_secret_key is String:
        return AppwriteException.new("Invalid type for parameter 'api_secret_key'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/stripe'

    var _params := {}
    if client_id != null:
        _params['clientId'] = client_id
    if api_secret_key != null:
        _params['apiSecretKey'] = api_secret_key
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Stripe


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Tradeshift configuration.[br]
##[br]
## Parameters:[br]
## - [param oauth2_client_id] [String]: &#039;OAuth2 Client ID&#039; of Tradeshift OAuth2 app. For example: appwrite-tes00000.0000000000est-app[br]
## - [param oauth2_client_secret] [String]: &#039;OAuth2 Client Secret&#039; of Tradeshift OAuth2 app. For example: 7cb52700-0000-0000-0000-000000ca5b83[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Tradeshift] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_tradeshift(oauth2_client_id: Variant = null, oauth2_client_secret: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if oauth2_client_id != null and not oauth2_client_id is String:
        return AppwriteException.new("Invalid type for parameter 'oauth2_client_id'. Expected String.", 0, "argument_error", "")
    if oauth2_client_secret != null and not oauth2_client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'oauth2_client_secret'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/tradeshift'

    var _params := {}
    if oauth2_client_id != null:
        _params['oauth2ClientId'] = oauth2_client_id
    if oauth2_client_secret != null:
        _params['oauth2ClientSecret'] = oauth2_client_secret
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Tradeshift


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Tradeshift Sandbox configuration.[br]
##[br]
## Parameters:[br]
## - [param oauth2_client_id] [String]: &#039;OAuth2 Client ID&#039; of Tradeshift Sandbox OAuth2 app. For example: appwrite-tes00000.0000000000est-app[br]
## - [param oauth2_client_secret] [String]: &#039;OAuth2 Client Secret&#039; of Tradeshift Sandbox OAuth2 app. For example: 7cb52700-0000-0000-0000-000000ca5b83[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Tradeshift] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_tradeshift_sandbox(oauth2_client_id: Variant = null, oauth2_client_secret: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if oauth2_client_id != null and not oauth2_client_id is String:
        return AppwriteException.new("Invalid type for parameter 'oauth2_client_id'. Expected String.", 0, "argument_error", "")
    if oauth2_client_secret != null and not oauth2_client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'oauth2_client_secret'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/tradeshiftBox'

    var _params := {}
    if oauth2_client_id != null:
        _params['oauth2ClientId'] = oauth2_client_id
    if oauth2_client_secret != null:
        _params['oauth2ClientSecret'] = oauth2_client_secret
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Tradeshift


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Twitch configuration.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: &#039;Client ID&#039; of Twitch OAuth2 app. For example: vvi0in000000000000000000ikmt9p[br]
## - [param client_secret] [String]: &#039;Client Secret&#039; of Twitch OAuth2 app. For example: pmapue000000000000000000zylw3v[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Twitch] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_twitch(client_id: Variant = null, client_secret: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if client_secret != null and not client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'client_secret'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/twitch'

    var _params := {}
    if client_id != null:
        _params['clientId'] = client_id
    if client_secret != null:
        _params['clientSecret'] = client_secret
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Twitch


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 WordPress configuration.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: &#039;Client ID&#039; of WordPress OAuth2 app. For example: 130005[br]
## - [param client_secret] [String]: &#039;Client Secret&#039; of WordPress OAuth2 app. For example: PlBfJS0000000000000000000000000000000000000000000000000000EdUZJk[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2WordPress] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_word_press(client_id: Variant = null, client_secret: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if client_secret != null and not client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'client_secret'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/wordpress'

    var _params := {}
    if client_id != null:
        _params['clientId'] = client_id
    if client_secret != null:
        _params['clientSecret'] = client_secret
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2WordPress


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 X configuration.[br]
##[br]
## Parameters:[br]
## - [param customer_key] [String]: &#039;Customer Key&#039; of X OAuth2 app. For example: slzZV0000000000000NFLaWT[br]
## - [param secret_key] [String]: &#039;Secret Key&#039; of X OAuth2 app. For example: tkEPkp00000000000000000000000000000000000000FTxbI9[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2X] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_x(customer_key: Variant = null, secret_key: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if customer_key != null and not customer_key is String:
        return AppwriteException.new("Invalid type for parameter 'customer_key'. Expected String.", 0, "argument_error", "")
    if secret_key != null and not secret_key is String:
        return AppwriteException.new("Invalid type for parameter 'secret_key'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/x'

    var _params := {}
    if customer_key != null:
        _params['customerKey'] = customer_key
    if secret_key != null:
        _params['secretKey'] = secret_key
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2X


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Yahoo configuration.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: &#039;Client ID, also known as Customer Key&#039; of Yahoo OAuth2 app. For example: dj0yJm000000000000000000000000000000000000000000000000000000000000000000000000000000000000Z4PWRm[br]
## - [param client_secret] [String]: &#039;Client Secret, also known as Customer Secret&#039; of Yahoo OAuth2 app. For example: cf978f0000000000000000000000000000c5e2e9[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Yahoo] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_yahoo(client_id: Variant = null, client_secret: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if client_secret != null and not client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'client_secret'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/yahoo'

    var _params := {}
    if client_id != null:
        _params['clientId'] = client_id
    if client_secret != null:
        _params['clientSecret'] = client_secret
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Yahoo


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Yandex configuration.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: &#039;Client ID&#039; of Yandex OAuth2 app. For example: 6a8a6a0000000000000000000091483c[br]
## - [param client_secret] [String]: &#039;Client Secret&#039; of Yandex OAuth2 app. For example: bbf98500000000000000000000c75a63[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Yandex] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_yandex(client_id: Variant = null, client_secret: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if client_secret != null and not client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'client_secret'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/yandex'

    var _params := {}
    if client_id != null:
        _params['clientId'] = client_id
    if client_secret != null:
        _params['clientSecret'] = client_secret
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Yandex


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Zoho configuration.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: &#039;Client ID&#039; of Zoho OAuth2 app. For example: 1000.83C178000000000000000000RPNX0B[br]
## - [param client_secret] [String]: &#039;Client Secret&#039; of Zoho OAuth2 app. For example: fb5cac000000000000000000000000000000a68f6e[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Zoho] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_zoho(client_id: Variant = null, client_secret: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if client_secret != null and not client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'client_secret'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/zoho'

    var _params := {}
    if client_id != null:
        _params['clientId'] = client_id
    if client_secret != null:
        _params['clientSecret'] = client_secret
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Zoho


    return await _call('patch', _path, _headers, _params, model_script)


## Update the project OAuth2 Zoom configuration.[br]
##[br]
## Parameters:[br]
## - [param client_id] [String]: &#039;Client ID&#039; of Zoom OAuth2 app. For example: QMAC00000000000000w0AQ[br]
## - [param client_secret] [String]: &#039;Client Secret&#039; of Zoom OAuth2 app. For example: GAWsG4000000000000000000007U01ON[br]
## - [param enabled] [bool]: OAuth2 sign-in method status. Set to true to enable new session creation. Setting to true will trigger end-to-end credentials validation, and will throw if the credentials are invalid.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Zoom] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_o_auth2_zoom(client_id: Variant = null, client_secret: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if client_id != null and not client_id is String:
        return AppwriteException.new("Invalid type for parameter 'client_id'. Expected String.", 0, "argument_error", "")
    if client_secret != null and not client_secret is String:
        return AppwriteException.new("Invalid type for parameter 'client_secret'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/oauth2/zoom'

    var _params := {}
    if client_id != null:
        _params['clientId'] = client_id
    if client_secret != null:
        _params['clientSecret'] = client_secret
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Zoom


    return await _call('patch', _path, _headers, _params, model_script)


## Get a single OAuth2 provider configuration. Credential fields (client secret, p8 file, key/team IDs) are write-only and always returned empty.[br]
##[br]
## Parameters:[br]
## - [param provider_id] [String]: OAuth2 provider key. For example: github, google, apple.[br]
##[br]
## Returns:[br]
## - [AppwriteOAuth2Github] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_o_auth2_provider(provider_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/oauth2/{providerId}'
    _path = _path.replace('{providerId}', provider_id.uri_encode())

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteOAuth2Github


    return await _call('get', _path, _headers, _params, model_script)


## Get a list of all platforms in the project. This endpoint returns an array of all platforms and their configurations.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: type, name, hostname, bundleIdentifier, applicationId, packageIdentifierName, packageName[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwritePlatformList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_platforms(queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/platforms'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwritePlatformList


    return await _call('get', _path, _headers, _params, model_script)


## Create a new Android platform for your project. Use this endpoint to register a new Android platform where your users will run your application which will interact with the Appwrite API.[br]
##[br]
## Parameters:[br]
## - [param platform_id] [String]: Platform ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Platform name. Max length: 128 chars.[br]
## - [param application_id] [String]: Android application ID. Max length: 256 chars.[br]
##[br]
## Returns:[br]
## - [AppwritePlatformAndroid] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_android_platform(platform_id: String, xname: String, application_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/platforms/android'

    var _params := {}
    _params['platformId'] = platform_id
    _params['name'] = xname
    _params['applicationId'] = application_id

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwritePlatformAndroid


    return await _call('post', _path, _headers, _params, model_script)


## Update an Android platform by its unique ID. Use this endpoint to update the platform&#039;s name or application ID.[br]
##[br]
## Parameters:[br]
## - [param platform_id] [String]: Platform ID.[br]
## - [param xname] [String]: Platform name. Max length: 128 chars.[br]
## - [param application_id] [String]: Android application ID. Max length: 256 chars.[br]
##[br]
## Returns:[br]
## - [AppwritePlatformAndroid] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_android_platform(platform_id: String, xname: String, application_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/platforms/android/{platformId}'
    _path = _path.replace('{platformId}', platform_id.uri_encode())

    var _params := {}
    _params['name'] = xname
    _params['applicationId'] = application_id

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwritePlatformAndroid


    return await _call('put', _path, _headers, _params, model_script)


## Create a new Apple platform for your project. Use this endpoint to register a new Apple platform where your users will run your application which will interact with the Appwrite API.[br]
##[br]
## Parameters:[br]
## - [param platform_id] [String]: Platform ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Platform name. Max length: 128 chars.[br]
## - [param bundle_identifier] [String]: Apple bundle identifier. Max length: 256 chars.[br]
##[br]
## Returns:[br]
## - [AppwritePlatformApple] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_apple_platform(platform_id: String, xname: String, bundle_identifier: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/platforms/apple'

    var _params := {}
    _params['platformId'] = platform_id
    _params['name'] = xname
    _params['bundleIdentifier'] = bundle_identifier

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwritePlatformApple


    return await _call('post', _path, _headers, _params, model_script)


## Update an Apple platform by its unique ID. Use this endpoint to update the platform&#039;s name or bundle identifier.[br]
##[br]
## Parameters:[br]
## - [param platform_id] [String]: Platform ID.[br]
## - [param xname] [String]: Platform name. Max length: 128 chars.[br]
## - [param bundle_identifier] [String]: Apple bundle identifier. Max length: 256 chars.[br]
##[br]
## Returns:[br]
## - [AppwritePlatformApple] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_apple_platform(platform_id: String, xname: String, bundle_identifier: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/platforms/apple/{platformId}'
    _path = _path.replace('{platformId}', platform_id.uri_encode())

    var _params := {}
    _params['name'] = xname
    _params['bundleIdentifier'] = bundle_identifier

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwritePlatformApple


    return await _call('put', _path, _headers, _params, model_script)


## Create a new Linux platform for your project. Use this endpoint to register a new Linux platform where your users will run your application which will interact with the Appwrite API.[br]
##[br]
## Parameters:[br]
## - [param platform_id] [String]: Platform ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Platform name. Max length: 128 chars.[br]
## - [param package_name] [String]: Linux package name. Max length: 256 chars.[br]
##[br]
## Returns:[br]
## - [AppwritePlatformLinux] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_linux_platform(platform_id: String, xname: String, package_name: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/platforms/linux'

    var _params := {}
    _params['platformId'] = platform_id
    _params['name'] = xname
    _params['packageName'] = package_name

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwritePlatformLinux


    return await _call('post', _path, _headers, _params, model_script)


## Update a Linux platform by its unique ID. Use this endpoint to update the platform&#039;s name or package name.[br]
##[br]
## Parameters:[br]
## - [param platform_id] [String]: Platform ID.[br]
## - [param xname] [String]: Platform name. Max length: 128 chars.[br]
## - [param package_name] [String]: Linux package name. Max length: 256 chars.[br]
##[br]
## Returns:[br]
## - [AppwritePlatformLinux] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_linux_platform(platform_id: String, xname: String, package_name: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/platforms/linux/{platformId}'
    _path = _path.replace('{platformId}', platform_id.uri_encode())

    var _params := {}
    _params['name'] = xname
    _params['packageName'] = package_name

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwritePlatformLinux


    return await _call('put', _path, _headers, _params, model_script)


## Create a new web platform for your project. Use this endpoint to register a new platform where your users will run your application which will interact with the Appwrite API.[br]
##[br]
## Parameters:[br]
## - [param platform_id] [String]: Platform ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Platform name. Max length: 128 chars.[br]
## - [param hostname] [String]: Platform web hostname. Max length: 256 chars.[br]
##[br]
## Returns:[br]
## - [AppwritePlatformWeb] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_web_platform(platform_id: String, xname: String, hostname: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/platforms/web'

    var _params := {}
    _params['platformId'] = platform_id
    _params['name'] = xname
    _params['hostname'] = hostname

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwritePlatformWeb


    return await _call('post', _path, _headers, _params, model_script)


## Update a web platform by its unique ID. Use this endpoint to update the platform&#039;s name or hostname.[br]
##[br]
## Parameters:[br]
## - [param platform_id] [String]: Platform ID.[br]
## - [param xname] [String]: Platform name. Max length: 128 chars.[br]
## - [param hostname] [String]: Platform web hostname. Max length: 256 chars.[br]
##[br]
## Returns:[br]
## - [AppwritePlatformWeb] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_web_platform(platform_id: String, xname: String, hostname: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/platforms/web/{platformId}'
    _path = _path.replace('{platformId}', platform_id.uri_encode())

    var _params := {}
    _params['name'] = xname
    _params['hostname'] = hostname

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwritePlatformWeb


    return await _call('put', _path, _headers, _params, model_script)


## Create a new Windows platform for your project. Use this endpoint to register a new Windows platform where your users will run your application which will interact with the Appwrite API.[br]
##[br]
## Parameters:[br]
## - [param platform_id] [String]: Platform ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Platform name. Max length: 128 chars.[br]
## - [param package_identifier_name] [String]: Windows package identifier name. Max length: 256 chars.[br]
##[br]
## Returns:[br]
## - [AppwritePlatformWindows] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_windows_platform(platform_id: String, xname: String, package_identifier_name: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/platforms/windows'

    var _params := {}
    _params['platformId'] = platform_id
    _params['name'] = xname
    _params['packageIdentifierName'] = package_identifier_name

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwritePlatformWindows


    return await _call('post', _path, _headers, _params, model_script)


## Update a Windows platform by its unique ID. Use this endpoint to update the platform&#039;s name or package identifier name.[br]
##[br]
## Parameters:[br]
## - [param platform_id] [String]: Platform ID.[br]
## - [param xname] [String]: Platform name. Max length: 128 chars.[br]
## - [param package_identifier_name] [String]: Windows package identifier name. Max length: 256 chars.[br]
##[br]
## Returns:[br]
## - [AppwritePlatformWindows] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_windows_platform(platform_id: String, xname: String, package_identifier_name: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/platforms/windows/{platformId}'
    _path = _path.replace('{platformId}', platform_id.uri_encode())

    var _params := {}
    _params['name'] = xname
    _params['packageIdentifierName'] = package_identifier_name

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwritePlatformWindows


    return await _call('put', _path, _headers, _params, model_script)


## Get a platform by its unique ID. This endpoint returns the platform&#039;s details, including its name, type, and key configurations.[br]
##[br]
## Parameters:[br]
## - [param platform_id] [String]: Platform ID.[br]
##[br]
## Returns:[br]
## - [AppwritePlatformWeb] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_platform(platform_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/platforms/{platformId}'
    _path = _path.replace('{platformId}', platform_id.uri_encode())

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwritePlatformWeb


    return await _call('get', _path, _headers, _params, model_script)


## Delete a platform by its unique ID. This endpoint removes the platform and all its configurations from the project.[br]
##[br]
## Parameters:[br]
## - [param platform_id] [String]: Platform ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_platform(platform_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/platforms/{platformId}'
    _path = _path.replace('{platformId}', platform_id.uri_encode())

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null


    return await _call('delete', _path, _headers, _params, model_script)


## Get a list of all project policies and their current configuration.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Only supported methods are limit and offset[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwritePolicyList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_policies(queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/policies'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwritePolicyList


    return await _call('get', _path, _headers, _params, model_script)


## Configures if aliased emails such as subaddresses and emails with suffixes are denied during new users sign-ups and email updates.[br]
##[br]
## Parameters:[br]
## - [param enabled] [bool]: Set whether or not to block aliased emails during signup and email updates.[br]
##[br]
## Returns:[br]
## - [AppwriteProject] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_deny_aliased_email_policy(enabled: bool) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/policies/deny-aliased-email'

    var _params := {}
    _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteProject


    return await _call('patch', _path, _headers, _params, model_script)


## Configures if only corporate email addresses (non-free and non-disposable domains) are allowed during new user sign-ups and email updates.[br]
##[br]
## Parameters:[br]
## - [param enabled] [bool]: Set whether or not to restrict sign-ups and email updates to corporate email addresses only.[br]
##[br]
## Returns:[br]
## - [AppwriteProject] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_deny_corporate_email_policy(enabled: bool) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/policies/deny-corporate-email'

    var _params := {}
    _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteProject


    return await _call('patch', _path, _headers, _params, model_script)


## Configures if disposable emails from known temporary domains are denied during new users sign-ups and email updates.[br]
##[br]
## Parameters:[br]
## - [param enabled] [bool]: Set whether or not to block disposable email addresses during signup and email updates.[br]
##[br]
## Returns:[br]
## - [AppwriteProject] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_deny_disposable_email_policy(enabled: bool) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/policies/deny-disposable-email'

    var _params := {}
    _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteProject


    return await _call('patch', _path, _headers, _params, model_script)


## Configures if emails from free providers such as Gmail or Yahoo are denied during new users sign-ups and email updates.[br]
##[br]
## Parameters:[br]
## - [param enabled] [bool]: Set whether or not to block free email addresses during signup and email updates.[br]
##[br]
## Returns:[br]
## - [AppwriteProject] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_deny_free_email_policy(enabled: bool) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/policies/deny-free-email'

    var _params := {}
    _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteProject


    return await _call('patch', _path, _headers, _params, model_script)


## Updating this policy allows you to control if team members can see other members information. When enabled, all team members can see ID, name, email, phone number, and MFA status of other members..[br]
##[br]
## Parameters:[br]
## - [param user_id] [bool]: Set to true if you want make user ID visible to all team members, or false to hide it.[br]
## - [param user_email] [bool]: Set to true if you want make user email visible to all team members, or false to hide it.[br]
## - [param user_phone] [bool]: Set to true if you want make user phone number visible to all team members, or false to hide it.[br]
## - [param user_name] [bool]: Set to true if you want make user name visible to all team members, or false to hide it.[br]
## - [param user_mfa] [bool]: Set to true if you want make user MFA status visible to all team members, or false to hide it.[br]
## - [param user_accessed_at] [bool]: Set to true if you want make user last access time visible to all team members, or false to hide it.[br]
##[br]
## Returns:[br]
## - [AppwriteProject] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_membership_privacy_policy(user_id: Variant = null, user_email: Variant = null, user_phone: Variant = null, user_name: Variant = null, user_mfa: Variant = null, user_accessed_at: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if user_id != null and not user_id is bool:
        return AppwriteException.new("Invalid type for parameter 'user_id'. Expected bool.", 0, "argument_error", "")
    if user_email != null and not user_email is bool:
        return AppwriteException.new("Invalid type for parameter 'user_email'. Expected bool.", 0, "argument_error", "")
    if user_phone != null and not user_phone is bool:
        return AppwriteException.new("Invalid type for parameter 'user_phone'. Expected bool.", 0, "argument_error", "")
    if user_name != null and not user_name is bool:
        return AppwriteException.new("Invalid type for parameter 'user_name'. Expected bool.", 0, "argument_error", "")
    if user_mfa != null and not user_mfa is bool:
        return AppwriteException.new("Invalid type for parameter 'user_mfa'. Expected bool.", 0, "argument_error", "")
    if user_accessed_at != null and not user_accessed_at is bool:
        return AppwriteException.new("Invalid type for parameter 'user_accessed_at'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/policies/membership-privacy'

    var _params := {}
    if user_id != null:
        _params['userId'] = user_id
    if user_email != null:
        _params['userEmail'] = user_email
    if user_phone != null:
        _params['userPhone'] = user_phone
    if user_name != null:
        _params['userName'] = user_name
    if user_mfa != null:
        _params['userMFA'] = user_mfa
    if user_accessed_at != null:
        _params['userAccessedAt'] = user_accessed_at

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteProject


    return await _call('patch', _path, _headers, _params, model_script)


## Updating this policy allows you to control if new passwords are checked against most common passwords dictionary. When enabled, and user changes their password, password must not be contained in the dictionary.[br]
##[br]
## Parameters:[br]
## - [param enabled] [bool]: Toggle password dictionary policy. Set to true if you want password change to block passwords in the dictionary, or false to allow them. When changing this policy, existing passwords remain valid.[br]
##[br]
## Returns:[br]
## - [AppwriteProject] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_password_dictionary_policy(enabled: bool) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/policies/password-dictionary'

    var _params := {}
    _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteProject


    return await _call('patch', _path, _headers, _params, model_script)


## Updates one of password strength policies. Based on total length configured, previous password hashes are stored, and users cannot choose a new password that is already stored in the passwird history list, when updating an user password, or setting new one through password recovery.[br]
##[br]
##Keep in mind, while password history policy is disabled, the history is not being stored. Enabling the policy will not have any history on existing users, and it will only start to collect and enforce the policy on password changes since the policy is enabled.[br]
##[br]
## Parameters:[br]
## - [param total] [int]: Set the password history length per user. Value can be between 1 and 5000, or null to disable the limit.[br]
##[br]
## Returns:[br]
## - [AppwriteProject] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_password_history_policy(total: int) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/policies/password-history'

    var _params := {}
    _params['total'] = total

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteProject


    return await _call('patch', _path, _headers, _params, model_script)


## Updating this policy allows you to control if password strength is checked against personal data. When enabled, and user sets or changes their password, the password must not contain user ID, name, email or phone number.[br]
##[br]
## Parameters:[br]
## - [param enabled] [bool]: Toggle password personal data policy. Set to true if you want to block passwords including user&#039;s personal data, or false to allow it. When changing this policy, existing passwords remain valid.[br]
##[br]
## Returns:[br]
## - [AppwriteProject] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_password_personal_data_policy(enabled: bool) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/policies/password-personal-data'

    var _params := {}
    _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteProject


    return await _call('patch', _path, _headers, _params, model_script)


## Update the password strength requirements for users in the project.[br]
##[br]
## Parameters:[br]
## - [param min] [int]: Minimum password length. Value must be between 8 and 256. Default is 8.[br]
## - [param uppercase] [bool]: Whether passwords must include at least one uppercase letter.[br]
## - [param lowercase] [bool]: Whether passwords must include at least one lowercase letter.[br]
## - [param number] [bool]: Whether passwords must include at least one number.[br]
## - [param symbols] [bool]: Whether passwords must include at least one symbol.[br]
##[br]
## Returns:[br]
## - [AppwritePolicyPasswordStrength] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_password_strength_policy(min: Variant = null, uppercase: Variant = null, lowercase: Variant = null, number: Variant = null, symbols: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if min != null and not min is int:
        return AppwriteException.new("Invalid type for parameter 'min'. Expected int.", 0, "argument_error", "")
    if uppercase != null and not uppercase is bool:
        return AppwriteException.new("Invalid type for parameter 'uppercase'. Expected bool.", 0, "argument_error", "")
    if lowercase != null and not lowercase is bool:
        return AppwriteException.new("Invalid type for parameter 'lowercase'. Expected bool.", 0, "argument_error", "")
    if number != null and not number is bool:
        return AppwriteException.new("Invalid type for parameter 'number'. Expected bool.", 0, "argument_error", "")
    if symbols != null and not symbols is bool:
        return AppwriteException.new("Invalid type for parameter 'symbols'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/policies/password-strength'

    var _params := {}
    if min != null:
        _params['min'] = min
    if uppercase != null:
        _params['uppercase'] = uppercase
    if lowercase != null:
        _params['lowercase'] = lowercase
    if number != null:
        _params['number'] = number
    if symbols != null:
        _params['symbols'] = symbols

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwritePolicyPasswordStrength


    return await _call('patch', _path, _headers, _params, model_script)


## Updating this policy allows you to control if email alert is sent upon session creation. When enabled, and user signs into their account, they will be sent an email notification. There is an exception, the first session after a new sign up does not trigger an alert, even if the policy is enabled.[br]
##[br]
## Parameters:[br]
## - [param enabled] [bool]: Toggle session alert policy. Set to true if you want users to receive email notifications when a sessions are created for their users, or false to not send email alerts.[br]
##[br]
## Returns:[br]
## - [AppwriteProject] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_session_alert_policy(enabled: bool) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/policies/session-alert'

    var _params := {}
    _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteProject


    return await _call('patch', _path, _headers, _params, model_script)


## Update maximum duration how long sessions created within a project should stay active for.[br]
##[br]
## Parameters:[br]
## - [param duration] [int]: Maximum session length in seconds. Minium allowed value is 5 second, and maximum is 1 year, which is 31536000 seconds.[br]
##[br]
## Returns:[br]
## - [AppwriteProject] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_session_duration_policy(duration: int) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/policies/session-duration'

    var _params := {}
    _params['duration'] = duration

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteProject


    return await _call('patch', _path, _headers, _params, model_script)


## Updating this policy allows you to control if existing sessions should be invalidated when a password of a user is changed. When enabled, and user changes their password, they will be logged out of all their devices.[br]
##[br]
## Parameters:[br]
## - [param enabled] [bool]: Toggle session invalidation policy. Set to true if you want password change to invalidate all sessions of an user, or false to keep sessions active.[br]
##[br]
## Returns:[br]
## - [AppwriteProject] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_session_invalidation_policy(enabled: bool) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/policies/session-invalidation'

    var _params := {}
    _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteProject


    return await _call('patch', _path, _headers, _params, model_script)


## Update the maximum number of sessions allowed per user. When the limit is hit, the oldest session will be deleted to make room for new one.[br]
##[br]
## Parameters:[br]
## - [param total] [int]: Set the maximum number of sessions allowed per user. Value can be between 1 and 5000, or null to disable the limit.[br]
##[br]
## Returns:[br]
## - [AppwriteProject] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_session_limit_policy(total: int) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/policies/session-limit'

    var _params := {}
    _params['total'] = total

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteProject


    return await _call('patch', _path, _headers, _params, model_script)


## Update the maximum number of users in the project. When the limit is hit or amount of existing users already exceeded the limit, all users remain active, but new user sign up will be prohibited.[br]
##[br]
## Parameters:[br]
## - [param total] [int]: Set the maximum number of users allowed in the project. Value can be between 1 and 5000, or null to disable the limit.[br]
##[br]
## Returns:[br]
## - [AppwriteProject] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_user_limit_policy(total: int) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/policies/user-limit'

    var _params := {}
    _params['total'] = total

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteProject


    return await _call('patch', _path, _headers, _params, model_script)


## Get a policy by its unique ID. This endpoint returns the current configuration for the requested project policy.[br]
##[br]
## Parameters:[br]
## - [param policy_id] [String]: Policy ID. Can be one of: password-dictionary, password-history, password-strength, password-personal-data, session-alert, session-duration, session-invalidation, session-limit, user-limit, membership-privacy, deny-aliased-email, deny-disposable-email, deny-free-email, deny-corporate-email.[br]
##[br]
## Returns:[br]
## - [AppwritePolicyPasswordDictionary] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_policy(policy_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/policies/{policyId}'
    _path = _path.replace('{policyId}', policy_id.uri_encode())

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwritePolicyPasswordDictionary


    return await _call('get', _path, _headers, _params, model_script)


## Update properties of a specific protocol. Use this endpoint to enable or disable a protocol in your project. [br]
##[br]
## Parameters:[br]
## - [param protocol_id] [String]: Protocol name. Can be one of: rest, graphql, websocket[br]
## - [param enabled] [bool]: Protocol status.[br]
##[br]
## Returns:[br]
## - [AppwriteProject] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_protocol(protocol_id: String, enabled: bool) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/protocols/{protocolId}'
    _path = _path.replace('{protocolId}', protocol_id.uri_encode())

    var _params := {}
    _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteProject


    return await _call('patch', _path, _headers, _params, model_script)


## Update properties of a specific service. Use this endpoint to enable or disable a service in your project. [br]
##[br]
## Parameters:[br]
## - [param service_id] [String]: Service name. Can be one of: account, avatars, databases, tablesdb, locale, health, project, storage, teams, users, vcs, sites, functions, proxy, graphql, migrations, messaging, advisor, oauth2[br]
## - [param enabled] [bool]: Service status.[br]
##[br]
## Returns:[br]
## - [AppwriteProject] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_service(service_id: String, enabled: bool) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/services/{serviceId}'
    _path = _path.replace('{serviceId}', service_id.uri_encode())

    var _params := {}
    _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteProject


    return await _call('patch', _path, _headers, _params, model_script)


## Update the SMTP configuration for your project. Use this endpoint to configure your project&#039;s SMTP provider with your custom settings for sending transactional emails.[br]
##[br]
## Parameters:[br]
## - [param host] [String]: SMTP server hostname (domain)[br]
## - [param port] [int]: SMTP server port[br]
## - [param username] [String]: SMTP server username. Pass an empty string to clear a previously set value.[br]
## - [param password] [String]: SMTP server password. Pass an empty string to clear a previously set value. This property is stored securely and cannot be read in future (write-only).[br]
## - [param sender_email] [String]: Email address shown in inbox as the sender of the email. Pass an empty string to clear a previously set value.[br]
## - [param sender_name] [String]: Name shown in inbox as the sender of the email. Pass an empty string to clear a previously set value.[br]
## - [param reply_to_email] [String]: Email used when user replies to the email. Pass an empty string to clear a previously set value.[br]
## - [param reply_to_name] [String]: Name used when user replies to the email. Pass an empty string to clear a previously set value.[br]
## - [param secure] [String]: Configures if communication with SMTP server is encrypted. Allowed values are: tls, ssl. Leave empty for no encryption.[br]
## - [param enabled] [bool]: Enable or disable custom SMTP. Custom SMTP is useful for branding purposes, but also allows use of custom email templates.[br]
##[br]
## Returns:[br]
## - [AppwriteProject] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_smtp(host: Variant = null, port: Variant = null, username: Variant = null, password: Variant = null, sender_email: Variant = null, sender_name: Variant = null, reply_to_email: Variant = null, reply_to_name: Variant = null, secure: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if host != null and not host is String:
        return AppwriteException.new("Invalid type for parameter 'host'. Expected String.", 0, "argument_error", "")
    if port != null and not port is int:
        return AppwriteException.new("Invalid type for parameter 'port'. Expected int.", 0, "argument_error", "")
    if username != null and not username is String:
        return AppwriteException.new("Invalid type for parameter 'username'. Expected String.", 0, "argument_error", "")
    if password != null and not password is String:
        return AppwriteException.new("Invalid type for parameter 'password'. Expected String.", 0, "argument_error", "")
    if sender_email != null and not sender_email is String:
        return AppwriteException.new("Invalid type for parameter 'sender_email'. Expected String.", 0, "argument_error", "")
    if sender_name != null and not sender_name is String:
        return AppwriteException.new("Invalid type for parameter 'sender_name'. Expected String.", 0, "argument_error", "")
    if reply_to_email != null and not reply_to_email is String:
        return AppwriteException.new("Invalid type for parameter 'reply_to_email'. Expected String.", 0, "argument_error", "")
    if reply_to_name != null and not reply_to_name is String:
        return AppwriteException.new("Invalid type for parameter 'reply_to_name'. Expected String.", 0, "argument_error", "")
    if secure != null and not secure is String:
        return AppwriteException.new("Invalid type for parameter 'secure'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/smtp'

    var _params := {}
    if host != null:
        _params['host'] = host
    if port != null:
        _params['port'] = port
    if username != null:
        _params['username'] = username
    if password != null:
        _params['password'] = password
    if sender_email != null:
        _params['senderEmail'] = sender_email
    if sender_name != null:
        _params['senderName'] = sender_name
    if reply_to_email != null:
        _params['replyToEmail'] = reply_to_email
    if reply_to_name != null:
        _params['replyToName'] = reply_to_name
    if secure != null:
        _params['secure'] = secure
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteProject


    return await _call('patch', _path, _headers, _params, model_script)


## Send a test email to verify SMTP configuration. [br]
##[br]
## Parameters:[br]
## - [param emails] [Array]: Array of emails to send test email to. Maximum of 10 emails are allowed.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_smtp_test(emails: Array) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/smtp/tests'

    var _params := {}
    _params['emails'] = emails

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null


    return await _call('post', _path, _headers, _params, model_script)


## Get a list of all custom email templates configured for the project. This endpoint returns an array of all configured email templates and their locales.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Only supported methods are limit and offset[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteEmailTemplateList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_email_templates(queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/templates/email'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteEmailTemplateList


    return await _call('get', _path, _headers, _params, model_script)


## Update a custom email template for the specified locale and type. Use this endpoint to modify the content of your email templates.[br]
##[br]
## Parameters:[br]
## - [param template_id] [String]: Custom email template type. Can be one of: verification, magicSession, recovery, invitation, mfaChallenge, sessionAlert, otpSession[br]
## - [param locale] [String]: Custom email template locale. If left empty, the fallback locale (en) will be used.[br]
## - [param subject] [String]: Subject of the email template. Can be up to 255 characters.[br]
## - [param message] [String]: Plain or HTML body of the email template message. Can be up to 10MB of content.[br]
## - [param sender_name] [String]: Name of the email sender.[br]
## - [param sender_email] [String]: Email of the sender. Pass an empty string to clear a previously set value.[br]
## - [param reply_to_email] [String]: Reply to email. Pass an empty string to clear a previously set value.[br]
## - [param reply_to_name] [String]: Reply to name.[br]
##[br]
## Returns:[br]
## - [AppwriteEmailTemplate] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_email_template(template_id: String, locale: Variant = null, subject: Variant = null, message: Variant = null, sender_name: Variant = null, sender_email: Variant = null, reply_to_email: Variant = null, reply_to_name: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if locale != null and not locale is String:
        return AppwriteException.new("Invalid type for parameter 'locale'. Expected String.", 0, "argument_error", "")
    if subject != null and not subject is String:
        return AppwriteException.new("Invalid type for parameter 'subject'. Expected String.", 0, "argument_error", "")
    if message != null and not message is String:
        return AppwriteException.new("Invalid type for parameter 'message'. Expected String.", 0, "argument_error", "")
    if sender_name != null and not sender_name is String:
        return AppwriteException.new("Invalid type for parameter 'sender_name'. Expected String.", 0, "argument_error", "")
    if sender_email != null and not sender_email is String:
        return AppwriteException.new("Invalid type for parameter 'sender_email'. Expected String.", 0, "argument_error", "")
    if reply_to_email != null and not reply_to_email is String:
        return AppwriteException.new("Invalid type for parameter 'reply_to_email'. Expected String.", 0, "argument_error", "")
    if reply_to_name != null and not reply_to_name is String:
        return AppwriteException.new("Invalid type for parameter 'reply_to_name'. Expected String.", 0, "argument_error", "")

    var _path := '/project/templates/email'

    var _params := {}
    _params['templateId'] = template_id
    if locale != null:
        _params['locale'] = locale
    if subject != null:
        _params['subject'] = subject
    if message != null:
        _params['message'] = message
    if sender_name != null:
        _params['senderName'] = sender_name
    if sender_email != null:
        _params['senderEmail'] = sender_email
    if reply_to_email != null:
        _params['replyToEmail'] = reply_to_email
    if reply_to_name != null:
        _params['replyToName'] = reply_to_name

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteEmailTemplate


    return await _call('patch', _path, _headers, _params, model_script)


## Get a custom email template for the specified locale and type. This endpoint returns the template content, subject, and other configuration details.[br]
##[br]
## Parameters:[br]
## - [param template_id] [String]: Custom email template type. Can be one of: verification, magicSession, recovery, invitation, mfaChallenge, sessionAlert, otpSession[br]
## - [param locale] [String]: Custom email template locale. If left empty, the fallback locale (en) will be used.[br]
##[br]
## Returns:[br]
## - [AppwriteEmailTemplate] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_email_template(template_id: String, locale: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if locale != null and not locale is String:
        return AppwriteException.new("Invalid type for parameter 'locale'. Expected String.", 0, "argument_error", "")

    var _path := '/project/templates/email/{templateId}'
    _path = _path.replace('{templateId}', template_id.uri_encode())

    var _params := {}
    if locale != null:
        _params['locale'] = locale

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteEmailTemplate


    return await _call('get', _path, _headers, _params, model_script)


## Get a list of all project environment variables.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: key, resourceType, resourceId, secret[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteVariableList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_variables(queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/variables'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteVariableList


    return await _call('get', _path, _headers, _params, model_script)


## Create a new project environment variable. These variables can be accessed by all functions and sites in the project.[br]
##[br]
## Parameters:[br]
## - [param variable_id] [String]: Variable unique ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param key] [String]: Variable key. Max length: 255 chars.[br]
## - [param value] [String]: Variable value. Max length: 8192 chars.[br]
## - [param secret] [bool]: Secret variables can be updated or deleted, but only projects can read them during build and runtime.[br]
##[br]
## Returns:[br]
## - [AppwriteVariable] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_variable(variable_id: String, key: String, value: String, secret: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if secret != null and not secret is bool:
        return AppwriteException.new("Invalid type for parameter 'secret'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/variables'

    var _params := {}
    _params['variableId'] = variable_id
    _params['key'] = key
    _params['value'] = value
    if secret != null:
        _params['secret'] = secret

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteVariable


    return await _call('post', _path, _headers, _params, model_script)


## Get a variable by its unique ID. [br]
##[br]
## Parameters:[br]
## - [param variable_id] [String]: Variable unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteVariable] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_variable(variable_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/variables/{variableId}'
    _path = _path.replace('{variableId}', variable_id.uri_encode())

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteVariable


    return await _call('get', _path, _headers, _params, model_script)


## Update variable by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param variable_id] [String]: Variable unique ID.[br]
## - [param key] [String]: Variable key. Max length: 255 chars.[br]
## - [param value] [String]: Variable value. Max length: 8192 chars.[br]
## - [param secret] [bool]: Secret variables can be updated or deleted, but only projects can read them during build and runtime.[br]
##[br]
## Returns:[br]
## - [AppwriteVariable] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_variable(variable_id: String, key: Variant = null, value: Variant = null, secret: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if key != null and not key is String:
        return AppwriteException.new("Invalid type for parameter 'key'. Expected String.", 0, "argument_error", "")
    if value != null and not value is String:
        return AppwriteException.new("Invalid type for parameter 'value'. Expected String.", 0, "argument_error", "")
    if secret != null and not secret is bool:
        return AppwriteException.new("Invalid type for parameter 'secret'. Expected bool.", 0, "argument_error", "")

    var _path := '/project/variables/{variableId}'
    _path = _path.replace('{variableId}', variable_id.uri_encode())

    var _params := {}
    if key != null:
        _params['key'] = key
    if value != null:
        _params['value'] = value
    if secret != null:
        _params['secret'] = secret

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteVariable


    return await _call('put', _path, _headers, _params, model_script)


## Delete a variable by its unique ID. [br]
##[br]
## Parameters:[br]
## - [param variable_id] [String]: Variable unique ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_variable(variable_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/project/variables/{variableId}'
    _path = _path.replace('{variableId}', variable_id.uri_encode())

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null


    return await _call('delete', _path, _headers, _params, model_script)

