extends "../utils/service.gd"
## The Proxy Service allows you to configure actions for your domains beyond DNS configuration.


## Get a list of all the proxy rules. You can use the query params to filter your results.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/databases#querying-documents). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: domain, type, trigger, deploymentResourceType, deploymentResourceId, deploymentId, deploymentVcsProviderBranch[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteProxyRuleList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_rules(queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/proxy/rules'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteProxyRuleList


    return await _call('get', _path, _headers, _params, model_script)


## Create a new proxy rule for serving Appwrite&#039;s API on custom domain.[br]
##[br]
##Rule ID is automatically generated as MD5 hash of a rule domain for performance purposes.[br]
##[br]
## Parameters:[br]
## - [param domain] [String]: Domain name.[br]
##[br]
## Returns:[br]
## - [AppwriteProxyRule] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_api_rule(domain: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/proxy/rules/api'

    var _params := {}
    _params['domain'] = domain

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteProxyRule


    return await _call('post', _path, _headers, _params, model_script)


## Create a new proxy rule for executing Appwrite Function on custom domain.[br]
##[br]
##Rule ID is automatically generated as MD5 hash of a rule domain for performance purposes.[br]
##[br]
## Parameters:[br]
## - [param domain] [String]: Domain name.[br]
## - [param function_id] [String]: ID of function to be executed.[br]
## - [param branch] [String]: Name of VCS branch to deploy changes automatically[br]
##[br]
## Returns:[br]
## - [AppwriteProxyRule] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_function_rule(domain: String, function_id: String, branch: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if branch != null and not branch is String:
        return AppwriteException.new("Invalid type for parameter 'branch'. Expected String.", 0, "argument_error", "")

    var _path := '/proxy/rules/function'

    var _params := {}
    _params['domain'] = domain
    _params['functionId'] = function_id
    if branch != null:
        _params['branch'] = branch

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteProxyRule


    return await _call('post', _path, _headers, _params, model_script)


## Create a new proxy rule for to redirect from custom domain to another domain.[br]
##[br]
##Rule ID is automatically generated as MD5 hash of a rule domain for performance purposes.[br]
##[br]
## Parameters:[br]
## - [param domain] [String]: Domain name.[br]
## - [param url] [String]: Target URL of redirection[br]
## - [param status_code] [String]: Status code of redirection[br]
## - [param resource_id] [String]: ID of parent resource.[br]
## - [param resource_type] [String]: Type of parent resource.[br]
##[br]
## Returns:[br]
## - [AppwriteProxyRule] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_redirect_rule(domain: String, url: String, status_code: String, resource_id: String, resource_type: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/proxy/rules/redirect'

    var _params := {}
    _params['domain'] = domain
    _params['url'] = url
    _params['statusCode'] = status_code
    _params['resourceId'] = resource_id
    _params['resourceType'] = resource_type

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteProxyRule


    return await _call('post', _path, _headers, _params, model_script)


## Create a new proxy rule for serving Appwrite Site on custom domain.[br]
##[br]
##Rule ID is automatically generated as MD5 hash of a rule domain for performance purposes.[br]
##[br]
## Parameters:[br]
## - [param domain] [String]: Domain name.[br]
## - [param site_id] [String]: ID of site to be executed.[br]
## - [param branch] [String]: Name of VCS branch to deploy changes automatically[br]
##[br]
## Returns:[br]
## - [AppwriteProxyRule] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_site_rule(domain: String, site_id: String, branch: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if branch != null and not branch is String:
        return AppwriteException.new("Invalid type for parameter 'branch'. Expected String.", 0, "argument_error", "")

    var _path := '/proxy/rules/site'

    var _params := {}
    _params['domain'] = domain
    _params['siteId'] = site_id
    if branch != null:
        _params['branch'] = branch

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteProxyRule


    return await _call('post', _path, _headers, _params, model_script)


## Get a proxy rule by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param rule_id] [String]: Rule ID.[br]
##[br]
## Returns:[br]
## - [AppwriteProxyRule] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_rule(rule_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/proxy/rules/{ruleId}'
    _path = _path.replace('{ruleId}', rule_id.uri_encode())

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteProxyRule


    return await _call('get', _path, _headers, _params, model_script)


## Delete a proxy rule by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param rule_id] [String]: Rule ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_rule(rule_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/proxy/rules/{ruleId}'
    _path = _path.replace('{ruleId}', rule_id.uri_encode())

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null


    return await _call('delete', _path, _headers, _params, model_script)


## If not succeeded yet, retry verification process of a proxy rule domain. This endpoint triggers domain verification by checking DNS records. If verification is successful, a TLS certificate will be automatically provisioned for the domain asynchronously in the background.[br]
##[br]
## Parameters:[br]
## - [param rule_id] [String]: Rule ID.[br]
##[br]
## Returns:[br]
## - [AppwriteProxyRule] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_rule_status(rule_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/proxy/rules/{ruleId}/status'
    _path = _path.replace('{ruleId}', rule_id.uri_encode())

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteProxyRule


    return await _call('patch', _path, _headers, _params, model_script)

