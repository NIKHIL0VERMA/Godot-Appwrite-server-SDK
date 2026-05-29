extends "../utils/service.gd"
## Service class.


## List all domains registered for this project. This endpoint supports pagination.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/databases#querying-documents). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on attributes such as domain name, teamInternalId, expiration, etc.[br]
## - [param search] [String]: Search term to filter your list results. Max length: 256 chars.[br]
##[br]
## Returns:[br]
## - [AppwriteDomainsList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list(queries: Variant = null, search: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if search != null and not search is String:
        return AppwriteException.new("Invalid type for parameter 'search'. Expected String.", 0, "argument_error", "")

    var _path := '/domains'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if search != null:
        _params['search'] = search

    var _headers := {
    }

    var model_script = AppwriteDomainsList

    return await _call('get', _path, _headers, _params, model_script)


## Create a new domain. Before creating a domain, you need to ensure that your DNS provider is properly configured. After creating the domain, you can use the verification endpoint to check if the domain is ready to be used.[br]
##[br]
## Parameters:[br]
## - [param team_id] [String]: Team unique ID.[br]
## - [param domain] [String]: Domain name (e.g. &quot;example.com&quot;).[br]
##[br]
## Returns:[br]
## - [AppwriteDomain] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create(team_id: String, domain: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/domains'

    var _params := {}
    _params['teamId'] = team_id
    _params['domain'] = domain

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDomain

    return await _call('post', _path, _headers, _params, model_script)


## Get the registration price for a domain name.[br]
##[br]
## Parameters:[br]
## - [param domain] [String]: Domain name to get price for.[br]
## - [param period_years] [int]: Number of years to calculate the domain price for. Must be at least 1.[br]
## - [param registration_type] [String]: Type of registration pricing to fetch. Allowed values: new, transfer, renewal, trade.[br]
##[br]
## Returns:[br]
## - [AppwriteDomainPrice] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_price(domain: String, period_years: Variant = null, registration_type: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if period_years != null and not period_years is int:
        return AppwriteException.new("Invalid type for parameter 'period_years'. Expected int.", 0, "argument_error", "")
    if registration_type != null and not registration_type is String:
        return AppwriteException.new("Invalid type for parameter 'registration_type'. Expected String.", 0, "argument_error", "")

    var _path := '/domains/price'

    var _params := {}
    _params['domain'] = domain
    if period_years != null:
        _params['periodYears'] = period_years
    if registration_type != null:
        _params['registrationType'] = registration_type

    var _headers := {
    }

    var model_script = AppwriteDomainPrice

    return await _call('get', _path, _headers, _params, model_script)


## Initiate a domain purchase by providing registrant details and a payment method. Authorizes the payment and returns a `clientSecret`. If 3D Secure is required, use the `clientSecret` on the client to complete the authentication challenge. Once authentication is complete (or if none is needed), call the Update Purchase endpoint to capture the payment and finalize the purchase.[br]
##[br]
## Parameters:[br]
## - [param domain] [String]: Fully qualified domain name to purchase (for example, example.com).[br]
## - [param organization_id] [String]: Team ID that will own the domain.[br]
## - [param first_name] [String]: Registrant first name used for domain registration.[br]
## - [param last_name] [String]: Registrant last name used for domain registration.[br]
## - [param email] [String]: Registrant email address for registration and notices.[br]
## - [param phone] [String]: Registrant phone number in E.164 format (for example, +15555551234).[br]
## - [param billing_address_id] [String]: Billing address ID used for registration contact details.[br]
## - [param payment_method_id] [String]: Payment method ID to authorize and capture the purchase.[br]
## - [param address_line3] [String]: Additional address line for the registrant (line 3).[br]
## - [param company_name] [String]: Company or organization name for the registrant.[br]
## - [param period_years] [int]: Registration term in years (1-10).[br]
## - [param auto_renewal] [bool]: Whether the domain should renew automatically after purchase.[br]
##[br]
## Returns:[br]
## - [AppwriteDomainPurchase] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_purchase(domain: String, organization_id: String, first_name: String, last_name: String, email: String, phone: String, billing_address_id: String, payment_method_id: String, address_line3: Variant = null, company_name: Variant = null, period_years: Variant = null, auto_renewal: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if address_line3 != null and not address_line3 is String:
        return AppwriteException.new("Invalid type for parameter 'address_line3'. Expected String.", 0, "argument_error", "")
    if company_name != null and not company_name is String:
        return AppwriteException.new("Invalid type for parameter 'company_name'. Expected String.", 0, "argument_error", "")
    if period_years != null and not period_years is int:
        return AppwriteException.new("Invalid type for parameter 'period_years'. Expected int.", 0, "argument_error", "")
    if auto_renewal != null and not auto_renewal is bool:
        return AppwriteException.new("Invalid type for parameter 'auto_renewal'. Expected bool.", 0, "argument_error", "")

    var _path := '/domains/purchases'

    var _params := {}
    _params['domain'] = domain
    _params['organizationId'] = organization_id
    _params['firstName'] = first_name
    _params['lastName'] = last_name
    _params['email'] = email
    _params['phone'] = phone
    _params['billingAddressId'] = billing_address_id
    if address_line3 != null:
        _params['addressLine3'] = address_line3
    if company_name != null:
        _params['companyName'] = company_name
    if period_years != null:
        _params['periodYears'] = period_years
    if auto_renewal != null:
        _params['autoRenewal'] = auto_renewal
    _params['paymentMethodId'] = payment_method_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDomainPurchase

    return await _call('post', _path, _headers, _params, model_script)


## Finalize a domain purchase initiated with Create Purchase. Verifies that any required 3D Secure authentication is complete, registers the domain, captures the payment, and provisions default DNS records. Returns a 402 error if authentication is still pending.[br]
##[br]
## Parameters:[br]
## - [param invoice_id] [String]: Invoice ID.[br]
## - [param organization_id] [String]: Team ID that owns the domain.[br]
##[br]
## Returns:[br]
## - [AppwriteDomainPurchase] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_purchase(invoice_id: String, organization_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/domains/purchases/{invoiceId}'
    _path = _path.replace('{invoiceId}', str(invoice_id))

    var _params := {}
    _params['organizationId'] = organization_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDomainPurchase

    return await _call('patch', _path, _headers, _params, model_script)


## List domain suggestions.[br]
##[br]
## Parameters:[br]
## - [param query] [String]: Query to find available domains and suggestions. Max length: 256 chars.[br]
## - [param tlds] [Array]: TLDs to suggest.[br]
## - [param limit] [int]: Maximum number of suggestions to return.[br]
## - [param filter_type] [String]: Filter type: premium, suggestion.[br]
## - [param price_max] [int]: Filter premium domains by maximum price. Only premium domains at or below this price will be returned. Does not affect regular domain suggestions.[br]
## - [param price_min] [int]: Filter premium domains by minimum price. Only premium domains at or above this price will be returned. Does not affect regular domain suggestions.[br]
##[br]
## Returns:[br]
## - [AppwriteDomainSuggestionsList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_suggestions(query: String, tlds: Variant = null, limit: Variant = null, filter_type: Variant = null, price_max: Variant = null, price_min: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if tlds != null and not tlds is Array:
        return AppwriteException.new("Invalid type for parameter 'tlds'. Expected Array.", 0, "argument_error", "")
    if limit != null and not limit is int:
        return AppwriteException.new("Invalid type for parameter 'limit'. Expected int.", 0, "argument_error", "")
    if filter_type != null and not filter_type is String:
        return AppwriteException.new("Invalid type for parameter 'filter_type'. Expected String.", 0, "argument_error", "")
    if price_max != null and not price_max is int:
        return AppwriteException.new("Invalid type for parameter 'price_max'. Expected int.", 0, "argument_error", "")
    if price_min != null and not price_min is int:
        return AppwriteException.new("Invalid type for parameter 'price_min'. Expected int.", 0, "argument_error", "")

    var _path := '/domains/suggestions'

    var _params := {}
    _params['query'] = query
    if tlds != null:
        _params['tlds'] = tlds
    if limit != null:
        _params['limit'] = limit
    if filter_type != null:
        _params['filterType'] = filter_type
    if price_max != null:
        _params['priceMax'] = price_max
    if price_min != null:
        _params['priceMin'] = price_min

    var _headers := {
    }

    var model_script = AppwriteDomainSuggestionsList

    return await _call('get', _path, _headers, _params, model_script)


## Initiate a domain transfer-in by providing an authorization code, registrant details, and a payment method. Authorizes the payment and returns a `clientSecret`. If 3D Secure is required, use the `clientSecret` on the client to complete the authentication challenge. Once authentication is complete (or if none is needed), call the Update Transfer In endpoint to capture the payment and submit the transfer.[br]
##[br]
## Parameters:[br]
## - [param domain] [String]: Domain name to transfer in.[br]
## - [param organization_id] [String]: Organization ID that this domain will belong to.[br]
## - [param auth_code] [String]: Authorization code for the domain transfer.[br]
## - [param payment_method_id] [String]: Payment method ID to authorize and capture the transfer.[br]
## - [param auto_renewal] [bool]: Whether the domain should renew automatically after transfer.[br]
##[br]
## Returns:[br]
## - [AppwriteDomainPurchase] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_transfer_in(domain: String, organization_id: String, auth_code: String, payment_method_id: String, auto_renewal: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if auto_renewal != null and not auto_renewal is bool:
        return AppwriteException.new("Invalid type for parameter 'auto_renewal'. Expected bool.", 0, "argument_error", "")

    var _path := '/domains/transfers/in'

    var _params := {}
    _params['domain'] = domain
    _params['organizationId'] = organization_id
    _params['authCode'] = auth_code
    if auto_renewal != null:
        _params['autoRenewal'] = auto_renewal
    _params['paymentMethodId'] = payment_method_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDomainPurchase

    return await _call('post', _path, _headers, _params, model_script)


## Finalize a domain transfer-in initiated with Create Transfer In. Verifies that any required 3D Secure authentication is complete, submits the transfer with the authorization code, captures the payment, and sends a confirmation email. Returns a 402 error if authentication is still pending.[br]
##[br]
## Parameters:[br]
## - [param invoice_id] [String]: Invoice ID.[br]
## - [param organization_id] [String]: Team ID that owns the domain.[br]
##[br]
## Returns:[br]
## - [AppwriteDomainPurchase] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_transfer_in(invoice_id: String, organization_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/domains/transfers/in/{invoiceId}'
    _path = _path.replace('{invoiceId}', str(invoice_id))

    var _params := {}
    _params['organizationId'] = organization_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDomainPurchase

    return await _call('patch', _path, _headers, _params, model_script)


## Initiate a domain transfer-out by generating an authorization code for the specified domain. The returned `authCode` should be provided to the gaining provider to complete the transfer. If the domain has auto-renewal enabled, it will be automatically disabled as part of this operation.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
## - [param organization_id] [String]: Organization ID that this domain belongs to.[br]
##[br]
## Returns:[br]
## - [AppwriteDomainTransferOut] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_transfer_out(domain_id: String, organization_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/domains/transfers/out'

    var _params := {}
    _params['domainId'] = domain_id
    _params['organizationId'] = organization_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDomainTransferOut

    return await _call('post', _path, _headers, _params, model_script)


## Get a domain by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDomain] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func xget(domain_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/domains/{domainId}'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteDomain

    return await _call('get', _path, _headers, _params, model_script)


## Delete a domain by its unique ID. This endpoint can be used to delete a domain from your project.[br]
##Once deleted, the domain will no longer be available for use and all associated resources will be removed.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete(domain_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/domains/{domainId}'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Enable or disable auto-renewal for a domain.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
## - [param auto_renewal] [bool]: Whether the domain should renew automatically.[br]
##[br]
## Returns:[br]
## - [AppwriteDomain] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_auto_renewal(domain_id: String, auto_renewal: bool) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/domains/{domainId}/auto-renewal'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}
    _params['autoRenewal'] = auto_renewal

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDomain

    return await _call('patch', _path, _headers, _params, model_script)


## Verify which NS records are used and update the domain accordingly. This will check the domain&#039;s[br]
##nameservers and update the domain&#039;s status based on whether the nameservers match the expected[br]
##Appwrite nameservers.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDomain] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_nameservers(domain_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/domains/{domainId}/nameservers'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDomain

    return await _call('patch', _path, _headers, _params, model_script)


## List Google Workspace DNS records.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecordsList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_preset_google_workspace(domain_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/domains/{domainId}/presets/google-workspace'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteDnsRecordsList

    return await _call('get', _path, _headers, _params, model_script)


## Add Google Workspace DNS records to the domain. This will create the required MX records [br]
##for Google Workspace email hosting.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecordsList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_preset_google_workspace(domain_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/domains/{domainId}/presets/google-workspace'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDnsRecordsList

    return await _call('post', _path, _headers, _params, model_script)


## List iCloud DNS records.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecordsList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_preset_i_cloud(domain_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/domains/{domainId}/presets/icloud'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteDnsRecordsList

    return await _call('get', _path, _headers, _params, model_script)


## Add iCloud DNS records to the domain. This will create the required MX and SPF records[br]
##for using iCloud email services with your domain.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecordsList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_preset_i_cloud(domain_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/domains/{domainId}/presets/icloud'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDnsRecordsList

    return await _call('post', _path, _headers, _params, model_script)


## List Mailgun DNS records.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecordsList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_preset_mailgun(domain_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/domains/{domainId}/presets/mailgun'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteDnsRecordsList

    return await _call('get', _path, _headers, _params, model_script)


## Add Mailgun DNS records to the domain. This endpoint will create the required DNS records [br]
##for Mailgun in the specified domain.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecordsList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_preset_mailgun(domain_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/domains/{domainId}/presets/mailgun'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDnsRecordsList

    return await _call('post', _path, _headers, _params, model_script)


## List Outlook DNS records.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecordsList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_preset_outlook(domain_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/domains/{domainId}/presets/outlook'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteDnsRecordsList

    return await _call('get', _path, _headers, _params, model_script)


## Add Outlook DNS records to the domain. This will create the required MX records[br]
##for setting up Outlook email hosting for your domain.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecordsList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_preset_outlook(domain_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/domains/{domainId}/presets/outlook'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDnsRecordsList

    return await _call('post', _path, _headers, _params, model_script)


## List ProtonMail DNS records.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecordsList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_preset_proton_mail(domain_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/domains/{domainId}/presets/proton-mail'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteDnsRecordsList

    return await _call('get', _path, _headers, _params, model_script)


## Add ProtonMail DNS records to the domain. This will create the required MX records[br]
##for using ProtonMail with your custom domain.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecordsList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_preset_proton_mail(domain_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/domains/{domainId}/presets/proton-mail'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDnsRecordsList

    return await _call('post', _path, _headers, _params, model_script)


## List Zoho DNS records.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecordsList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_preset_zoho(domain_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/domains/{domainId}/presets/zoho'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteDnsRecordsList

    return await _call('get', _path, _headers, _params, model_script)


## Add Zoho Mail DNS records to the domain. This will create the required MX records[br]
##for setting up Zoho Mail on your domain.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecordsList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_preset_zoho(domain_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/domains/{domainId}/presets/zoho'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDnsRecordsList

    return await _call('post', _path, _headers, _params, model_script)


## List DNS records for a given domain. You can use this endpoint to list all the DNS records[br]
##associated with your domain.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. You may filter on attributes such as type, name, value, etc. Maximum of 100 queries are allowed, each 4096 characters long.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecordsList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_records(domain_id: String, queries: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")

    var _path := '/domains/{domainId}/records'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}
    if queries != null:
        _params['queries'] = queries

    var _headers := {
    }

    var model_script = AppwriteDnsRecordsList

    return await _call('get', _path, _headers, _params, model_script)


## Create a new A record for the given domain. A records are used to point a domain name [br]
##to an IPv4 address. The record value should be a valid IPv4 address.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
## - [param xname] [String]: Record name (subdomain).[br]
## - [param value] [String]: IPv4 address for this A record.[br]
## - [param ttl] [int]: Time to live, in seconds. Must be greater than 0.[br]
## - [param comment] [String]: A comment explaining what this record is for.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecord] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_record_a(domain_id: String, xname: String, value: String, ttl: int, comment: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if comment != null and not comment is String:
        return AppwriteException.new("Invalid type for parameter 'comment'. Expected String.", 0, "argument_error", "")

    var _path := '/domains/{domainId}/records/a'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}
    _params['name'] = xname
    _params['value'] = value
    _params['ttl'] = ttl
    if comment != null:
        _params['comment'] = comment

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDnsRecord

    return await _call('post', _path, _headers, _params, model_script)


## Update an existing A record for the given domain. This endpoint allows you to modify [br]
##the properties of an A record including its name (subdomain), IPv4 address, TTL, [br]
##and optional comment.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
## - [param record_id] [String]: DNS record unique ID.[br]
## - [param xname] [String]: Record name (subdomain).[br]
## - [param value] [String]: IPv4 address for this A record.[br]
## - [param ttl] [int]: Time to live, in seconds. Must be greater than 0.[br]
## - [param comment] [String]: A comment explaining what this record is for.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecord] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_record_a(domain_id: String, record_id: String, xname: String, value: String, ttl: int, comment: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if comment != null and not comment is String:
        return AppwriteException.new("Invalid type for parameter 'comment'. Expected String.", 0, "argument_error", "")

    var _path := '/domains/{domainId}/records/a/{recordId}'
    _path = _path.replace('{domainId}', str(domain_id))
    _path = _path.replace('{recordId}', str(record_id))

    var _params := {}
    _params['name'] = xname
    _params['value'] = value
    _params['ttl'] = ttl
    if comment != null:
        _params['comment'] = comment

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDnsRecord

    return await _call('put', _path, _headers, _params, model_script)


## Create a new AAAA record for the given domain. This endpoint allows you to add a new IPv6 DNS record [br]
##to your domain. The record will be used to point a hostname to an IPv6 address.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
## - [param xname] [String]: Record name (subdomain).[br]
## - [param value] [String]: IPv6 address for this AAAA record.[br]
## - [param ttl] [int]: Time to live, in seconds. Must be greater than 0.[br]
## - [param comment] [String]: A comment explaining what this record is for.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecord] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_record_aaaa(domain_id: String, xname: String, value: String, ttl: int, comment: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if comment != null and not comment is String:
        return AppwriteException.new("Invalid type for parameter 'comment'. Expected String.", 0, "argument_error", "")

    var _path := '/domains/{domainId}/records/aaaa'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}
    _params['name'] = xname
    _params['value'] = value
    _params['ttl'] = ttl
    if comment != null:
        _params['comment'] = comment

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDnsRecord

    return await _call('post', _path, _headers, _params, model_script)


## Update an existing AAAA record for the given domain. This endpoint allows you to modify[br]
##the properties of an existing AAAA record, including its name (subdomain), IPv6 address,[br]
##TTL, and optional comment.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
## - [param record_id] [String]: DNS record unique ID.[br]
## - [param xname] [String]: Record name (subdomain).[br]
## - [param value] [String]: IPv6 address for this AAAA record.[br]
## - [param ttl] [int]: Time to live, in seconds. Must be greater than 0.[br]
## - [param comment] [String]: A comment for this record.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecord] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_record_aaaa(domain_id: String, record_id: String, xname: String, value: String, ttl: int, comment: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if comment != null and not comment is String:
        return AppwriteException.new("Invalid type for parameter 'comment'. Expected String.", 0, "argument_error", "")

    var _path := '/domains/{domainId}/records/aaaa/{recordId}'
    _path = _path.replace('{domainId}', str(domain_id))
    _path = _path.replace('{recordId}', str(record_id))

    var _params := {}
    _params['name'] = xname
    _params['value'] = value
    _params['ttl'] = ttl
    if comment != null:
        _params['comment'] = comment

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDnsRecord

    return await _call('put', _path, _headers, _params, model_script)


## Create a new ALIAS record for the given domain. This record type can be used to point your domain [br]
##to another domain name that will serve as an alias. This is particularly useful when you want to [br]
##map your domain to a target domain that may change its IP address.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
## - [param xname] [String]: Record name.[br]
## - [param value] [String]: Target domain for this ALIAS record.[br]
## - [param ttl] [int]: Time to live, in seconds. Must be greater than 0.[br]
## - [param comment] [String]: A comment for this record.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecord] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_record_alias(domain_id: String, xname: String, value: String, ttl: int, comment: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if comment != null and not comment is String:
        return AppwriteException.new("Invalid type for parameter 'comment'. Expected String.", 0, "argument_error", "")

    var _path := '/domains/{domainId}/records/alias'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}
    _params['name'] = xname
    _params['value'] = value
    _params['ttl'] = ttl
    if comment != null:
        _params['comment'] = comment

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDnsRecord

    return await _call('post', _path, _headers, _params, model_script)


## Update an existing ALIAS record for the specified domain. This endpoint allows you to modify[br]
##the properties of an existing ALIAS record including its name, target domain, TTL, and comment.[br]
##    [br]
##The ALIAS record type is similar to a CNAME record but can be used at the zone apex (root domain).[br]
##It provides a way to map one domain name to another.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
## - [param record_id] [String]: DNS record unique ID.[br]
## - [param xname] [String]: Record name.[br]
## - [param value] [String]: Target domain for this ALIAS record.[br]
## - [param ttl] [int]: Time to live, in seconds. Must be greater than 0.[br]
## - [param comment] [String]: A comment for this record.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecord] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_record_alias(domain_id: String, record_id: String, xname: String, value: String, ttl: int, comment: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if comment != null and not comment is String:
        return AppwriteException.new("Invalid type for parameter 'comment'. Expected String.", 0, "argument_error", "")

    var _path := '/domains/{domainId}/records/alias/{recordId}'
    _path = _path.replace('{domainId}', str(domain_id))
    _path = _path.replace('{recordId}', str(record_id))

    var _params := {}
    _params['name'] = xname
    _params['value'] = value
    _params['ttl'] = ttl
    if comment != null:
        _params['comment'] = comment

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDnsRecord

    return await _call('put', _path, _headers, _params, model_script)


## Create a new CAA record for the given domain. CAA records are used to specify which [br]
##Certificate Authorities (CAs) are allowed to issue SSL/TLS certificates for your domain.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
## - [param xname] [String]: Record name.[br]
## - [param value] [String]: CAA value (e.g. issuer domain).[br]
## - [param ttl] [int]: Time to live, in seconds. Must be greater than 0.[br]
## - [param comment] [String]: A comment for this record.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecord] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_record_caa(domain_id: String, xname: String, value: String, ttl: int, comment: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if comment != null and not comment is String:
        return AppwriteException.new("Invalid type for parameter 'comment'. Expected String.", 0, "argument_error", "")

    var _path := '/domains/{domainId}/records/caa'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}
    _params['name'] = xname
    _params['value'] = value
    _params['ttl'] = ttl
    if comment != null:
        _params['comment'] = comment

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDnsRecord

    return await _call('post', _path, _headers, _params, model_script)


## Update an existing CAA record for the given domain. A CAA (Certification Authority Authorization) [br]
##record is used to specify which certificate authorities (CAs) are authorized to issue certificates [br]
##for a domain.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
## - [param record_id] [String]: DNS record unique ID.[br]
## - [param xname] [String]: Record name.[br]
## - [param value] [String]: CAA value (e.g. issuer domain).[br]
## - [param ttl] [int]: Time to live, in seconds. Must be greater than 0.[br]
## - [param comment] [String]: A comment for this record.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecord] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_record_caa(domain_id: String, record_id: String, xname: String, value: String, ttl: int, comment: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if comment != null and not comment is String:
        return AppwriteException.new("Invalid type for parameter 'comment'. Expected String.", 0, "argument_error", "")

    var _path := '/domains/{domainId}/records/caa/{recordId}'
    _path = _path.replace('{domainId}', str(domain_id))
    _path = _path.replace('{recordId}', str(record_id))

    var _params := {}
    _params['name'] = xname
    _params['value'] = value
    _params['ttl'] = ttl
    if comment != null:
        _params['comment'] = comment

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDnsRecord

    return await _call('put', _path, _headers, _params, model_script)


## Create a new CNAME record for the given domain.[br]
##    [br]
##A CNAME record maps a subdomain to another domain name, allowing you to create aliases [br]
##for your domain. For example, you can create a CNAME record to point &#039;blog.example.com&#039; [br]
##to &#039;example.wordpress.com&#039;.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
## - [param xname] [String]: Record name (subdomain).[br]
## - [param value] [String]: Canonical target for this CNAME record.[br]
## - [param ttl] [int]: Time to live, in seconds. Must be greater than 0.[br]
## - [param comment] [String]: A comment for this record.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecord] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_record_cname(domain_id: String, xname: String, value: String, ttl: int, comment: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if comment != null and not comment is String:
        return AppwriteException.new("Invalid type for parameter 'comment'. Expected String.", 0, "argument_error", "")

    var _path := '/domains/{domainId}/records/cname'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}
    _params['name'] = xname
    _params['value'] = value
    _params['ttl'] = ttl
    if comment != null:
        _params['comment'] = comment

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDnsRecord

    return await _call('post', _path, _headers, _params, model_script)


## Update an existing CNAME record for the given domain.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
## - [param record_id] [String]: DNS record unique ID.[br]
## - [param xname] [String]: Record name (subdomain).[br]
## - [param value] [String]: Canonical target for this CNAME record.[br]
## - [param ttl] [int]: Time to live, in seconds. Must be greater than 0.[br]
## - [param comment] [String]: A comment for this record.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecord] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_record_cname(domain_id: String, record_id: String, xname: String, value: String, ttl: int, comment: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if comment != null and not comment is String:
        return AppwriteException.new("Invalid type for parameter 'comment'. Expected String.", 0, "argument_error", "")

    var _path := '/domains/{domainId}/records/cname/{recordId}'
    _path = _path.replace('{domainId}', str(domain_id))
    _path = _path.replace('{recordId}', str(record_id))

    var _params := {}
    _params['name'] = xname
    _params['value'] = value
    _params['ttl'] = ttl
    if comment != null:
        _params['comment'] = comment

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDnsRecord

    return await _call('put', _path, _headers, _params, model_script)


## Create a new HTTPS record for the given domain. This record is used to configure HTTPS [br]
##settings for your domain, enabling secure communication over SSL/TLS.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
## - [param xname] [String]: Record name (subdomain).[br]
## - [param value] [String]: Target for the HTTPS record.[br]
## - [param ttl] [int]: Time to live, in seconds. Must be greater than 0.[br]
## - [param comment] [String]: A comment for this record.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecord] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_record_https(domain_id: String, xname: String, value: String, ttl: int, comment: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if comment != null and not comment is String:
        return AppwriteException.new("Invalid type for parameter 'comment'. Expected String.", 0, "argument_error", "")

    var _path := '/domains/{domainId}/records/https'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}
    _params['name'] = xname
    _params['value'] = value
    _params['ttl'] = ttl
    if comment != null:
        _params['comment'] = comment

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDnsRecord

    return await _call('post', _path, _headers, _params, model_script)


## Update an existing HTTPS record for the given domain. This endpoint allows you to modify [br]
##the properties of an HTTPS record associated with your domain, including the name (subdomain), [br]
##target value, TTL, and optional comment.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
## - [param record_id] [String]: DNS record unique ID.[br]
## - [param xname] [String]: Record name (subdomain).[br]
## - [param value] [String]: Target for the HTTPS record.[br]
## - [param ttl] [int]: Time to live, in seconds. Must be greater than 0.[br]
## - [param comment] [String]: A comment for this record.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecord] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_record_https(domain_id: String, record_id: String, xname: String, value: String, ttl: int, comment: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if comment != null and not comment is String:
        return AppwriteException.new("Invalid type for parameter 'comment'. Expected String.", 0, "argument_error", "")

    var _path := '/domains/{domainId}/records/https/{recordId}'
    _path = _path.replace('{domainId}', str(domain_id))
    _path = _path.replace('{recordId}', str(record_id))

    var _params := {}
    _params['name'] = xname
    _params['value'] = value
    _params['ttl'] = ttl
    if comment != null:
        _params['comment'] = comment

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDnsRecord

    return await _call('put', _path, _headers, _params, model_script)


## Create a new MX record for the given domain. MX records are used to define the mail servers responsible [br]
##for accepting email messages for the domain. Multiple MX records can be created with different priorities.[br]
##The priority parameter determines the order in which mail servers are used, with lower values indicating [br]
##higher priority.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
## - [param xname] [String]: Record name (subdomain).[br]
## - [param value] [String]: Mail server domain for this MX record.[br]
## - [param ttl] [int]: Time to live, in seconds. Must be greater than 0.[br]
## - [param priority] [int]: MX priority.[br]
## - [param comment] [String]: A comment for this record.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecord] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_record_mx(domain_id: String, xname: String, value: String, ttl: int, priority: int, comment: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if comment != null and not comment is String:
        return AppwriteException.new("Invalid type for parameter 'comment'. Expected String.", 0, "argument_error", "")

    var _path := '/domains/{domainId}/records/mx'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}
    _params['name'] = xname
    _params['value'] = value
    _params['ttl'] = ttl
    _params['priority'] = priority
    if comment != null:
        _params['comment'] = comment

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDnsRecord

    return await _call('post', _path, _headers, _params, model_script)


## Update an existing MX record for the given domain.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
## - [param record_id] [String]: DNS record unique ID.[br]
## - [param xname] [String]: Record name (subdomain).[br]
## - [param value] [String]: Mail server domain for this MX record.[br]
## - [param ttl] [int]: Time to live, in seconds. Must be greater than 0.[br]
## - [param priority] [int]: MX priority.[br]
## - [param comment] [String]: A comment for this record.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecord] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_record_mx(domain_id: String, record_id: String, xname: String, value: String, ttl: int, priority: int, comment: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if comment != null and not comment is String:
        return AppwriteException.new("Invalid type for parameter 'comment'. Expected String.", 0, "argument_error", "")

    var _path := '/domains/{domainId}/records/mx/{recordId}'
    _path = _path.replace('{domainId}', str(domain_id))
    _path = _path.replace('{recordId}', str(record_id))

    var _params := {}
    _params['name'] = xname
    _params['value'] = value
    _params['ttl'] = ttl
    _params['priority'] = priority
    if comment != null:
        _params['comment'] = comment

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDnsRecord

    return await _call('put', _path, _headers, _params, model_script)


## Create a new NS record for the given domain. NS records specify the nameservers that are used [br]
##to resolve the domain name to IP addresses. Each domain can have multiple NS records.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
## - [param xname] [String]: Record name (subdomain).[br]
## - [param value] [String]: Nameserver target for this NS record.[br]
## - [param ttl] [int]: Time to live, in seconds. Must be greater than 0.[br]
## - [param comment] [String]: A comment for this record.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecord] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_record_ns(domain_id: String, xname: String, value: String, ttl: int, comment: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if comment != null and not comment is String:
        return AppwriteException.new("Invalid type for parameter 'comment'. Expected String.", 0, "argument_error", "")

    var _path := '/domains/{domainId}/records/ns'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}
    _params['name'] = xname
    _params['value'] = value
    _params['ttl'] = ttl
    if comment != null:
        _params['comment'] = comment

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDnsRecord

    return await _call('post', _path, _headers, _params, model_script)


## Update an existing NS record for the given domain. This endpoint allows you to modify [br]
##the properties of an NS (nameserver) record associated with your domain. You can update [br]
##the record name (subdomain), target nameserver value, TTL, and add or modify comments [br]
##for better record management.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
## - [param record_id] [String]: DNS record unique ID.[br]
## - [param xname] [String]: Record name (subdomain).[br]
## - [param value] [String]: Nameserver target for this NS record.[br]
## - [param ttl] [int]: Time to live, in seconds. Must be greater than 0.[br]
## - [param comment] [String]: A comment for this record.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecord] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_record_ns(domain_id: String, record_id: String, xname: String, value: String, ttl: int, comment: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if comment != null and not comment is String:
        return AppwriteException.new("Invalid type for parameter 'comment'. Expected String.", 0, "argument_error", "")

    var _path := '/domains/{domainId}/records/ns/{recordId}'
    _path = _path.replace('{domainId}', str(domain_id))
    _path = _path.replace('{recordId}', str(record_id))

    var _params := {}
    _params['name'] = xname
    _params['value'] = value
    _params['ttl'] = ttl
    if comment != null:
        _params['comment'] = comment

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDnsRecord

    return await _call('put', _path, _headers, _params, model_script)


## Create a new SRV record for the given domain. SRV records are used to define the location [br]
##of servers for specific services. For example, they can be used to specify which server [br]
##handles a specific service like SIP or XMPP for the domain.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
## - [param xname] [String]: Record name (service name).[br]
## - [param value] [String]: Target hostname for this SRV record.[br]
## - [param ttl] [int]: Time to live, in seconds. Must be greater than 0.[br]
## - [param priority] [int]: Record priority.[br]
## - [param weight] [int]: Record weight.[br]
## - [param port] [int]: Port number for the service.[br]
## - [param comment] [String]: A comment for this record.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecord] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_record_srv(domain_id: String, xname: String, value: String, ttl: int, priority: int, weight: int, port: int, comment: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if comment != null and not comment is String:
        return AppwriteException.new("Invalid type for parameter 'comment'. Expected String.", 0, "argument_error", "")

    var _path := '/domains/{domainId}/records/srv'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}
    _params['name'] = xname
    _params['value'] = value
    _params['ttl'] = ttl
    _params['priority'] = priority
    _params['weight'] = weight
    _params['port'] = port
    if comment != null:
        _params['comment'] = comment

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDnsRecord

    return await _call('post', _path, _headers, _params, model_script)


## Update an existing SRV record for the given domain.[br]
##    [br]
##Required parameters:[br]
##- domainId: Domain unique ID[br]
##- recordId: DNS record unique ID[br]
##- name: Record name (service name)[br]
##- value: Target hostname for this SRV record[br]
##- ttl: Time to live, in seconds[br]
##- priority: Record priority[br]
##- weight: Record weight[br]
##- port: Port number for the service[br]
##    [br]
##Optional parameters:[br]
##- comment: A comment for this record[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
## - [param record_id] [String]: DNS record unique ID.[br]
## - [param xname] [String]: Record name (service name).[br]
## - [param value] [String]: Target hostname for this SRV record.[br]
## - [param ttl] [int]: Time to live, in seconds. Must be greater than 0.[br]
## - [param priority] [int]: Record priority.[br]
## - [param weight] [int]: Record weight.[br]
## - [param port] [int]: Port number for the service.[br]
## - [param comment] [String]: A comment for this record.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecord] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_record_srv(domain_id: String, record_id: String, xname: String, value: String, ttl: int, priority: int, weight: int, port: int, comment: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if comment != null and not comment is String:
        return AppwriteException.new("Invalid type for parameter 'comment'. Expected String.", 0, "argument_error", "")

    var _path := '/domains/{domainId}/records/srv/{recordId}'
    _path = _path.replace('{domainId}', str(domain_id))
    _path = _path.replace('{recordId}', str(record_id))

    var _params := {}
    _params['name'] = xname
    _params['value'] = value
    _params['ttl'] = ttl
    _params['priority'] = priority
    _params['weight'] = weight
    _params['port'] = port
    if comment != null:
        _params['comment'] = comment

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDnsRecord

    return await _call('put', _path, _headers, _params, model_script)


## Create a new TXT record for the given domain. TXT records can be used [br]
##to provide additional information about your domain, such as domain [br]
##verification records, SPF records, or DKIM records.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
## - [param xname] [String]: Record name (subdomain) for the TXT record.[br]
## - [param ttl] [int]: Time to live, in seconds. Must be greater than 0.[br]
## - [param value] [String]: TXT record value.[br]
## - [param comment] [String]: A comment for this record.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecord] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_record_txt(domain_id: String, xname: String, ttl: int, value: Variant = null, comment: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if value != null and not value is String:
        return AppwriteException.new("Invalid type for parameter 'value'. Expected String.", 0, "argument_error", "")
    if comment != null and not comment is String:
        return AppwriteException.new("Invalid type for parameter 'comment'. Expected String.", 0, "argument_error", "")

    var _path := '/domains/{domainId}/records/txt'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}
    _params['name'] = xname
    if value != null:
        _params['value'] = value
    _params['ttl'] = ttl
    if comment != null:
        _params['comment'] = comment

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDnsRecord

    return await _call('post', _path, _headers, _params, model_script)


## Update an existing TXT record for the given domain.[br]
##    [br]
##Update the TXT record details for a specific domain by providing the domain ID,[br]
##record ID, and the new record configuration including name, value, TTL, and an optional comment.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
## - [param record_id] [String]: DNS record unique ID.[br]
## - [param xname] [String]: Record name (subdomain) for the TXT record.[br]
## - [param value] [String]: TXT record value.[br]
## - [param ttl] [int]: Time to live, in seconds. Must be greater than 0.[br]
## - [param comment] [String]: A comment for this record.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecord] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_record_txt(domain_id: String, record_id: String, xname: String, value: String, ttl: int, comment: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if comment != null and not comment is String:
        return AppwriteException.new("Invalid type for parameter 'comment'. Expected String.", 0, "argument_error", "")

    var _path := '/domains/{domainId}/records/txt/{recordId}'
    _path = _path.replace('{domainId}', str(domain_id))
    _path = _path.replace('{recordId}', str(record_id))

    var _params := {}
    _params['name'] = xname
    _params['value'] = value
    _params['ttl'] = ttl
    if comment != null:
        _params['comment'] = comment

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDnsRecord

    return await _call('put', _path, _headers, _params, model_script)


## Get a single DNS record for a given domain by record ID.[br]
##    [br]
##This endpoint allows you to retrieve a specific DNS record associated with a domain[br]
##using its unique identifier. The record contains information about the DNS configuration[br]
##such as type, value, and TTL settings.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
## - [param record_id] [String]: DNS record unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDnsRecord] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_record(domain_id: String, record_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/domains/{domainId}/records/{recordId}'
    _path = _path.replace('{domainId}', str(domain_id))
    _path = _path.replace('{recordId}', str(record_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteDnsRecord

    return await _call('get', _path, _headers, _params, model_script)


## Delete a DNS record for the given domain. This endpoint allows you to delete an existing DNS record [br]
##from a specific domain.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
## - [param record_id] [String]: DNS record unique ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_record(domain_id: String, record_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/domains/{domainId}/records/{recordId}'
    _path = _path.replace('{domainId}', str(domain_id))
    _path = _path.replace('{recordId}', str(record_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Update the team ID for a specific domain. This endpoint requires admin access.[br]
##    [br]
##Updating the team ID will transfer ownership and access control of the domain[br]
##and all its DNS records to the new team.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
## - [param team_id] [String]: New team unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDomain] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_team(domain_id: String, team_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/domains/{domainId}/team'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}
    _params['teamId'] = team_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDomain

    return await _call('patch', _path, _headers, _params, model_script)


## Retrieve the current transfer status for a domain. Returns the status, an optional reason, and a timestamp of the last status change.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDomainTransferStatus] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_transfer_status(domain_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/domains/{domainId}/transfers/status'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteDomainTransferStatus

    return await _call('get', _path, _headers, _params, model_script)


## Retrieve the DNS zone file for the given domain. This endpoint will return the DNS[br]
##zone file in a standardized format that can be used to configure DNS servers.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_zone(domain_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/domains/{domainId}/zone'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}

    var _headers := {
    }

    var model_script = null

    return await _call('get', _path, _headers, _params, model_script)


## Update the DNS zone for the given domain using the provided zone file content.[br]
##All parsed records are imported and then the main domain document is returned.[br]
##[br]
## Parameters:[br]
## - [param domain_id] [String]: Domain unique ID.[br]
## - [param content] [String]: DNS zone file content as a string.[br]
##[br]
## Returns:[br]
## - [AppwriteDomain] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_zone(domain_id: String, content: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/domains/{domainId}/zone'
    _path = _path.replace('{domainId}', str(domain_id))

    var _params := {}
    _params['content'] = content

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDomain

    return await _call('put', _path, _headers, _params, model_script)

