extends "../utils/service.gd"
## The Account service allows you to authenticate and manage a user account.


## Get the currently logged in user.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func xget() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account'

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteUser

    return await _call('get', _path, _headers, _params, model_script)


## Use this endpoint to allow a new user to register a new account in your project. After the user registration completes successfully, you can use the [/account/verfication](https://appwrite.io/docs/references/cloud/client-web/account#createVerification) route to start verifying the user email address. To allow the new user to login to their new account, you need to create a new [account session](https://appwrite.io/docs/references/cloud/client-web/account#createEmailSession).[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param email] [String]: User email.[br]
## - [param password] [String]: New user password. Must be between 8 and 256 chars.[br]
## - [param xname] [String]: User name. Max length: 128 chars.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create(user_id: String, email: String, password: String, xname: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")

    var _path := '/account'

    var _params := {}
    _params['userId'] = user_id
    _params['email'] = email
    _params['password'] = password
    if xname != null:
        _params['name'] = xname

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteUser

    return await _call('post', _path, _headers, _params, model_script)


## Delete the currently logged in user.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account'

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## List all billing addresses for a user.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/databases#querying-documents). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: userId, expired, failed[br]
##[br]
## Returns:[br]
## - [AppwriteBillingAddressList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_billing_addresses(queries: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")

    var _path := '/account/billing-addresses'

    var _params := {}
    if queries != null:
        _params['queries'] = queries

    var _headers := {
    }

    var model_script = AppwriteBillingAddressList

    return await _call('get', _path, _headers, _params, model_script)


## Add a new billing address to a user&#039;s account.[br]
##[br]
## Parameters:[br]
## - [param country] [String]: Country[br]
## - [param city] [String]: City[br]
## - [param street_address] [String]: Street address[br]
## - [param address_line2] [String]: Address line 2[br]
## - [param state] [String]: State or province[br]
## - [param postal_code] [String]: Postal code[br]
##[br]
## Returns:[br]
## - [AppwriteBillingAddress] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_billing_address(country: String, city: String, street_address: String, address_line2: Variant = null, state: Variant = null, postal_code: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if address_line2 != null and not address_line2 is String:
        return AppwriteException.new("Invalid type for parameter 'address_line2'. Expected String.", 0, "argument_error", "")
    if state != null and not state is String:
        return AppwriteException.new("Invalid type for parameter 'state'. Expected String.", 0, "argument_error", "")
    if postal_code != null and not postal_code is String:
        return AppwriteException.new("Invalid type for parameter 'postal_code'. Expected String.", 0, "argument_error", "")

    var _path := '/account/billing-addresses'

    var _params := {}
    _params['country'] = country
    _params['city'] = city
    _params['streetAddress'] = street_address
    if address_line2 != null:
        _params['addressLine2'] = address_line2
    if state != null:
        _params['state'] = state
    if postal_code != null:
        _params['postalCode'] = postal_code

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteBillingAddress

    return await _call('post', _path, _headers, _params, model_script)


## Get a specific billing address for a user using it&#039;s ID.[br]
##[br]
## Parameters:[br]
## - [param billing_address_id] [String]: Unique ID of billing address[br]
##[br]
## Returns:[br]
## - [AppwriteBillingAddress] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_billing_address(billing_address_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/billing-addresses/{billingAddressId}'
    _path = _path.replace('{billingAddressId}', str(billing_address_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteBillingAddress

    return await _call('get', _path, _headers, _params, model_script)


## Update a specific billing address using it&#039;s ID.[br]
##[br]
## Parameters:[br]
## - [param billing_address_id] [String]: Unique ID of billing address[br]
## - [param country] [String]: Country[br]
## - [param city] [String]: City[br]
## - [param street_address] [String]: Street address[br]
## - [param address_line2] [String]: Address line 2[br]
## - [param state] [String]: State or province[br]
## - [param postal_code] [String]: Postal code[br]
##[br]
## Returns:[br]
## - [AppwriteBillingAddress] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_billing_address(billing_address_id: String, country: String, city: String, street_address: String, address_line2: Variant = null, state: Variant = null, postal_code: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if address_line2 != null and not address_line2 is String:
        return AppwriteException.new("Invalid type for parameter 'address_line2'. Expected String.", 0, "argument_error", "")
    if state != null and not state is String:
        return AppwriteException.new("Invalid type for parameter 'state'. Expected String.", 0, "argument_error", "")
    if postal_code != null and not postal_code is String:
        return AppwriteException.new("Invalid type for parameter 'postal_code'. Expected String.", 0, "argument_error", "")

    var _path := '/account/billing-addresses/{billingAddressId}'
    _path = _path.replace('{billingAddressId}', str(billing_address_id))

    var _params := {}
    _params['country'] = country
    _params['city'] = city
    _params['streetAddress'] = street_address
    if address_line2 != null:
        _params['addressLine2'] = address_line2
    if state != null:
        _params['state'] = state
    if postal_code != null:
        _params['postalCode'] = postal_code

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteBillingAddress

    return await _call('put', _path, _headers, _params, model_script)


## Delete a specific billing address using it&#039;s ID.[br]
##[br]
## Parameters:[br]
## - [param billing_address_id] [String]: Billing address unique ID[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_billing_address(billing_address_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/billing-addresses/{billingAddressId}'
    _path = _path.replace('{billingAddressId}', str(billing_address_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Get coupon details for an account.[br]
##[br]
## Parameters:[br]
## - [param coupon_id] [String]: ID of the coupon[br]
##[br]
## Returns:[br]
## - [AppwriteCoupon] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_coupon(coupon_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/coupons/{couponId}'
    _path = _path.replace('{couponId}', str(coupon_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteCoupon

    return await _call('get', _path, _headers, _params, model_script)


## Update currently logged in user account email address. After changing user address, the user confirmation status will get reset. A new confirmation email is not sent automatically however you can use the send confirmation email endpoint again to send the confirmation email. For security measures, user password is required to complete this request.[br]
##This endpoint can also be used to convert an anonymous account to a normal one, by passing an email address and a new password.[br]
##[br]
##[br]
## Parameters:[br]
## - [param email] [String]: User email.[br]
## - [param password] [String]: User password. Must be at least 8 chars.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_email(email: String, password: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/email'

    var _params := {}
    _params['email'] = email
    _params['password'] = password

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteUser

    return await _call('patch', _path, _headers, _params, model_script)


## Get the list of identities for the currently logged in user.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: userId, provider, providerUid, providerEmail, providerAccessTokenExpiry[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteIdentityList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_identities(queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/account/identities'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
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

    var _path := '/account/identities/{identityId}'
    _path = _path.replace('{identityId}', str(identity_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## List all invoices tied to an account.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/databases#querying-documents). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: teamId, aggregationId, type, amount, currency, from, to, dueAt, attempts, status, grossAmount[br]
##[br]
## Returns:[br]
## - [AppwriteInvoiceList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_invoices(queries: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")

    var _path := '/account/invoices'

    var _params := {}
    if queries != null:
        _params['queries'] = queries

    var _headers := {
    }

    var model_script = AppwriteInvoiceList

    return await _call('get', _path, _headers, _params, model_script)


## Use this endpoint to create a JSON Web Token. You can use the resulting JWT to authenticate on behalf of the current user when working with the Appwrite server-side API and SDKs. The JWT secret is valid for 15 minutes from its creation and will be invalid if the user will logout in that time frame.[br]
##[br]
## Parameters:[br]
## - [param duration] [int]: Time in seconds before JWT expires. Default duration is 900 seconds, and maximum is 3600 seconds.[br]
##[br]
## Returns:[br]
## - [AppwriteJwt] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_jwt(duration: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if duration != null and not duration is int:
        return AppwriteException.new("Invalid type for parameter 'duration'. Expected int.", 0, "argument_error", "")

    var _path := '/account/jwts'

    var _params := {}
    if duration != null:
        _params['duration'] = duration

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteJwt

    return await _call('post', _path, _headers, _params, model_script)


## Get a list of all API keys from the current account.[br]
##[br]
## Parameters:[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteKeyList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_keys(total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/account/keys'

    var _params := {}
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteKeyList

    return await _call('get', _path, _headers, _params, model_script)


## Create a new account API key.[br]
##[br]
## Parameters:[br]
## - [param xname] [String]: Key name. Max length: 128 chars.[br]
## - [param scopes] [Array[String]]: Key scopes list. Maximum of 100 scopes are allowed.[br]
## - [param expire] [String]: Expiration time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. Use null for unlimited expiration.[br]
##[br]
## Returns:[br]
## - [AppwriteKey] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_key(xname: String, scopes: Array[String], expire: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if expire != null and not expire is String:
        return AppwriteException.new("Invalid type for parameter 'expire'. Expected String.", 0, "argument_error", "")

    var _path := '/account/keys'

    var _params := {}
    _params['name'] = xname
    _params['scopes'] = scopes
    if expire != null:
        _params['expire'] = expire

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteKey

    return await _call('post', _path, _headers, _params, model_script)


## Get a key by its unique ID. This endpoint returns details about a specific API key in your account including it&#039;s scopes.[br]
##[br]
## Parameters:[br]
## - [param key_id] [String]: Key unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteKey] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_key(key_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/keys/{keyId}'
    _path = _path.replace('{keyId}', str(key_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteKey

    return await _call('get', _path, _headers, _params, model_script)


## Update a key by its unique ID. Use this endpoint to update the name, scopes, or expiration time of an API key.[br]
##[br]
## Parameters:[br]
## - [param key_id] [String]: Key unique ID.[br]
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

    var _path := '/account/keys/{keyId}'
    _path = _path.replace('{keyId}', str(key_id))

    var _params := {}
    _params['name'] = xname
    _params['scopes'] = scopes
    if expire != null:
        _params['expire'] = expire

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteKey

    return await _call('put', _path, _headers, _params, model_script)


## Delete a key by its unique ID. Once deleted, the key can no longer be used to authenticate API calls.[br]
##[br]
## Parameters:[br]
## - [param key_id] [String]: Key unique ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_key(key_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/keys/{keyId}'
    _path = _path.replace('{keyId}', str(key_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Get the list of latest security activity logs for the currently logged in user. Each log returns user IP address, location and date and time of log.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Only supported methods are limit and offset[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteLogList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_logs(queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/account/logs'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteLogList

    return await _call('get', _path, _headers, _params, model_script)


## Enable or disable MFA on an account.[br]
##[br]
## Parameters:[br]
## - [param mfa] [bool]: Enable or disable MFA.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_mfa(mfa: bool) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/mfa'

    var _params := {}
    _params['mfa'] = mfa

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteUser

    return await _call('patch', _path, _headers, _params, model_script)


## Add an authenticator app to be used as an MFA factor. Verify the authenticator using the [verify authenticator](/docs/references/cloud/client-web/account#updateMfaAuthenticator) method.[br]
##[br]
## Parameters:[br]
## - [param xtype] [String]: Type of authenticator. Must be `totp`[br]
##[br]
## Returns:[br]
## - [AppwriteMfaType] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_mfa_authenticator(xtype: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/mfa/authenticators/{type}'
    _path = _path.replace('{type}', str(xtype))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteMfaType

    return await _call('post', _path, _headers, _params, model_script)


## Verify an authenticator app after adding it using the [add authenticator](/docs/references/cloud/client-web/account#createMfaAuthenticator) method.[br]
##[br]
## Parameters:[br]
## - [param xtype] [String]: Type of authenticator.[br]
## - [param otp] [String]: Valid verification token.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_mfa_authenticator(xtype: String, otp: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/mfa/authenticators/{type}'
    _path = _path.replace('{type}', str(xtype))

    var _params := {}
    _params['otp'] = otp

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteUser

    return await _call('put', _path, _headers, _params, model_script)


## Delete an authenticator for a user by ID.[br]
##[br]
## Parameters:[br]
## - [param xtype] [String]: Type of authenticator.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_mfa_authenticator(xtype: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/mfa/authenticators/{type}'
    _path = _path.replace('{type}', str(xtype))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Begin the process of MFA verification after sign-in. Finish the flow with [updateMfaChallenge](/docs/references/cloud/client-web/account#updateMfaChallenge) method.[br]
##[br]
## Parameters:[br]
## - [param factor] [String]: Factor used for verification. Must be one of following: `email`, `phone`, `totp`, `recoveryCode`.[br]
##[br]
## Returns:[br]
## - [AppwriteMfaChallenge] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_mfa_challenge(factor: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/mfa/challenges'

    var _params := {}
    _params['factor'] = factor

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteMfaChallenge

    return await _call('post', _path, _headers, _params, model_script)


## Complete the MFA challenge by providing the one-time password. Finish the process of MFA verification by providing the one-time password. To begin the flow, use [createMfaChallenge](/docs/references/cloud/client-web/account#createMfaChallenge) method.[br]
##[br]
## Parameters:[br]
## - [param challenge_id] [String]: ID of the challenge.[br]
## - [param otp] [String]: Valid verification token.[br]
##[br]
## Returns:[br]
## - [AppwriteSession] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_mfa_challenge(challenge_id: String, otp: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/mfa/challenges'

    var _params := {}
    _params['challengeId'] = challenge_id
    _params['otp'] = otp

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteSession

    return await _call('put', _path, _headers, _params, model_script)


## List the factors available on the account to be used as a MFA challange.[br]
##[br]
## Returns:[br]
## - [AppwriteMfaFactors] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_mfa_factors() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/mfa/factors'

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteMfaFactors

    return await _call('get', _path, _headers, _params, model_script)


## Get recovery codes that can be used as backup for MFA flow. Before getting codes, they must be generated using [createMfaRecoveryCodes](/docs/references/cloud/client-web/account#createMfaRecoveryCodes) method. An OTP challenge is required to read recovery codes.[br]
##[br]
## Returns:[br]
## - [AppwriteMfaRecoveryCodes] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_mfa_recovery_codes() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/mfa/recovery-codes'

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteMfaRecoveryCodes

    return await _call('get', _path, _headers, _params, model_script)


## Generate recovery codes as backup for MFA flow. It&#039;s recommended to generate and show then immediately after user successfully adds their authehticator. Recovery codes can be used as a MFA verification type in [createMfaChallenge](/docs/references/cloud/client-web/account#createMfaChallenge) method.[br]
##[br]
## Returns:[br]
## - [AppwriteMfaRecoveryCodes] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_mfa_recovery_codes() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/mfa/recovery-codes'

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteMfaRecoveryCodes

    return await _call('post', _path, _headers, _params, model_script)


## Regenerate recovery codes that can be used as backup for MFA flow. Before regenerating codes, they must be first generated using [createMfaRecoveryCodes](/docs/references/cloud/client-web/account#createMfaRecoveryCodes) method. An OTP challenge is required to regenreate recovery codes.[br]
##[br]
## Returns:[br]
## - [AppwriteMfaRecoveryCodes] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_mfa_recovery_codes() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/mfa/recovery-codes'

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteMfaRecoveryCodes

    return await _call('patch', _path, _headers, _params, model_script)


## Update currently logged in user account name.[br]
##[br]
## Parameters:[br]
## - [param xname] [String]: User name. Max length: 128 chars.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_name(xname: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/name'

    var _params := {}
    _params['name'] = xname

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteUser

    return await _call('patch', _path, _headers, _params, model_script)


## Update currently logged in user password. For validation, user is required to pass in the new password, and the old password. For users created with OAuth, Team Invites and Magic URL, oldPassword is optional.[br]
##[br]
## Parameters:[br]
## - [param password] [String]: New user password. Must be at least 8 chars.[br]
## - [param old_password] [String]: Current user password. Must be at least 8 chars.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_password(password: String, old_password: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if old_password != null and not old_password is String:
        return AppwriteException.new("Invalid type for parameter 'old_password'. Expected String.", 0, "argument_error", "")

    var _path := '/account/password'

    var _params := {}
    _params['password'] = password
    if old_password != null:
        _params['oldPassword'] = old_password

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteUser

    return await _call('patch', _path, _headers, _params, model_script)


## List payment methods for this account.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/databases#querying-documents). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: userId, expired, failed[br]
##[br]
## Returns:[br]
## - [AppwritePaymentMethodList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_payment_methods(queries: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")

    var _path := '/account/payment-methods'

    var _params := {}
    if queries != null:
        _params['queries'] = queries

    var _headers := {
    }

    var model_script = AppwritePaymentMethodList

    return await _call('get', _path, _headers, _params, model_script)


## Create a new payment method for the current user account.[br]
##[br]
## Returns:[br]
## - [AppwritePaymentMethod] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_payment_method() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/payment-methods'

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwritePaymentMethod

    return await _call('post', _path, _headers, _params, model_script)


## Get a specific payment method for the user.[br]
##[br]
## Parameters:[br]
## - [param payment_method_id] [String]: Unique ID of payment method[br]
##[br]
## Returns:[br]
## - [AppwritePaymentMethod] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_payment_method(payment_method_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/payment-methods/{paymentMethodId}'
    _path = _path.replace('{paymentMethodId}', str(payment_method_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwritePaymentMethod

    return await _call('get', _path, _headers, _params, model_script)


## Update a new payment method for the current user account.[br]
##[br]
## Parameters:[br]
## - [param payment_method_id] [String]: Unique ID of payment method[br]
## - [param expiry_month] [int]: Payment expiry month[br]
## - [param expiry_year] [int]: Expiry year[br]
## - [param state] [String]: State of the payment method country[br]
##[br]
## Returns:[br]
## - [AppwritePaymentMethod] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_payment_method(payment_method_id: String, expiry_month: int, expiry_year: int, state: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if state != null and not state is String:
        return AppwriteException.new("Invalid type for parameter 'state'. Expected String.", 0, "argument_error", "")

    var _path := '/account/payment-methods/{paymentMethodId}'
    _path = _path.replace('{paymentMethodId}', str(payment_method_id))

    var _params := {}
    _params['expiryMonth'] = expiry_month
    _params['expiryYear'] = expiry_year
    if state != null:
        _params['state'] = state

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwritePaymentMethod

    return await _call('patch', _path, _headers, _params, model_script)


## Delete a specific payment method from a user&#039;s account.[br]
##[br]
## Parameters:[br]
## - [param payment_method_id] [String]: Unique ID of payment method[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_payment_method(payment_method_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/payment-methods/{paymentMethodId}'
    _path = _path.replace('{paymentMethodId}', str(payment_method_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Update payment method provider.[br]
##[br]
## Parameters:[br]
## - [param payment_method_id] [String]: Unique ID of payment method[br]
## - [param provider_method_id] [String]: Payment method ID from the payment provider[br]
## - [param xname] [String]: Name in the payment method[br]
## - [param state] [String]: State of the payment method country[br]
##[br]
## Returns:[br]
## - [AppwritePaymentMethod] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_payment_method_provider(payment_method_id: String, provider_method_id: String, xname: String, state: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if state != null and not state is String:
        return AppwriteException.new("Invalid type for parameter 'state'. Expected String.", 0, "argument_error", "")

    var _path := '/account/payment-methods/{paymentMethodId}/provider'
    _path = _path.replace('{paymentMethodId}', str(payment_method_id))

    var _params := {}
    _params['providerMethodId'] = provider_method_id
    _params['name'] = xname
    if state != null:
        _params['state'] = state

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwritePaymentMethod

    return await _call('patch', _path, _headers, _params, model_script)


## Update payment method mandate options.[br]
##[br]
## Parameters:[br]
## - [param payment_method_id] [String]: Unique ID of payment method[br]
##[br]
## Returns:[br]
## - [AppwritePaymentMethod] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_payment_method_mandate_options(payment_method_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/payment-methods/{paymentMethodId}/setup'
    _path = _path.replace('{paymentMethodId}', str(payment_method_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwritePaymentMethod

    return await _call('patch', _path, _headers, _params, model_script)


## Update the currently logged in user&#039;s phone number. After updating the phone number, the phone verification status will be reset. A confirmation SMS is not sent automatically, however you can use the [POST /account/verification/phone](https://appwrite.io/docs/references/cloud/client-web/account#createPhoneVerification) endpoint to send a confirmation SMS.[br]
##[br]
## Parameters:[br]
## - [param phone] [String]: Phone number. Format this number with a leading &#039;+&#039; and a country code, e.g., +16175551212.[br]
## - [param password] [String]: User password. Must be at least 8 chars.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_phone(phone: String, password: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/phone'

    var _params := {}
    _params['phone'] = phone
    _params['password'] = password

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteUser

    return await _call('patch', _path, _headers, _params, model_script)


## Get the preferences as a key-value object for the currently logged in user.[br]
##[br]
## Returns:[br]
## - [AppwritePreferences] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_prefs() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/prefs'

    var _params := {}

    var _headers := {
    }

    var model_script = AppwritePreferences

    return await _call('get', _path, _headers, _params, model_script)


## Update currently logged in user account preferences. The object you pass is stored as is, and replaces any previous value. The maximum allowed prefs size is 64kB and throws error if exceeded.[br]
##[br]
## Parameters:[br]
## - [param prefs] [Dictionary]: Prefs key-value JSON object.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_prefs(prefs: Dictionary) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/prefs'

    var _params := {}
    _params['prefs'] = prefs

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteUser

    return await _call('patch', _path, _headers, _params, model_script)


## Sends the user an email with a temporary secret key for password reset. When the user clicks the confirmation link he is redirected back to your app password reset URL with the secret key and email address values attached to the URL query string. Use the query string params to submit a request to the [PUT /account/recovery](https://appwrite.io/docs/references/cloud/client-web/account#updateRecovery) endpoint to complete the process. The verification link sent to the user&#039;s email address is valid for 1 hour.[br]
##[br]
## Parameters:[br]
## - [param email] [String]: User email.[br]
## - [param url] [String]: URL to redirect the user back to your app from the recovery email. Only URLs from hostnames in your project platform list are allowed. This requirement helps to prevent an [open redirect](https://cheatsheetseries.owasp.org/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.html) attack against your project API.[br]
##[br]
## Returns:[br]
## - [AppwriteToken] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_recovery(email: String, url: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/recovery'

    var _params := {}
    _params['email'] = email
    _params['url'] = url

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteToken

    return await _call('post', _path, _headers, _params, model_script)


## Use this endpoint to complete the user account password reset. Both the **userId** and **secret** arguments will be passed as query parameters to the redirect URL you have provided when sending your request to the [POST /account/recovery](https://appwrite.io/docs/references/cloud/client-web/account#createRecovery) endpoint.[br]
##[br]
##Please note that in order to avoid a [Redirect Attack](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.md) the only valid redirect URLs are the ones from domains you have set when adding your platforms in the console interface.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
## - [param secret] [String]: Valid reset token.[br]
## - [param password] [String]: New user password. Must be between 8 and 256 chars.[br]
##[br]
## Returns:[br]
## - [AppwriteToken] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_recovery(user_id: String, secret: String, password: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/recovery'

    var _params := {}
    _params['userId'] = user_id
    _params['secret'] = secret
    _params['password'] = password

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteToken

    return await _call('put', _path, _headers, _params, model_script)


## Get the list of active sessions across different devices for the currently logged in user.[br]
##[br]
## Returns:[br]
## - [AppwriteSessionList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_sessions() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/sessions'

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteSessionList

    return await _call('get', _path, _headers, _params, model_script)


## Delete all sessions from the user account and remove any sessions cookies from the end client.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_sessions() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/sessions'

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Use this endpoint to allow a new user to register an anonymous account in your project. This route will also create a new session for the user. To allow the new user to convert an anonymous account to a normal account, you need to update its [email and password](https://appwrite.io/docs/references/cloud/client-web/account#updateEmail) or create an [OAuth2 session](https://appwrite.io/docs/references/cloud/client-web/account#CreateOAuth2Session).[br]
##[br]
## Returns:[br]
## - [AppwriteSession] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_anonymous_session() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/sessions/anonymous'

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteSession

    return await _call('post', _path, _headers, _params, model_script)


## Allow the user to login into their account by providing a valid email and password combination. This route will create a new session for the user.[br]
##[br]
##A user is limited to 10 active sessions at a time by default. [Learn more about session limits](https://appwrite.io/docs/authentication-security#limits).[br]
##[br]
## Parameters:[br]
## - [param email] [String]: User email.[br]
## - [param password] [String]: User password. Must be at least 8 chars.[br]
##[br]
## Returns:[br]
## - [AppwriteSession] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_email_password_session(email: String, password: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/sessions/email'

    var _params := {}
    _params['email'] = email
    _params['password'] = password

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteSession

    return await _call('post', _path, _headers, _params, model_script)


## Use this endpoint to create a session from token. Provide the **userId** and **secret** parameters from the successful response of authentication flows initiated by token creation. For example, magic URL and phone login.[br]
##[br]
## @deprecated: Since 1.6.0 Use [method account_create_session] instead.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param secret] [String]: Valid verification token.[br]
##[br]
## Returns:[br]
## - [AppwriteSession] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_magic_url_session(user_id: String, secret: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/sessions/magic-url'

    var _params := {}
    _params['userId'] = user_id
    _params['secret'] = secret

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteSession

    return await _call('put', _path, _headers, _params, model_script)


## Allow the user to login to their account using the OAuth2 provider of their choice. Each OAuth2 provider should be enabled from the Appwrite console first. Use the success and failure arguments to provide a redirect URL&#039;s back to your app when login is completed.[br]
##[br]
##If there is already an active session, the new session will be attached to the logged-in account. If there are no active sessions, the server will attempt to look for a user with the same email address as the email received from the OAuth2 provider and attach the new session to the existing user. If no matching user is found - the server will create a new user.[br]
##[br]
##A user is limited to 10 active sessions at a time by default. [Learn more about session limits](https://appwrite.io/docs/authentication-security#limits).[br]
##[br]
##[br]
## Parameters:[br]
## - [param provider] [String]: OAuth2 Provider. Currently, supported providers are: amazon, apple, auth0, authentik, autodesk, bitbucket, bitly, box, dailymotion, discord, disqus, dropbox, etsy, facebook, figma, fusionauth, github, gitlab, google, keycloak, kick, linkedin, microsoft, notion, oidc, okta, paypal, paypalSandbox, podio, salesforce, slack, spotify, stripe, tradeshift, tradeshiftBox, twitch, wordpress, x, yahoo, yammer, yandex, zoho, zoom.[br]
## - [param success] [String]: URL to redirect back to your app after a successful login attempt.  Only URLs from hostnames in your project&#039;s platform list are allowed. This requirement helps to prevent an [open redirect](https://cheatsheetseries.owasp.org/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.html) attack against your project API.[br]
## - [param failure] [String]: URL to redirect back to your app after a failed login attempt.  Only URLs from hostnames in your project&#039;s platform list are allowed. This requirement helps to prevent an [open redirect](https://cheatsheetseries.owasp.org/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.html) attack against your project API.[br]
## - [param scopes] [Array]: A list of custom OAuth2 scopes. Check each provider internal docs for a list of supported scopes. Maximum of 100 scopes are allowed, each 4096 characters long.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_o_auth2_session(provider: String, success: Variant = null, failure: Variant = null, scopes: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if success != null and not success is String:
        return AppwriteException.new("Invalid type for parameter 'success'. Expected String.", 0, "argument_error", "")
    if failure != null and not failure is String:
        return AppwriteException.new("Invalid type for parameter 'failure'. Expected String.", 0, "argument_error", "")
    if scopes != null and not scopes is Array:
        return AppwriteException.new("Invalid type for parameter 'scopes'. Expected Array.", 0, "argument_error", "")

    var _path := '/account/sessions/oauth2/{provider}'
    _path = _path.replace('{provider}', str(provider))

    var _params := {}
    if success != null:
        _params['success'] = success
    if failure != null:
        _params['failure'] = failure
    if scopes != null:
        _params['scopes'] = scopes

    var _headers := {
    }

    var model_script = null

    return await _call_web('get', _path, _params)


## Use this endpoint to create a session from token. Provide the **userId** and **secret** parameters from the successful response of authentication flows initiated by token creation. For example, magic URL and phone login.[br]
##[br]
## @deprecated: Since 1.6.0 Use [method account_create_session] instead.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param secret] [String]: Valid verification token.[br]
##[br]
## Returns:[br]
## - [AppwriteSession] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_phone_session(user_id: String, secret: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/sessions/phone'

    var _params := {}
    _params['userId'] = user_id
    _params['secret'] = secret

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteSession

    return await _call('put', _path, _headers, _params, model_script)


## Use this endpoint to create a session from token. Provide the **userId** and **secret** parameters from the successful response of authentication flows initiated by token creation. For example, magic URL and phone login.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param secret] [String]: Secret of a token generated by login methods. For example, the `createMagicURLToken` or `createPhoneToken` methods.[br]
##[br]
## Returns:[br]
## - [AppwriteSession] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_session(user_id: String, secret: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/sessions/token'

    var _params := {}
    _params['userId'] = user_id
    _params['secret'] = secret

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteSession

    return await _call('post', _path, _headers, _params, model_script)


## Use this endpoint to get a logged in user&#039;s session using a Session ID. Inputting &#039;current&#039; will return the current session being used.[br]
##[br]
## Parameters:[br]
## - [param session_id] [String]: Session ID. Use the string &#039;current&#039; to get the current device session.[br]
##[br]
## Returns:[br]
## - [AppwriteSession] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_session(session_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/sessions/{sessionId}'
    _path = _path.replace('{sessionId}', str(session_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteSession

    return await _call('get', _path, _headers, _params, model_script)


## Use this endpoint to extend a session&#039;s length. Extending a session is useful when session expiry is short. If the session was created using an OAuth provider, this endpoint refreshes the access token from the provider.[br]
##[br]
## Parameters:[br]
## - [param session_id] [String]: Session ID. Use the string &#039;current&#039; to update the current device session.[br]
##[br]
## Returns:[br]
## - [AppwriteSession] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_session(session_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/sessions/{sessionId}'
    _path = _path.replace('{sessionId}', str(session_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteSession

    return await _call('patch', _path, _headers, _params, model_script)


## Logout the user. Use &#039;current&#039; as the session ID to logout on this device, use a session ID to logout on another device. If you&#039;re looking to logout the user on all devices, use [Delete Sessions](https://appwrite.io/docs/references/cloud/client-web/account#deleteSessions) instead.[br]
##[br]
## Parameters:[br]
## - [param session_id] [String]: Session ID. Use the string &#039;current&#039; to delete the current device session.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_session(session_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/sessions/{sessionId}'
    _path = _path.replace('{sessionId}', str(session_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Block the currently logged in user account. Behind the scene, the user record is not deleted but permanently blocked from any access. To completely delete a user, use the Users API instead.[br]
##[br]
## Returns:[br]
## - [AppwriteUser] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_status() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/status'

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteUser

    return await _call('patch', _path, _headers, _params, model_script)


## Use this endpoint to register a device for push notifications. Provide a target ID (custom or generated using ID.unique()), a device identifier (usually a device token), and optionally specify which provider should send notifications to this target. The target is automatically linked to the current session and includes device information like brand and model.[br]
##[br]
## Parameters:[br]
## - [param target_id] [String]: Target ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param identifier] [String]: The target identifier (token, email, phone etc.)[br]
## - [param provider_id] [String]: Provider ID. Message will be sent to this target from the specified provider ID. If no provider ID is set the first setup provider will be used.[br]
##[br]
## Returns:[br]
## - [AppwriteTarget] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_push_target(target_id: String, identifier: String, provider_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if provider_id != null and not provider_id is String:
        return AppwriteException.new("Invalid type for parameter 'provider_id'. Expected String.", 0, "argument_error", "")

    var _path := '/account/targets/push'

    var _params := {}
    _params['targetId'] = target_id
    _params['identifier'] = identifier
    if provider_id != null:
        _params['providerId'] = provider_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteTarget

    return await _call('post', _path, _headers, _params, model_script)


## Update the currently logged in user&#039;s push notification target. You can modify the target&#039;s identifier (device token) and provider ID (token, email, phone etc.). The target must exist and belong to the current user. If you change the provider ID, notifications will be sent through the new messaging provider instead.[br]
##[br]
## Parameters:[br]
## - [param target_id] [String]: Target ID.[br]
## - [param identifier] [String]: The target identifier (token, email, phone etc.)[br]
##[br]
## Returns:[br]
## - [AppwriteTarget] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_push_target(target_id: String, identifier: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/targets/{targetId}/push'
    _path = _path.replace('{targetId}', str(target_id))

    var _params := {}
    _params['identifier'] = identifier

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteTarget

    return await _call('put', _path, _headers, _params, model_script)


## Delete a push notification target for the currently logged in user. After deletion, the device will no longer receive push notifications. The target must exist and belong to the current user.[br]
##[br]
## Parameters:[br]
## - [param target_id] [String]: Target ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_push_target(target_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/targets/{targetId}/push'
    _path = _path.replace('{targetId}', str(target_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Sends the user an email with a secret key for creating a session. If the email address has never been used, a **new account is created** using the provided `userId`. Otherwise, if the email address is already attached to an account, the **user ID is ignored**. Then, the user will receive an email with the one-time password. Use the returned user ID and secret and submit a request to the [POST /v1/account/sessions/token](https://appwrite.io/docs/references/cloud/client-web/account#createSession) endpoint to complete the login process. The secret sent to the user&#039;s email is valid for 15 minutes.[br]
##[br]
##A user is limited to 10 active sessions at a time by default. [Learn more about session limits](https://appwrite.io/docs/authentication-security#limits).[br]
##[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars. If the email address has never been used, a new account is created using the provided userId. Otherwise, if the email address is already attached to an account, the user ID is ignored.[br]
## - [param email] [String]: User email.[br]
## - [param phrase] [bool]: Toggle for security phrase. If enabled, email will be send with a randomly generated phrase and the phrase will also be included in the response. Confirming phrases match increases the security of your authentication flow.[br]
##[br]
## Returns:[br]
## - [AppwriteToken] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_email_token(user_id: String, email: String, phrase: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if phrase != null and not phrase is bool:
        return AppwriteException.new("Invalid type for parameter 'phrase'. Expected bool.", 0, "argument_error", "")

    var _path := '/account/tokens/email'

    var _params := {}
    _params['userId'] = user_id
    _params['email'] = email
    if phrase != null:
        _params['phrase'] = phrase

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteToken

    return await _call('post', _path, _headers, _params, model_script)


## Sends the user an email with a secret key for creating a session. If the provided user ID has not been registered, a new user will be created. When the user clicks the link in the email, the user is redirected back to the URL you provided with the secret key and userId values attached to the URL query string. Use the query string parameters to submit a request to the [POST /v1/account/sessions/token](https://appwrite.io/docs/references/cloud/client-web/account#createSession) endpoint to complete the login process. The link sent to the user&#039;s email address is valid for 1 hour.[br]
##[br]
##A user is limited to 10 active sessions at a time by default. [Learn more about session limits](https://appwrite.io/docs/authentication-security#limits).[br]
##[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: Unique Id. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars. If the email address has never been used, a new account is created using the provided userId. Otherwise, if the email address is already attached to an account, the user ID is ignored.[br]
## - [param email] [String]: User email.[br]
## - [param url] [String]: URL to redirect the user back to your app from the magic URL login. Only URLs from hostnames in your project platform list are allowed. This requirement helps to prevent an [open redirect](https://cheatsheetseries.owasp.org/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.html) attack against your project API.[br]
## - [param phrase] [bool]: Toggle for security phrase. If enabled, email will be send with a randomly generated phrase and the phrase will also be included in the response. Confirming phrases match increases the security of your authentication flow.[br]
##[br]
## Returns:[br]
## - [AppwriteToken] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_magic_url_token(user_id: String, email: String, url: Variant = null, phrase: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if url != null and not url is String:
        return AppwriteException.new("Invalid type for parameter 'url'. Expected String.", 0, "argument_error", "")
    if phrase != null and not phrase is bool:
        return AppwriteException.new("Invalid type for parameter 'phrase'. Expected bool.", 0, "argument_error", "")

    var _path := '/account/tokens/magic-url'

    var _params := {}
    _params['userId'] = user_id
    _params['email'] = email
    if url != null:
        _params['url'] = url
    if phrase != null:
        _params['phrase'] = phrase

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteToken

    return await _call('post', _path, _headers, _params, model_script)


## Allow the user to login to their account using the OAuth2 provider of their choice. Each OAuth2 provider should be enabled from the Appwrite console first. Use the success and failure arguments to provide a redirect URL&#039;s back to your app when login is completed. [br]
##[br]
##If authentication succeeds, `userId` and `secret` of a token will be appended to the success URL as query parameters. These can be used to create a new session using the [Create session](https://appwrite.io/docs/references/cloud/client-web/account#createSession) endpoint.[br]
##[br]
##A user is limited to 10 active sessions at a time by default. [Learn more about session limits](https://appwrite.io/docs/authentication-security#limits).[br]
##[br]
## Parameters:[br]
## - [param provider] [String]: OAuth2 Provider. Currently, supported providers are: amazon, apple, auth0, authentik, autodesk, bitbucket, bitly, box, dailymotion, discord, disqus, dropbox, etsy, facebook, figma, fusionauth, github, gitlab, google, keycloak, kick, linkedin, microsoft, notion, oidc, okta, paypal, paypalSandbox, podio, salesforce, slack, spotify, stripe, tradeshift, tradeshiftBox, twitch, wordpress, x, yahoo, yammer, yandex, zoho, zoom.[br]
## - [param success] [String]: URL to redirect back to your app after a successful login attempt.  Only URLs from hostnames in your project&#039;s platform list are allowed. This requirement helps to prevent an [open redirect](https://cheatsheetseries.owasp.org/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.html) attack against your project API.[br]
## - [param failure] [String]: URL to redirect back to your app after a failed login attempt.  Only URLs from hostnames in your project&#039;s platform list are allowed. This requirement helps to prevent an [open redirect](https://cheatsheetseries.owasp.org/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.html) attack against your project API.[br]
## - [param scopes] [Array]: A list of custom OAuth2 scopes. Check each provider internal docs for a list of supported scopes. Maximum of 100 scopes are allowed, each 4096 characters long.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_o_auth2_token(provider: String, success: Variant = null, failure: Variant = null, scopes: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if success != null and not success is String:
        return AppwriteException.new("Invalid type for parameter 'success'. Expected String.", 0, "argument_error", "")
    if failure != null and not failure is String:
        return AppwriteException.new("Invalid type for parameter 'failure'. Expected String.", 0, "argument_error", "")
    if scopes != null and not scopes is Array:
        return AppwriteException.new("Invalid type for parameter 'scopes'. Expected Array.", 0, "argument_error", "")

    var _path := '/account/tokens/oauth2/{provider}'
    _path = _path.replace('{provider}', str(provider))

    var _params := {}
    if success != null:
        _params['success'] = success
    if failure != null:
        _params['failure'] = failure
    if scopes != null:
        _params['scopes'] = scopes

    var _headers := {
    }

    var model_script = null

    return await _call_web('get', _path, _params)


## Sends the user an SMS with a secret key for creating a session. If the provided user ID has not be registered, a new user will be created. Use the returned user ID and secret and submit a request to the [POST /v1/account/sessions/token](https://appwrite.io/docs/references/cloud/client-web/account#createSession) endpoint to complete the login process. The secret sent to the user&#039;s phone is valid for 15 minutes.[br]
##[br]
##A user is limited to 10 active sessions at a time by default. [Learn more about session limits](https://appwrite.io/docs/authentication-security#limits).[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: Unique Id. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars. If the phone number has never been used, a new account is created using the provided userId. Otherwise, if the phone number is already attached to an account, the user ID is ignored.[br]
## - [param phone] [String]: Phone number. Format this number with a leading &#039;+&#039; and a country code, e.g., +16175551212.[br]
##[br]
## Returns:[br]
## - [AppwriteToken] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_phone_token(user_id: String, phone: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/tokens/phone'

    var _params := {}
    _params['userId'] = user_id
    _params['phone'] = phone

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteToken

    return await _call('post', _path, _headers, _params, model_script)


## Use this endpoint to send a verification message to your user email address to confirm they are the valid owners of that address. Both the **userId** and **secret** arguments will be passed as query parameters to the URL you have provided to be attached to the verification email. The provided URL should redirect the user back to your app and allow you to complete the verification process by verifying both the **userId** and **secret** parameters. Learn more about how to [complete the verification process](https://appwrite.io/docs/references/cloud/client-web/account#updateVerification). The verification link sent to the user&#039;s email address is valid for 7 days.[br]
##[br]
##Please note that in order to avoid a [Redirect Attack](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.md), the only valid redirect URLs are the ones from domains you have set when adding your platforms in the console interface.[br]
##[br]
##[br]
## Parameters:[br]
## - [param url] [String]: URL to redirect the user back to your app from the verification email. Only URLs from hostnames in your project platform list are allowed. This requirement helps to prevent an [open redirect](https://cheatsheetseries.owasp.org/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.html) attack against your project API.[br]
##[br]
## Returns:[br]
## - [AppwriteToken] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_email_verification(url: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/verifications/email'

    var _params := {}
    _params['url'] = url

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteToken

    return await _call('post', _path, _headers, _params, model_script)


## Use this endpoint to send a verification message to your user email address to confirm they are the valid owners of that address. Both the **userId** and **secret** arguments will be passed as query parameters to the URL you have provided to be attached to the verification email. The provided URL should redirect the user back to your app and allow you to complete the verification process by verifying both the **userId** and **secret** parameters. Learn more about how to [complete the verification process](https://appwrite.io/docs/references/cloud/client-web/account#updateVerification). The verification link sent to the user&#039;s email address is valid for 7 days.[br]
##[br]
##Please note that in order to avoid a [Redirect Attack](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.md), the only valid redirect URLs are the ones from domains you have set when adding your platforms in the console interface.[br]
##[br]
##[br]
## @deprecated: Since 1.8.0 Use [method account_create_email_verification] instead.[br]
##[br]
## Parameters:[br]
## - [param url] [String]: URL to redirect the user back to your app from the verification email. Only URLs from hostnames in your project platform list are allowed. This requirement helps to prevent an [open redirect](https://cheatsheetseries.owasp.org/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.html) attack against your project API.[br]
##[br]
## Returns:[br]
## - [AppwriteToken] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_verification(url: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/verifications/email'

    var _params := {}
    _params['url'] = url

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteToken

    return await _call('post', _path, _headers, _params, model_script)


## Use this endpoint to complete the user email verification process. Use both the **userId** and **secret** parameters that were attached to your app URL to verify the user email ownership. If confirmed this route will return a 200 status code.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
## - [param secret] [String]: Valid verification token.[br]
##[br]
## Returns:[br]
## - [AppwriteToken] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_email_verification(user_id: String, secret: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/verifications/email'

    var _params := {}
    _params['userId'] = user_id
    _params['secret'] = secret

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteToken

    return await _call('put', _path, _headers, _params, model_script)


## Use this endpoint to complete the user email verification process. Use both the **userId** and **secret** parameters that were attached to your app URL to verify the user email ownership. If confirmed this route will return a 200 status code.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method account_update_email_verification] instead.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
## - [param secret] [String]: Valid verification token.[br]
##[br]
## Returns:[br]
## - [AppwriteToken] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_verification(user_id: String, secret: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/verifications/email'

    var _params := {}
    _params['userId'] = user_id
    _params['secret'] = secret

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteToken

    return await _call('put', _path, _headers, _params, model_script)


## Use this endpoint to send a verification SMS to the currently logged in user. This endpoint is meant for use after updating a user&#039;s phone number using the [accountUpdatePhone](https://appwrite.io/docs/references/cloud/client-web/account#updatePhone) endpoint. Learn more about how to [complete the verification process](https://appwrite.io/docs/references/cloud/client-web/account#updatePhoneVerification). The verification code sent to the user&#039;s phone number is valid for 15 minutes.[br]
##[br]
## Returns:[br]
## - [AppwriteToken] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_phone_verification() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/verifications/phone'

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteToken

    return await _call('post', _path, _headers, _params, model_script)


## Use this endpoint to complete the user phone verification process. Use the **userId** and **secret** that were sent to your user&#039;s phone number to verify the user email ownership. If confirmed this route will return a 200 status code.[br]
##[br]
## Parameters:[br]
## - [param user_id] [String]: User ID.[br]
## - [param secret] [String]: Valid verification token.[br]
##[br]
## Returns:[br]
## - [AppwriteToken] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_phone_verification(user_id: String, secret: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/account/verifications/phone'

    var _params := {}
    _params['userId'] = user_id
    _params['secret'] = secret

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteToken

    return await _call('put', _path, _headers, _params, model_script)

