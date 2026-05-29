extends "../utils/service.gd"
## Service class.


## Get a list of all the teams in which the current user is a member. You can use the parameters to filter your results.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, total, billingPlan, paymentMethodId, backupPaymentMethodId, platform[br]
## - [param search] [String]: Search term to filter your list results. Max length: 256 chars.[br]
##[br]
## Returns:[br]
## - [AppwriteOrganizationList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list(queries: Variant = null, search: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if search != null and not search is String:
        return AppwriteException.new("Invalid type for parameter 'search'. Expected String.", 0, "argument_error", "")

    var _path := '/organizations'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if search != null:
        _params['search'] = search

    var _headers := {
    }

    var model_script = AppwriteOrganizationList

    return await _call('get', _path, _headers, _params, model_script)


## Create a new organization.[br]
##[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Organization name. Max length: 128 chars.[br]
## - [param billing_plan] [String]: Organization billing plan chosen[br]
## - [param payment_method_id] [String]: Payment method ID. Required for pro plans when trial is not available and user doesn&#039;t have default payment method set.[br]
## - [param billing_address_id] [String]: Unique ID of billing address[br]
## - [param invites] [Array]: Additional member invites[br]
## - [param coupon_id] [String]: Coupon id[br]
## - [param tax_id] [String]: Tax Id associated to billing.[br]
## - [param budget] [int]: Budget limit for additional usage set for the organization[br]
## - [param platform] [String]: Platform type[br]
##[br]
## Returns:[br]
## - [AppwriteOrganization] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create(organization_id: String, xname: String, billing_plan: String, payment_method_id: Variant = null, billing_address_id: Variant = null, invites: Variant = null, coupon_id: Variant = null, tax_id: Variant = null, budget: Variant = null, platform: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if payment_method_id != null and not payment_method_id is String:
        return AppwriteException.new("Invalid type for parameter 'payment_method_id'. Expected String.", 0, "argument_error", "")
    if billing_address_id != null and not billing_address_id is String:
        return AppwriteException.new("Invalid type for parameter 'billing_address_id'. Expected String.", 0, "argument_error", "")
    if invites != null and not invites is Array:
        return AppwriteException.new("Invalid type for parameter 'invites'. Expected Array.", 0, "argument_error", "")
    if coupon_id != null and not coupon_id is String:
        return AppwriteException.new("Invalid type for parameter 'coupon_id'. Expected String.", 0, "argument_error", "")
    if tax_id != null and not tax_id is String:
        return AppwriteException.new("Invalid type for parameter 'tax_id'. Expected String.", 0, "argument_error", "")
    if budget != null and not budget is int:
        return AppwriteException.new("Invalid type for parameter 'budget'. Expected int.", 0, "argument_error", "")
    if platform != null and not platform is String:
        return AppwriteException.new("Invalid type for parameter 'platform'. Expected String.", 0, "argument_error", "")

    var _path := '/organizations'

    var _params := {}
    _params['organizationId'] = organization_id
    _params['name'] = xname
    _params['billingPlan'] = billing_plan
    if payment_method_id != null:
        _params['paymentMethodId'] = payment_method_id
    if billing_address_id != null:
        _params['billingAddressId'] = billing_address_id
    if invites != null:
        _params['invites'] = invites
    if coupon_id != null:
        _params['couponId'] = coupon_id
    if tax_id != null:
        _params['taxId'] = tax_id
    if budget != null:
        _params['budget'] = budget
    if platform != null:
        _params['platform'] = platform

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteOrganization

    return await _call('post', _path, _headers, _params, model_script)


## Get estimation for creating an organization.[br]
##[br]
## Parameters:[br]
## - [param billing_plan] [String]: Organization billing plan chosen[br]
## - [param payment_method_id] [String]: Payment method ID. Required for pro plans when trial is not available and user doesn&#039;t have default payment method set.[br]
## - [param invites] [Array]: Additional member invites[br]
## - [param coupon_id] [String]: Coupon id[br]
## - [param platform] [String]: Platform type[br]
##[br]
## Returns:[br]
## - [AppwriteEstimation] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func estimation_create_organization(billing_plan: String, payment_method_id: Variant = null, invites: Variant = null, coupon_id: Variant = null, platform: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if payment_method_id != null and not payment_method_id is String:
        return AppwriteException.new("Invalid type for parameter 'payment_method_id'. Expected String.", 0, "argument_error", "")
    if invites != null and not invites is Array:
        return AppwriteException.new("Invalid type for parameter 'invites'. Expected Array.", 0, "argument_error", "")
    if coupon_id != null and not coupon_id is String:
        return AppwriteException.new("Invalid type for parameter 'coupon_id'. Expected String.", 0, "argument_error", "")
    if platform != null and not platform is String:
        return AppwriteException.new("Invalid type for parameter 'platform'. Expected String.", 0, "argument_error", "")

    var _path := '/organizations/estimations/create-organization'

    var _params := {}
    _params['billingPlan'] = billing_plan
    if payment_method_id != null:
        _params['paymentMethodId'] = payment_method_id
    if invites != null:
        _params['invites'] = invites
    if coupon_id != null:
        _params['couponId'] = coupon_id
    if platform != null:
        _params['platform'] = platform

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteEstimation

    return await _call('patch', _path, _headers, _params, model_script)


## Delete an organization.[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Team ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete(organization_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}'
    _path = _path.replace('{organizationId}', str(organization_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## List all billing addons for an organization.[br]
##[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
##[br]
## Returns:[br]
## - [AppwriteAddonList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_addons(organization_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}/addons'
    _path = _path.replace('{organizationId}', str(organization_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteAddonList

    return await _call('get', _path, _headers, _params, model_script)


## Create the BAA billing addon for an organization.[br]
##[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
##[br]
## Returns:[br]
## - [AppwriteAddon] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_baa_addon(organization_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}/addons/baa'
    _path = _path.replace('{organizationId}', str(organization_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAddon

    return await _call('post', _path, _headers, _params, model_script)


## Get the details of a billing addon for an organization.[br]
##[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
## - [param addon_id] [String]: Addon ID[br]
##[br]
## Returns:[br]
## - [AppwriteAddon] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_addon(organization_id: String, addon_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}/addons/{addonId}'
    _path = _path.replace('{organizationId}', str(organization_id))
    _path = _path.replace('{addonId}', str(addon_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteAddon

    return await _call('get', _path, _headers, _params, model_script)


## Delete a billing addon for an organization.[br]
##[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
## - [param addon_id] [String]: Addon ID[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_addon(organization_id: String, addon_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}/addons/{addonId}'
    _path = _path.replace('{organizationId}', str(organization_id))
    _path = _path.replace('{addonId}', str(addon_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Confirm payment for a billing addon for an organization.[br]
##[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
## - [param addon_id] [String]: Addon ID[br]
##[br]
## Returns:[br]
## - [AppwriteAddon] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func confirm_addon_payment(organization_id: String, addon_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}/addons/{addonId}/confirmations'
    _path = _path.replace('{organizationId}', str(organization_id))
    _path = _path.replace('{addonId}', str(addon_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAddon

    return await _call('post', _path, _headers, _params, model_script)


## Get the price details for a billing addon for an organization.[br]
##[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
## - [param addon] [String]: Addon key identifier (e.g. baa).[br]
##[br]
## Returns:[br]
## - [AppwriteAddonPrice] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_addon_price(organization_id: String, addon: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}/addons/{addon}/price'
    _path = _path.replace('{organizationId}', str(organization_id))
    _path = _path.replace('{addon}', str(addon))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteAddonPrice

    return await _call('get', _path, _headers, _params, model_script)


## Get a list of all aggregations for an organization.[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/databases#querying-documents). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: teamId, aggregationId, from, to[br]
##[br]
## Returns:[br]
## - [AppwriteAggregationTeamList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_aggregations(organization_id: String, queries: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")

    var _path := '/organizations/{organizationId}/aggregations'
    _path = _path.replace('{organizationId}', str(organization_id))

    var _params := {}
    if queries != null:
        _params['queries'] = queries

    var _headers := {
    }

    var model_script = AppwriteAggregationTeamList

    return await _call('get', _path, _headers, _params, model_script)


## Get a specific aggregation using it&#039;s aggregation ID.[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
## - [param aggregation_id] [String]: Invoice unique ID[br]
## - [param limit] [int]: Maximum number of project aggregations to return in response. By default will return maximum 5 results. Maximum of 10 results allowed per request.[br]
## - [param offset] [int]: Offset value. The default value is 0. Use this param to manage pagination.[br]
##[br]
## Returns:[br]
## - [AppwriteAggregationTeam] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_aggregation(organization_id: String, aggregation_id: String, limit: Variant = null, offset: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if limit != null and not limit is int:
        return AppwriteException.new("Invalid type for parameter 'limit'. Expected int.", 0, "argument_error", "")
    if offset != null and not offset is int:
        return AppwriteException.new("Invalid type for parameter 'offset'. Expected int.", 0, "argument_error", "")

    var _path := '/organizations/{organizationId}/aggregations/{aggregationId}'
    _path = _path.replace('{organizationId}', str(organization_id))
    _path = _path.replace('{aggregationId}', str(aggregation_id))

    var _params := {}
    if limit != null:
        _params['limit'] = limit
    if offset != null:
        _params['offset'] = offset

    var _headers := {
    }

    var model_script = AppwriteAggregationTeam

    return await _call('get', _path, _headers, _params, model_script)


## Set a billing address for an organization.[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
## - [param billing_address_id] [String]: Unique ID of billing address[br]
##[br]
## Returns:[br]
## - [AppwriteOrganization] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func set_billing_address(organization_id: String, billing_address_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}/billing-address'
    _path = _path.replace('{organizationId}', str(organization_id))

    var _params := {}
    _params['billingAddressId'] = billing_address_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteOrganization

    return await _call('patch', _path, _headers, _params, model_script)


## Delete a team&#039;s billing address.[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_billing_address(organization_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}/billing-address'
    _path = _path.replace('{organizationId}', str(organization_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Get a billing address using it&#039;s ID.[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
## - [param billing_address_id] [String]: Unique ID of billing address[br]
##[br]
## Returns:[br]
## - [AppwriteBillingAddress] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_billing_address(organization_id: String, billing_address_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}/billing-addresses/{billingAddressId}'
    _path = _path.replace('{organizationId}', str(organization_id))
    _path = _path.replace('{billingAddressId}', str(billing_address_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteBillingAddress

    return await _call('get', _path, _headers, _params, model_script)


## Set the current billing email for the organization.[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
## - [param billing_email] [String]: Billing email for the organization.[br]
##[br]
## Returns:[br]
## - [AppwriteOrganization] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func set_billing_email(organization_id: String, billing_email: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}/billing-email'
    _path = _path.replace('{organizationId}', str(organization_id))

    var _params := {}
    _params['billingEmail'] = billing_email

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteOrganization

    return await _call('patch', _path, _headers, _params, model_script)


## Update the budget limit for an organization.[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization Unique ID[br]
## - [param budget] [int]: Budget limit for additional usage set for the organization[br]
## - [param alerts] [Array]: Budget alert limit percentage[br]
##[br]
## Returns:[br]
## - [AppwriteOrganization] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_budget(organization_id: String, budget: int, alerts: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if alerts != null and not alerts is Array:
        return AppwriteException.new("Invalid type for parameter 'alerts'. Expected Array.", 0, "argument_error", "")

    var _path := '/organizations/{organizationId}/budget'
    _path = _path.replace('{organizationId}', str(organization_id))

    var _params := {}
    _params['budget'] = budget
    if alerts != null:
        _params['alerts'] = alerts

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteOrganization

    return await _call('patch', _path, _headers, _params, model_script)


## List all credits for an organization.[br]
##[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/databases#querying-documents). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: teamId, couponId, credits, expiration, status[br]
##[br]
## Returns:[br]
## - [AppwriteCreditList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_credits(organization_id: String, queries: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")

    var _path := '/organizations/{organizationId}/credits'
    _path = _path.replace('{organizationId}', str(organization_id))

    var _params := {}
    if queries != null:
        _params['queries'] = queries

    var _headers := {
    }

    var model_script = AppwriteCreditList

    return await _call('get', _path, _headers, _params, model_script)


## Add credit to an organization using a coupon.[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
## - [param coupon_id] [String]: ID of the coupon[br]
##[br]
## Returns:[br]
## - [AppwriteCredit] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func add_credit(organization_id: String, coupon_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}/credits'
    _path = _path.replace('{organizationId}', str(organization_id))

    var _params := {}
    _params['couponId'] = coupon_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteCredit

    return await _call('post', _path, _headers, _params, model_script)


## Get total available valid credits for an organization.[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
##[br]
## Returns:[br]
## - [AppwriteCreditAvailable] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_available_credits(organization_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}/credits/available'
    _path = _path.replace('{organizationId}', str(organization_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteCreditAvailable

    return await _call('get', _path, _headers, _params, model_script)


## Get credit details.[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
## - [param credit_id] [String]: Credit Unique ID[br]
##[br]
## Returns:[br]
## - [AppwriteCredit] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_credit(organization_id: String, credit_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}/credits/{creditId}'
    _path = _path.replace('{organizationId}', str(organization_id))
    _path = _path.replace('{creditId}', str(credit_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteCredit

    return await _call('get', _path, _headers, _params, model_script)


## Get estimation for deleting an organization.[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Team ID.[br]
##[br]
## Returns:[br]
## - [AppwriteEstimationDeleteOrganization] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func estimation_delete_organization(organization_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}/estimations/delete-organization'
    _path = _path.replace('{organizationId}', str(organization_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteEstimationDeleteOrganization

    return await _call('patch', _path, _headers, _params, model_script)


## Get estimation for updating the organization plan.[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
## - [param billing_plan] [String]: Organization billing plan chosen[br]
## - [param invites] [Array]: Additional member invites[br]
## - [param coupon_id] [String]: Coupon id[br]
##[br]
## Returns:[br]
## - [AppwriteEstimationUpdatePlan] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func estimation_update_plan(organization_id: String, billing_plan: String, invites: Variant = null, coupon_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if invites != null and not invites is Array:
        return AppwriteException.new("Invalid type for parameter 'invites'. Expected Array.", 0, "argument_error", "")
    if coupon_id != null and not coupon_id is String:
        return AppwriteException.new("Invalid type for parameter 'coupon_id'. Expected String.", 0, "argument_error", "")

    var _path := '/organizations/{organizationId}/estimations/update-plan'
    _path = _path.replace('{organizationId}', str(organization_id))

    var _params := {}
    _params['billingPlan'] = billing_plan
    if invites != null:
        _params['invites'] = invites
    if coupon_id != null:
        _params['couponId'] = coupon_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteEstimationUpdatePlan

    return await _call('patch', _path, _headers, _params, model_script)


## Submit feedback about downgrading from a paid plan to a lower tier. This helps the team understand user experience and improve the platform.[br]
##[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization Unique ID[br]
## - [param reason] [String]: Feedback reason[br]
## - [param message] [String]: Feedback message[br]
## - [param from_plan_id] [String]: Plan downgrading from[br]
## - [param to_plan_id] [String]: Plan downgrading to[br]
##[br]
## Returns:[br]
## - [AppwriteDowngradeFeedback] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_downgrade_feedback(organization_id: String, reason: String, message: String, from_plan_id: String, to_plan_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}/feedbacks/downgrade'
    _path = _path.replace('{organizationId}', str(organization_id))

    var _params := {}
    _params['reason'] = reason
    _params['message'] = message
    _params['fromPlanId'] = from_plan_id
    _params['toPlanId'] = to_plan_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDowngradeFeedback

    return await _call('post', _path, _headers, _params, model_script)


## List all invoices for an organization.[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/databases#querying-documents). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: teamId, aggregationId, type, amount, currency, from, to, dueAt, attempts, status, grossAmount[br]
##[br]
## Returns:[br]
## - [AppwriteInvoiceList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_invoices(organization_id: String, queries: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")

    var _path := '/organizations/{organizationId}/invoices'
    _path = _path.replace('{organizationId}', str(organization_id))

    var _params := {}
    if queries != null:
        _params['queries'] = queries

    var _headers := {
    }

    var model_script = AppwriteInvoiceList

    return await _call('get', _path, _headers, _params, model_script)


## Get an invoice by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
## - [param invoice_id] [String]: Invoice unique ID[br]
##[br]
## Returns:[br]
## - [AppwriteInvoice] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_invoice(organization_id: String, invoice_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}/invoices/{invoiceId}'
    _path = _path.replace('{organizationId}', str(organization_id))
    _path = _path.replace('{invoiceId}', str(invoice_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteInvoice

    return await _call('get', _path, _headers, _params, model_script)


## Download invoice in PDF[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
## - [param invoice_id] [String]: Invoice unique ID[br]
##[br]
## Returns:[br]
## - [AppwritePaymentMethod] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_invoice_download(organization_id: String, invoice_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}/invoices/{invoiceId}/download'
    _path = _path.replace('{organizationId}', str(organization_id))
    _path = _path.replace('{invoiceId}', str(invoice_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwritePaymentMethod

    return await _call('get', _path, _headers, _params, model_script)


## Initiate payment for failed invoice to pay live from console[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
## - [param invoice_id] [String]: Invoice unique ID[br]
## - [param payment_method_id] [String]: Payment method ID[br]
##[br]
## Returns:[br]
## - [AppwriteInvoice] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_invoice_payment(organization_id: String, invoice_id: String, payment_method_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}/invoices/{invoiceId}/payments'
    _path = _path.replace('{organizationId}', str(organization_id))
    _path = _path.replace('{invoiceId}', str(invoice_id))

    var _params := {}
    _params['paymentMethodId'] = payment_method_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteInvoice

    return await _call('post', _path, _headers, _params, model_script)


## Validates the payment linked with the invoice and updates the invoice status if the payment status is changed.[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
## - [param invoice_id] [String]: Invoice unique ID[br]
##[br]
## Returns:[br]
## - [AppwriteInvoice] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func validate_invoice(organization_id: String, invoice_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}/invoices/{invoiceId}/status'
    _path = _path.replace('{organizationId}', str(organization_id))
    _path = _path.replace('{invoiceId}', str(invoice_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteInvoice

    return await _call('patch', _path, _headers, _params, model_script)


## View invoice in PDF[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
## - [param invoice_id] [String]: Invoice unique ID[br]
##[br]
## Returns:[br]
## - [AppwritePaymentMethod] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_invoice_view(organization_id: String, invoice_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}/invoices/{invoiceId}/view'
    _path = _path.replace('{organizationId}', str(organization_id))
    _path = _path.replace('{invoiceId}', str(invoice_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwritePaymentMethod

    return await _call('get', _path, _headers, _params, model_script)


## Set a organization&#039;s default payment method.[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
## - [param payment_method_id] [String]: Unique ID of payment method[br]
##[br]
## Returns:[br]
## - [AppwriteOrganization] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func set_default_payment_method(organization_id: String, payment_method_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}/payment-method'
    _path = _path.replace('{organizationId}', str(organization_id))

    var _params := {}
    _params['paymentMethodId'] = payment_method_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteOrganization

    return await _call('patch', _path, _headers, _params, model_script)


## Delete the default payment method for an organization.[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
##[br]
## Returns:[br]
## - [AppwriteOrganization] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_default_payment_method(organization_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}/payment-method'
    _path = _path.replace('{organizationId}', str(organization_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteOrganization

    return await _call('delete', _path, _headers, _params, model_script)


## Set an organization&#039;s backup payment method.[br]
##[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
## - [param payment_method_id] [String]: Unique ID of payment method[br]
##[br]
## Returns:[br]
## - [AppwriteOrganization] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func set_backup_payment_method(organization_id: String, payment_method_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}/payment-method/backup'
    _path = _path.replace('{organizationId}', str(organization_id))

    var _params := {}
    _params['paymentMethodId'] = payment_method_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteOrganization

    return await _call('patch', _path, _headers, _params, model_script)


## Delete a backup payment method for an organization.[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
##[br]
## Returns:[br]
## - [AppwriteOrganization] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_backup_payment_method(organization_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}/payment-method/backup'
    _path = _path.replace('{organizationId}', str(organization_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteOrganization

    return await _call('delete', _path, _headers, _params, model_script)


## Get an organization&#039;s payment method using it&#039;s payment method ID.[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
## - [param payment_method_id] [String]: Unique ID of payment method[br]
##[br]
## Returns:[br]
## - [AppwritePaymentMethod] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_payment_method(organization_id: String, payment_method_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}/payment-methods/{paymentMethodId}'
    _path = _path.replace('{organizationId}', str(organization_id))
    _path = _path.replace('{paymentMethodId}', str(payment_method_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwritePaymentMethod

    return await _call('get', _path, _headers, _params, model_script)


## Get the details of the current billing plan for an organization.[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization Unique ID[br]
##[br]
## Returns:[br]
## - [AppwriteBillingPlan] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_plan(organization_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}/plan'
    _path = _path.replace('{organizationId}', str(organization_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteBillingPlan

    return await _call('get', _path, _headers, _params, model_script)


## Update the billing plan for an organization.[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization Unique ID[br]
## - [param billing_plan] [String]: Organization billing plan chosen[br]
## - [param payment_method_id] [String]: Payment method ID. Required for pro plans when trial is not available and user doesn&#039;t have default payment method set.[br]
## - [param billing_address_id] [String]: Unique ID of billing address[br]
## - [param invites] [Array]: Additional member invites[br]
## - [param coupon_id] [String]: Coupon id[br]
## - [param tax_id] [String]: Tax Id associated to billing.[br]
## - [param budget] [int]: Budget limit for additional usage set for the organization[br]
##[br]
## Returns:[br]
## - [AppwriteOrganization] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_plan(organization_id: String, billing_plan: String, payment_method_id: Variant = null, billing_address_id: Variant = null, invites: Variant = null, coupon_id: Variant = null, tax_id: Variant = null, budget: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if payment_method_id != null and not payment_method_id is String:
        return AppwriteException.new("Invalid type for parameter 'payment_method_id'. Expected String.", 0, "argument_error", "")
    if billing_address_id != null and not billing_address_id is String:
        return AppwriteException.new("Invalid type for parameter 'billing_address_id'. Expected String.", 0, "argument_error", "")
    if invites != null and not invites is Array:
        return AppwriteException.new("Invalid type for parameter 'invites'. Expected Array.", 0, "argument_error", "")
    if coupon_id != null and not coupon_id is String:
        return AppwriteException.new("Invalid type for parameter 'coupon_id'. Expected String.", 0, "argument_error", "")
    if tax_id != null and not tax_id is String:
        return AppwriteException.new("Invalid type for parameter 'tax_id'. Expected String.", 0, "argument_error", "")
    if budget != null and not budget is int:
        return AppwriteException.new("Invalid type for parameter 'budget'. Expected int.", 0, "argument_error", "")

    var _path := '/organizations/{organizationId}/plan'
    _path = _path.replace('{organizationId}', str(organization_id))

    var _params := {}
    _params['billingPlan'] = billing_plan
    if payment_method_id != null:
        _params['paymentMethodId'] = payment_method_id
    if billing_address_id != null:
        _params['billingAddressId'] = billing_address_id
    if invites != null:
        _params['invites'] = invites
    if coupon_id != null:
        _params['couponId'] = coupon_id
    if tax_id != null:
        _params['taxId'] = tax_id
    if budget != null:
        _params['budget'] = budget

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteOrganization

    return await _call('patch', _path, _headers, _params, model_script)


## Cancel the downgrade initiated for an organization.[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization Unique ID[br]
##[br]
## Returns:[br]
## - [AppwriteOrganization] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func cancel_downgrade(organization_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}/plan/cancel'
    _path = _path.replace('{organizationId}', str(organization_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteOrganization

    return await _call('patch', _path, _headers, _params, model_script)


## Create a billing plan estimation for upgrading or downgrading an organization plan.[br]
##[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
## - [param billing_plan] [String]: Target billing plan[br]
## - [param invites] [Array]: Additional member invites[br]
## - [param coupon_id] [String]: Coupon id[br]
##[br]
## Returns:[br]
## - [AppwriteEstimationPlanChange] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_plan_estimation(organization_id: String, billing_plan: String, invites: Variant = null, coupon_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if invites != null and not invites is Array:
        return AppwriteException.new("Invalid type for parameter 'invites'. Expected Array.", 0, "argument_error", "")
    if coupon_id != null and not coupon_id is String:
        return AppwriteException.new("Invalid type for parameter 'coupon_id'. Expected String.", 0, "argument_error", "")

    var _path := '/organizations/{organizationId}/plan/estimations'
    _path = _path.replace('{organizationId}', str(organization_id))

    var _params := {}
    _params['billingPlan'] = billing_plan
    if invites != null:
        _params['invites'] = invites
    if coupon_id != null:
        _params['couponId'] = coupon_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteEstimationPlanChange

    return await _call('post', _path, _headers, _params, model_script)


## Get all available regions for an organization.[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Team ID.[br]
##[br]
## Returns:[br]
## - [AppwriteConsoleRegionList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_regions(organization_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}/regions'
    _path = _path.replace('{organizationId}', str(organization_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteConsoleRegionList

    return await _call('get', _path, _headers, _params, model_script)


## Get Scopes[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization id[br]
## - [param project_id] [String]: Project id[br]
##[br]
## Returns:[br]
## - [AppwriteRoles] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_scopes(organization_id: String, project_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if project_id != null and not project_id is String:
        return AppwriteException.new("Invalid type for parameter 'project_id'. Expected String.", 0, "argument_error", "")

    var _path := '/organizations/{organizationId}/roles'
    _path = _path.replace('{organizationId}', str(organization_id))

    var _params := {}
    if project_id != null:
        _params['projectId'] = project_id

    var _headers := {
    }

    var model_script = AppwriteRoles

    return await _call('get', _path, _headers, _params, model_script)


## Set an organization&#039;s billing tax ID.[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
## - [param tax_id] [String]: Tax Id associated to billing.[br]
##[br]
## Returns:[br]
## - [AppwriteOrganization] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func set_billing_tax_id(organization_id: String, tax_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/organizations/{organizationId}/taxId'
    _path = _path.replace('{organizationId}', str(organization_id))

    var _params := {}
    _params['taxId'] = tax_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteOrganization

    return await _call('patch', _path, _headers, _params, model_script)


## Get the usage data for an organization.[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
## - [param start_date] [String]: Starting date for the usage[br]
## - [param end_date] [String]: End date for the usage[br]
##[br]
## Returns:[br]
## - [AppwriteUsageOrganization] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_usage(organization_id: String, start_date: Variant = null, end_date: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if start_date != null and not start_date is String:
        return AppwriteException.new("Invalid type for parameter 'start_date'. Expected String.", 0, "argument_error", "")
    if end_date != null and not end_date is String:
        return AppwriteException.new("Invalid type for parameter 'end_date'. Expected String.", 0, "argument_error", "")

    var _path := '/organizations/{organizationId}/usage'
    _path = _path.replace('{organizationId}', str(organization_id))

    var _params := {}
    if start_date != null:
        _params['startDate'] = start_date
    if end_date != null:
        _params['endDate'] = end_date

    var _headers := {
    }

    var model_script = AppwriteUsageOrganization

    return await _call('get', _path, _headers, _params, model_script)


## Validate payment for team after creation or upgrade.[br]
##[br]
## Parameters:[br]
## - [param organization_id] [String]: Organization ID[br]
## - [param invites] [Array]: Additional member invites[br]
##[br]
## Returns:[br]
## - [AppwriteOrganization] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func validate_payment(organization_id: String, invites: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if invites != null and not invites is Array:
        return AppwriteException.new("Invalid type for parameter 'invites'. Expected Array.", 0, "argument_error", "")

    var _path := '/organizations/{organizationId}/validate'
    _path = _path.replace('{organizationId}', str(organization_id))

    var _params := {}
    if invites != null:
        _params['invites'] = invites

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteOrganization

    return await _call('patch', _path, _headers, _params, model_script)

