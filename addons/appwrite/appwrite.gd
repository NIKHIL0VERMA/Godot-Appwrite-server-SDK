extends Node
## [img width=32]res://addons/appwrite/icon.svg[/img] Appwrite backend as a service cuts up to 70% of the time and costs required for building a modern application. We abstract and simplify common development tasks behind a REST APIs, to help you develop your app in a fast and secure way. For full API documentation and tutorials go to [https://appwrite.io/docs](https://appwrite.io/docs)

signal on_progress(progress: float, total_size: int, uploaded_size: int)

# Internal classes for type hinting
const _ACCOUNT = preload("services/account.gd")
const _ACTIVITIES = preload("services/activities.gd")
const _AVATARS = preload("services/avatars.gd")
const _BACKUPS = preload("services/backups.gd")
const _COMPUTE = preload("services/compute.gd")
const _ASSISTANT = preload("services/assistant.gd")
const _CONSOLE = preload("services/console.gd")
const _DATABASES = preload("services/databases.gd")
const _DOMAINS = preload("services/domains.gd")
const _FUNCTIONS = preload("services/functions.gd")
const _GRAPHQL = preload("services/graphql.gd")
const _HEALTH = preload("services/health.gd")
const _LOCALE = preload("services/locale.gd")
const _MANAGER = preload("services/manager.gd")
const _MESSAGING = preload("services/messaging.gd")
const _MIGRATIONS = preload("services/migrations.gd")
const _ORGANIZATION = preload("services/organization.gd")
const _ORGANIZATIONS = preload("services/organizations.gd")
const _PRESENCES = preload("services/presences.gd")
const _PROJECT = preload("services/project.gd")
const _PROJECTS = preload("services/projects.gd")
const _PROXY = preload("services/proxy.gd")
const _ADVISOR = preload("services/advisor.gd")
const _SITES = preload("services/sites.gd")
const _STORAGE = preload("services/storage.gd")
const _TABLESDB = preload("services/tables_db.gd")
const _TEAMS = preload("services/teams.gd")
const _TOKENS = preload("services/tokens.gd")
const _USAGE = preload("services/usage.gd")
const _USERS = preload("services/users.gd")
const _VCS = preload("services/vcs.gd")
const _WEBHOOKS = preload("services/webhooks.gd")

var _client := preload("utils/client.gd").new()
var account : _ACCOUNT = _ACCOUNT.new(_client) ## The Account service allows you to authenticate and manage a user account.
var activities : _ACTIVITIES = _ACTIVITIES.new(_client) ## No description is provided
var avatars : _AVATARS = _AVATARS.new(_client) ## The Avatars service aims to help you complete everyday tasks related to your app image, icons, and avatars.
var backups : _BACKUPS = _BACKUPS.new(_client) ## No description is provided
var compute : _COMPUTE = _COMPUTE.new(_client) ## No description is provided
var assistant : _ASSISTANT = _ASSISTANT.new(_client) ## No description is provided
var console : _CONSOLE = _CONSOLE.new(_client) ## The Console service allows you to interact with console relevant information.
var databases : _DATABASES = _DATABASES.new(_client) ## The Databases service allows you to create structured collections of documents, query and filter lists of documents
var domains : _DOMAINS = _DOMAINS.new(_client) ## No description is provided
var functions : _FUNCTIONS = _FUNCTIONS.new(_client) ## The Functions Service allows you view, create and manage your Cloud Functions.
var graphql : _GRAPHQL = _GRAPHQL.new(_client) ## The GraphQL API allows you to query and mutate your Appwrite server using GraphQL.
var health : _HEALTH = _HEALTH.new(_client) ## The Health service allows you to both validate and monitor your Appwrite server&#039;s health.
var locale : _LOCALE = _LOCALE.new(_client) ## The Locale service allows you to customize your app based on your users&#039; location.
var manager : _MANAGER = _MANAGER.new(_client) ## No description is provided
var messaging : _MESSAGING = _MESSAGING.new(_client) ## The Messaging service allows you to send messages to any provider type (SMTP, push notification, SMS, etc.).
var migrations : _MIGRATIONS = _MIGRATIONS.new(_client) ## The Migrations service allows you to migrate third-party data to your Appwrite project.
var organization : _ORGANIZATION = _ORGANIZATION.new(_client) ## No description is provided
var organizations : _ORGANIZATIONS = _ORGANIZATIONS.new(_client) ## No description is provided
var presences : _PRESENCES = _PRESENCES.new(_client) ## No description is provided
var project : _PROJECT = _PROJECT.new(_client) ## The Project service allows you to manage all the projects in your Appwrite server.
var projects : _PROJECTS = _PROJECTS.new(_client) ## The Project service allows you to manage all the projects in your Appwrite server.
var proxy : _PROXY = _PROXY.new(_client) ## The Proxy Service allows you to configure actions for your domains beyond DNS configuration.
var advisor : _ADVISOR = _ADVISOR.new(_client) ## The Advisor service surfaces actionable reports about your project resources, with CTA descriptors for one-click remediation in the console.
var sites : _SITES = _SITES.new(_client) ## The Sites Service allows you view, create and manage your web applications.
var storage : _STORAGE = _STORAGE.new(_client) ## The Storage service allows you to manage your project files.
var tablesDB : _TABLESDB = _TABLESDB.new(_client) ## No description is provided
var teams : _TEAMS = _TEAMS.new(_client) ## The Teams service allows you to group users of your project and to enable them to share read and write access to your project resources
var tokens : _TOKENS = _TOKENS.new(_client) ## No description is provided
var usage : _USAGE = _USAGE.new(_client) ## No description is provided
var users : _USERS = _USERS.new(_client) ## The Users service allows you to manage your project users.
var vcs : _VCS = _VCS.new(_client) ## No description is provided
var webhooks : _WEBHOOKS = _WEBHOOKS.new(_client) ## No description is provided

# Exposing the Enums
const ACCOUNTKEYSCOPES = preload("enums/account_key_scopes.gd")
const AUTHENTICATORTYPE = preload("enums/authenticator_type.gd")
const AUTHENTICATIONFACTOR = preload("enums/authentication_factor.gd")
const OAUTHPROVIDER = preload("enums/o_auth_provider.gd")
const BROWSER = preload("enums/browser.gd")
const CREDITCARD = preload("enums/credit_card.gd")
const FLAG = preload("enums/flag.gd")
const BROWSERTHEME = preload("enums/browser_theme.gd")
const TIMEZONE = preload("enums/timezone.gd")
const BROWSERPERMISSION = preload("enums/browser_permission.gd")
const IMAGEFORMAT = preload("enums/image_format.gd")
const BACKUPSERVICES = preload("enums/backup_services.gd")
const PLATFORM = preload("enums/platform.gd")
const CONSOLERESOURCETYPE = preload("enums/console_resource_type.gd")
const QUERYSUGGESTIONRESOURCE = preload("enums/query_suggestion_resource.gd")
const PROJECTEMAILTEMPLATEID = preload("enums/project_email_template_id.gd")
const PROJECTEMAILTEMPLATELOCALE = preload("enums/project_email_template_locale.gd")
const USAGERANGE = preload("enums/usage_range.gd")
const RELATIONSHIPTYPE = preload("enums/relationship_type.gd")
const RELATIONMUTATE = preload("enums/relation_mutate.gd")
const DATABASESINDEXTYPE = preload("enums/databases_index_type.gd")
const ORDERBY = preload("enums/order_by.gd")
const DOMAINREGISTRATIONTYPE = preload("enums/domain_registration_type.gd")
const DOMAINSUGGESTIONTYPE = preload("enums/domain_suggestion_type.gd")
const FUNCTIONRUNTIME = preload("enums/function_runtime.gd")
const PROJECTKEYSCOPES = preload("enums/project_key_scopes.gd")
const FUNCTIONTEMPLATEUSECASE = preload("enums/function_template_use_case.gd")
const TEMPLATEREFERENCETYPE = preload("enums/template_reference_type.gd")
const VCSREFERENCETYPE = preload("enums/vcs_reference_type.gd")
const DEPLOYMENTDOWNLOADTYPE = preload("enums/deployment_download_type.gd")
const EXECUTIONMETHOD = preload("enums/execution_method.gd")
const HEALTHQUEUENAME = preload("enums/health_queue_name.gd")
const BLOCKRESOURCETYPE = preload("enums/block_resource_type.gd")
const MESSAGEPRIORITY = preload("enums/message_priority.gd")
const SMTPENCRYPTION = preload("enums/smtp_encryption.gd")
const APPWRITEMIGRATIONRESOURCE = preload("enums/appwrite_migration_resource.gd")
const MIGRATIONONDUPLICATE = preload("enums/migration_on_duplicate.gd")
const FIREBASEMIGRATIONRESOURCE = preload("enums/firebase_migration_resource.gd")
const NHOSTMIGRATIONRESOURCE = preload("enums/n_host_migration_resource.gd")
const SUPABASEMIGRATIONRESOURCE = preload("enums/supabase_migration_resource.gd")
const ORGANIZATIONKEYSCOPES = preload("enums/organization_key_scopes.gd")
const REGION = preload("enums/region.gd")
const ORGANIZATIONADDON = preload("enums/organization_addon.gd")
const PROJECTAUTHMETHODID = preload("enums/project_auth_method_id.gd")
const PROJECTOAUTH2GOOGLEPROMPT = preload("enums/project_o_auth2_google_prompt.gd")
const PROJECTOAUTHPROVIDERID = preload("enums/project_o_auth_provider_id.gd")
const PROJECTPOLICYID = preload("enums/project_policy_id.gd")
const PROJECTPROTOCOLID = preload("enums/project_protocol_id.gd")
const PROJECTSERVICEID = preload("enums/project_service_id.gd")
const PROJECTSMTPSECURE = preload("enums/project_smtp_secure.gd")
const PROJECTUSAGERANGE = preload("enums/project_usage_range.gd")
const SCHEDULERESOURCETYPE = preload("enums/schedule_resource_type.gd")
const PROJECTSTATUS = preload("enums/project_status.gd")
const REDIRECTSTATUSCODE = preload("enums/redirect_status_code.gd")
const PROXYRESOURCETYPE = preload("enums/proxy_resource_type.gd")
const SITEFRAMEWORK = preload("enums/site_framework.gd")
const SITEBUILDRUNTIME = preload("enums/site_build_runtime.gd")
const SITEADAPTER = preload("enums/site_adapter.gd")
const SITETEMPLATEUSECASE = preload("enums/site_template_use_case.gd")
const COMPRESSION = preload("enums/compression.gd")
const IMAGEGRAVITY = preload("enums/image_gravity.gd")
const TABLESDBINDEXTYPE = preload("enums/tables_db_index_type.gd")
const PASSWORDHASH = preload("enums/password_hash.gd")
const MESSAGINGPROVIDERTYPE = preload("enums/messaging_provider_type.gd")
const VCSDETECTIONTYPE = preload("enums/vcs_detection_type.gd")
const DATABASETYPE = preload("enums/database_type.gd")
const ATTRIBUTESTATUS = preload("enums/attribute_status.gd")
const COLUMNSTATUS = preload("enums/column_status.gd")
const INDEXSTATUS = preload("enums/index_status.gd")
const DETECTIONFRAMEWORKTYPE = preload("enums/detection_framework_type.gd")
const DETECTIONRUNTIMETYPE = preload("enums/detection_runtime_type.gd")
const DEPLOYMENTSTATUS = preload("enums/deployment_status.gd")
const EXECUTIONTRIGGER = preload("enums/execution_trigger.gd")
const EXECUTIONSTATUS = preload("enums/execution_status.gd")
const OAUTH2GOOGLEPROMPT = preload("enums/o_auth2_google_prompt.gd")
const PLATFORMTYPE = preload("enums/platform_type.gd")
const HEALTHANTIVIRUSSTATUS = preload("enums/health_antivirus_status.gd")
const HEALTHCHECKSTATUS = preload("enums/health_check_status.gd")
const PROXYRULEDEPLOYMENTRESOURCETYPE = preload("enums/proxy_rule_deployment_resource_type.gd")
const PROXYRULESTATUS = preload("enums/proxy_rule_status.gd")
const MESSAGESTATUS = preload("enums/message_status.gd")
const BILLINGPLANGROUP = preload("enums/billing_plan_group.gd")
const DOMAINTRANSFERSTATUSENUM = preload("enums/domain_transfer_status_enum.gd")
const DOMAINPURCHASESTATUS = preload("enums/domain_purchase_status.gd")

func _ready() -> void:
    _client.on_progress.connect(func(p, t, c): on_progress.emit(p, t, c))
    var path = "res://.env"
    if not FileAccess.file_exists(path):
        return

    var file = FileAccess.open(path, FileAccess.READ)
    if file == null:
        push_error("Failed to open env file: %s" % path)
        return

    while not file.eof_reached():
        var line = file.get_line().strip_edges()
        if line.is_empty() or line.begins_with("#"):
            continue

        var parts = line.split("=", true, 1)
        if parts.size() != 2:
            continue

        var key = parts[0].strip_edges()
        var value = parts[1].strip_edges()

        # Remove quotes if present
        if (value.begins_with("\"") and value.ends_with("\"")) or (value.begins_with("'") and value.ends_with("'")):
            value = value.substr(1, value.length() - 2)

        _apply_env(key, value)

    file = null

## Your project ID
func set_project(value: String) -> Appwrite:
    _client.set_project(value)
    return self

## Your secret API key
func set_key(value: String) -> Appwrite:
    _client.set_key(value)
    return self

## Your secret JSON Web Token
func set_jwt(value: String) -> Appwrite:
    _client.set_jwt(value)
    return self

func set_locale(value: String) -> Appwrite:
    _client.set_locale(value)
    return self

func set_mode(value: String) -> Appwrite:
    _client.set_mode(value)
    return self

## The user cookie to authenticate with. Used by SDKs that forward an incoming Cookie header in server-side runtimes.
func set_cookie(value: String) -> Appwrite:
    _client.set_cookie(value)
    return self

## The user session to authenticate with
func set_session(value: String) -> Appwrite:
    _client.set_session(value)
    return self

## Your secret dev API key
func set_dev_key(value: String) -> Appwrite:
    _client.set_dev_key(value)
    return self

## Impersonate a user by ID on an already user-authenticated request. Requires the current request to be authenticated as a user with impersonator capability; X-Appwrite-Key alone is not sufficient. Impersonator users are intentionally granted users.read so they can discover a target before impersonation begins. Internal audit logs still attribute actions to the original impersonator and record the impersonated target only in internal audit payload data.
func set_impersonate_user_id(value: String) -> Appwrite:
    _client.set_impersonate_user_id(value)
    return self

## Impersonate a user by email on an already user-authenticated request. Requires the current request to be authenticated as a user with impersonator capability; X-Appwrite-Key alone is not sufficient. Impersonator users are intentionally granted users.read so they can discover a target before impersonation begins. Internal audit logs still attribute actions to the original impersonator and record the impersonated target only in internal audit payload data.
func set_impersonate_user_email(value: String) -> Appwrite:
    _client.set_impersonate_user_email(value)
    return self

## Impersonate a user by phone on an already user-authenticated request. Requires the current request to be authenticated as a user with impersonator capability; X-Appwrite-Key alone is not sufficient. Impersonator users are intentionally granted users.read so they can discover a target before impersonation begins. Internal audit logs still attribute actions to the original impersonator and record the impersonated target only in internal audit payload data.
func set_impersonate_user_phone(value: String) -> Appwrite:
    _client.set_impersonate_user_phone(value)
    return self

## The platform type (Appwrite or Imagine)
func set_platform(value: String) -> Appwrite:
    _client.set_platform(value)
    return self

## Set self signed status
func set_self_signed(status: bool = true) -> Appwrite:
    _client.set_self_signed(status)
    return self

## Set the endpoint
func set_endpoint(endpoint: String) -> Variant:
    var res = _client.set_endpoint(endpoint)
    if res is AppwriteException:
        return res
    return self

## Add a header
func add_header(key: String, value: String) -> Appwrite:
    _client.add_header(key, value)    
    return self

## Get all headers
func get_headers() -> Dictionary:
    return _client.get_headers()

func _apply_env(key: String, value: String) -> void:
    match key:
        "APPWRITE_ENDPOINT":
            var err = _client.set_endpoint(value)
            if err is AppwriteException:
                push_error("Appwrite Error (%s): %s" % [err.type, err.message])
        "APPWRITE_SELF_SIGNED":
            _client.set_self_signed(value.to_lower() == "true")
        "APPWRITE_PROJECT":
            _client.set_project(value)
        "APPWRITE_KEY":
            _client.set_key(value)
        "APPWRITE_JWT":
            _client.set_jwt(value)
        "APPWRITE_LOCALE":
            _client.set_locale(value)
        "APPWRITE_MODE":
            _client.set_mode(value)
        "APPWRITE_COOKIE":
            _client.set_cookie(value)
        "APPWRITE_SESSION":
            _client.set_session(value)
        "APPWRITE_DEVKEY":
            _client.set_dev_key(value)
        "APPWRITE_IMPERSONATEUSERID":
            _client.set_impersonate_user_id(value)
        "APPWRITE_IMPERSONATEUSEREMAIL":
            _client.set_impersonate_user_email(value)
        "APPWRITE_IMPERSONATEUSERPHONE":
            _client.set_impersonate_user_phone(value)
        "APPWRITE_PLATFORM":
            _client.set_platform(value)

## Ping Appwrite Server for testing connection
func ping() -> Variant:
    var response = await _client.call_api('GET', '/ping')
    
    if response.statusCode == 0:
        var error_msg = response.get("error", "Unknown error")
        push_error("Appwrite Network Error: %s" % error_msg)
        return AppwriteException.new(error_msg, 0, "network_error", "")

    if response.statusCode >= 400:
        var message = ""
        var code = response.statusCode
        var type = ""
        var response_str = ""
        if response.get("body") is Dictionary:
            message = response.body.get("message", "")
            code = response.body.get("code", response.statusCode)
            type = response.body.get("type", "")
            response_str = str(response.body)
        elif response.has("error"):
            message = str(response.get("error", ""))
            response_str = message
        else:
            message = str(response.get("body", ""))
            response_str = str(response.get("body", ""))
        
        push_error("Appwrite Error (%s): %s" % [type, message])
        return AppwriteException.new(message, code, type, response_str)

    return response.get('body', {})