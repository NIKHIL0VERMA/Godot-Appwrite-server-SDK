extends "../utils/service.gd"
## The Console service allows you to interact with console relevant information.


## Receive the details of a campaign using its ID.[br]
##[br]
## Parameters:[br]
## - [param campaign_id] [String]: ID of the campaign[br]
##[br]
## Returns:[br]
## - [AppwriteCampaign] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_campaign(campaign_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/console/campaigns/{campaignId}'
    _path = _path.replace('{campaignId}', str(campaign_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteCampaign

    return await _call('get', _path, _headers, _params, model_script)


## Get the details of a coupon using it&#039;s coupon ID.[br]
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

    var _path := '/console/coupons/{couponId}'
    _path = _path.replace('{couponId}', str(coupon_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteCoupon

    return await _call('get', _path, _headers, _params, model_script)


## List all OAuth2 providers supported by the Appwrite server, along with the parameters required to configure each provider. The response excludes mock providers but includes sandbox providers.[br]
##[br]
## Returns:[br]
## - [AppwriteConsoleOAuth2ProviderList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_o_auth2_providers() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/console/oauth2-providers'

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteConsoleOAuth2ProviderList

    return await _call('get', _path, _headers, _params, model_script)


## Return a list of all available plans.[br]
##[br]
## Parameters:[br]
## - [param platform] [String]: Platform type[br]
##[br]
## Returns:[br]
## - [AppwriteBillingPlanList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_plans(platform: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if platform != null and not platform is String:
        return AppwriteException.new("Invalid type for parameter 'platform'. Expected String.", 0, "argument_error", "")

    var _path := '/console/plans'

    var _params := {}
    if platform != null:
        _params['platform'] = platform

    var _headers := {
    }

    var model_script = AppwriteBillingPlanList

    return await _call('get', _path, _headers, _params, model_script)


## Get the details of a plan using its plan ID.[br]
##[br]
## Parameters:[br]
## - [param plan_id] [String]: Plan id[br]
##[br]
## Returns:[br]
## - [AppwriteBillingPlan] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_plan(plan_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/console/plans/{planId}'
    _path = _path.replace('{planId}', str(plan_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteBillingPlan

    return await _call('get', _path, _headers, _params, model_script)


## Receive the details of a program using its ID.[br]
##[br]
## Parameters:[br]
## - [param program_id] [String]: ID of the program[br]
##[br]
## Returns:[br]
## - [AppwriteProgram] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_program(program_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/console/programs/{programId}'
    _path = _path.replace('{programId}', str(program_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteProgram

    return await _call('get', _path, _headers, _params, model_script)


## Create a new membership for an account to a program.[br]
##[br]
## Parameters:[br]
## - [param program_id] [String]: ID of the program[br]
##[br]
## Returns:[br]
## - [AppwriteOrganization] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_program_membership(program_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/console/programs/{programId}/memberships'
    _path = _path.replace('{programId}', str(program_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteOrganization

    return await _call('post', _path, _headers, _params, model_script)


## Get all available regions for the console.[br]
##[br]
## Returns:[br]
## - [AppwriteConsoleRegionList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_regions() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/console/regions'

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteConsoleRegionList

    return await _call('get', _path, _headers, _params, model_script)


## Check if a resource ID is available.[br]
##[br]
## Parameters:[br]
## - [param value] [String]: Resource value.[br]
## - [param xtype] [String]: Resource type.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_resource(value: String, xtype: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/console/resources'

    var _params := {}
    _params['value'] = value
    _params['type'] = xtype

    var _headers := {
    }

    var model_script = null

    return await _call('get', _path, _headers, _params, model_script)


## List all scopes available for organization API keys, along with a description for each scope.[br]
##[br]
## Returns:[br]
## - [AppwriteConsoleKeyScopeList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_organization_scopes() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/console/scopes/organization'

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteConsoleKeyScopeList

    return await _call('get', _path, _headers, _params, model_script)


## List all scopes available for project API keys, along with a description for each scope.[br]
##[br]
## Returns:[br]
## - [AppwriteConsoleKeyScopeList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_project_scopes() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/console/scopes/project'

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteConsoleKeyScopeList

    return await _call('get', _path, _headers, _params, model_script)


## Create a new source.[br]
##[br]
## Parameters:[br]
## - [param ref] [String]: Ref param[br]
## - [param referrer] [String]: Referrer[br]
## - [param utm_source] [String]: Utm source[br]
## - [param utm_campaign] [String]: Utm campaign[br]
## - [param utm_medium] [String]: Utm medium[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_source(ref: Variant = null, referrer: Variant = null, utm_source: Variant = null, utm_campaign: Variant = null, utm_medium: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if ref != null and not ref is String:
        return AppwriteException.new("Invalid type for parameter 'ref'. Expected String.", 0, "argument_error", "")
    if referrer != null and not referrer is String:
        return AppwriteException.new("Invalid type for parameter 'referrer'. Expected String.", 0, "argument_error", "")
    if utm_source != null and not utm_source is String:
        return AppwriteException.new("Invalid type for parameter 'utm_source'. Expected String.", 0, "argument_error", "")
    if utm_campaign != null and not utm_campaign is String:
        return AppwriteException.new("Invalid type for parameter 'utm_campaign'. Expected String.", 0, "argument_error", "")
    if utm_medium != null and not utm_medium is String:
        return AppwriteException.new("Invalid type for parameter 'utm_medium'. Expected String.", 0, "argument_error", "")

    var _path := '/console/sources'

    var _params := {}
    if ref != null:
        _params['ref'] = ref
    if referrer != null:
        _params['referrer'] = referrer
    if utm_source != null:
        _params['utmSource'] = utm_source
    if utm_campaign != null:
        _params['utmCampaign'] = utm_campaign
    if utm_medium != null:
        _params['utmMedium'] = utm_medium

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('post', _path, _headers, _params, model_script)


## Suggests column names and their size limits based on the provided table name. The API will also analyze other tables in the same database to provide context-aware suggestions, ensuring consistency across schema design. Users may optionally provide custom context to further refine the suggestions.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param context] [String]: Optional user provided context to refine suggestions.[br]
## - [param min] [int]: Minimum number of suggestions to generate.[br]
## - [param max] [int]: Maximum number of suggestions to generate.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func suggest_columns(database_id: String, table_id: String, context: Variant = null, min: Variant = null, max: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if context != null and not context is String:
        return AppwriteException.new("Invalid type for parameter 'context'. Expected String.", 0, "argument_error", "")
    if min != null and not min is int:
        return AppwriteException.new("Invalid type for parameter 'min'. Expected int.", 0, "argument_error", "")
    if max != null and not max is int:
        return AppwriteException.new("Invalid type for parameter 'max'. Expected int.", 0, "argument_error", "")

    var _path := '/console/suggestions/columns'

    var _params := {}
    _params['databaseId'] = database_id
    _params['tableId'] = table_id
    if context != null:
        _params['context'] = context
    if min != null:
        _params['min'] = min
    if max != null:
        _params['max'] = max

    var _headers := {
    }

    var model_script = AppwriteColumnList

    return await _call('get', _path, _headers, _params, model_script)


## Suggests database indexes for table columns based on the provided table structure and existing columns. The API will also analyze the table&#039;s column types, names, and patterns to recommend optimal indexes that improve query performance for common database operations like filtering, sorting, and searching.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param min] [int]: Minimum number of suggestions to generate.[br]
## - [param max] [int]: Maximum number of suggestions to generate.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnIndexList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func suggest_indexes(database_id: String, table_id: String, min: Variant = null, max: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if min != null and not min is int:
        return AppwriteException.new("Invalid type for parameter 'min'. Expected int.", 0, "argument_error", "")
    if max != null and not max is int:
        return AppwriteException.new("Invalid type for parameter 'max'. Expected int.", 0, "argument_error", "")

    var _path := '/console/suggestions/indexes'

    var _params := {}
    _params['databaseId'] = database_id
    _params['tableId'] = table_id
    if min != null:
        _params['min'] = min
    if max != null:
        _params['max'] = max

    var _headers := {
    }

    var model_script = AppwriteColumnIndexList

    return await _call('get', _path, _headers, _params, model_script)


## Suggest valid Appwrite query JSON objects for a supported list resource from free-text user intent. The endpoint picks a validator based on `resource` — for system resources it uses the static validator and its allowed attributes, and for user-owned table rows it loads the table schema and validates against those attributes at request time. The returned queries are guaranteed to parse and pass the relevant queries validator.[br]
##[br]
##[br]
## Parameters:[br]
## - [param resource] [String]: Resource to generate queries for.[br]
## - [param input] [String]: Natural language query intent used to generate filters/sorting/pagination.[br]
## - [param database_id] [String]: Database ID. Required when resource is `tables` or `rows`.[br]
## - [param table_id] [String]: Table ID. Required when resource is `rows`.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func suggest_queries(resource: String, input: String, database_id: Variant = null, table_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if database_id != null and not database_id is String:
        return AppwriteException.new("Invalid type for parameter 'database_id'. Expected String.", 0, "argument_error", "")
    if table_id != null and not table_id is String:
        return AppwriteException.new("Invalid type for parameter 'table_id'. Expected String.", 0, "argument_error", "")

    var _path := '/console/suggestions/queries'

    var _params := {}
    _params['resource'] = resource
    _params['input'] = input
    if database_id != null:
        _params['databaseId'] = database_id
    if table_id != null:
        _params['tableId'] = table_id

    var _headers := {
    }

    var model_script = null

    return await _call('get', _path, _headers, _params, model_script)


## Get the Appwrite built-in default email template for the specified type and locale. Always returns the unmodified default, ignoring any custom project overrides.[br]
##[br]
## Parameters:[br]
## - [param template_id] [String]: Email template type. Can be one of: verification, magicSession, recovery, invitation, mfaChallenge, sessionAlert, otpSession[br]
## - [param locale] [String]: Template locale. If left empty, the fallback locale (en) will be used.[br]
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

    var _path := '/console/templates/email/{templateId}'
    _path = _path.replace('{templateId}', str(template_id))

    var _params := {}
    if locale != null:
        _params['locale'] = locale

    var _headers := {
    }

    var model_script = AppwriteEmailTemplate

    return await _call('get', _path, _headers, _params, model_script)


## Get all Environment Variables that are relevant for the console.[br]
##[br]
## Returns:[br]
## - [AppwriteConsoleVariables] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func variables() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/console/variables'

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteConsoleVariables

    return await _call('get', _path, _headers, _params, model_script)

