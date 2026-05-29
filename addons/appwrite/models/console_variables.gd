class_name AppwriteConsoleVariables
extends RefCounted
## Console Variables[br]


const _FIELD_MAP := {
    "app_domain_target_cname": "_APP_DOMAIN_TARGET_CNAME",
    "app_domain_target_a": "_APP_DOMAIN_TARGET_A",
    "app_compute_build_timeout": "_APP_COMPUTE_BUILD_TIMEOUT",
    "app_domain_target_aaaa": "_APP_DOMAIN_TARGET_AAAA",
    "app_domain_target_caa": "_APP_DOMAIN_TARGET_CAA",
    "app_storage_limit": "_APP_STORAGE_LIMIT",
    "app_compute_size_limit": "_APP_COMPUTE_SIZE_LIMIT",
    "app_usage_stats": "_APP_USAGE_STATS",
    "app_vcs_enabled": "_APP_VCS_ENABLED",
    "app_domain_enabled": "_APP_DOMAIN_ENABLED",
    "app_assistant_enabled": "_APP_ASSISTANT_ENABLED",
    "app_domain_sites": "_APP_DOMAIN_SITES",
    "app_domain_functions": "_APP_DOMAIN_FUNCTIONS",
    "app_options_force_https": "_APP_OPTIONS_FORCE_HTTPS",
    "app_domains_nameservers": "_APP_DOMAINS_NAMESERVERS",
    "app_db_adapter": "_APP_DB_ADAPTER",
    "supportforrelationships": "supportForRelationships",
    "supportforoperators": "supportForOperators",
    "supportforspatials": "supportForSpatials",
    "supportforspatialindexnull": "supportForSpatialIndexNull",
    "supportforfulltextwildcard": "supportForFulltextWildcard",
    "supportformultiplefulltextindexes": "supportForMultipleFulltextIndexes",
    "supportforattributeresizing": "supportForAttributeResizing",
    "supportforschemas": "supportForSchemas",
    "maxindexlength": "maxIndexLength",
    "supportforintegerids": "supportForIntegerIds",
    "app_console_email_verification": "_APP_CONSOLE_EMAIL_VERIFICATION",
}

var app_domain_target_cname: String ## CNAME target for your Appwrite custom domains.
var app_domain_target_a: String ## A target for your Appwrite custom domains.
var app_compute_build_timeout: int ## Maximum build timeout in seconds.
var app_domain_target_aaaa: String ## AAAA target for your Appwrite custom domains.
var app_domain_target_caa: String ## CAA target for your Appwrite custom domains.
var app_storage_limit: int ## Maximum file size allowed for file upload in bytes.
var app_compute_size_limit: int ## Maximum file size allowed for deployment in bytes.
var app_usage_stats: String ## Defines if usage stats are enabled. This value is set to &#039;enabled&#039; by default, to disable the usage stats set the value to &#039;disabled&#039;.
var app_vcs_enabled: bool ## Defines if VCS (Version Control System) is enabled.
var app_domain_enabled: bool ## Defines if main domain is configured. If so, custom domains can be created.
var app_assistant_enabled: bool ## Defines if AI assistant is enabled.
var app_domain_sites: String ## A comma separated list of domains to use for site URLs.
var app_domain_functions: String ## A domain to use for function URLs.
var app_options_force_https: String ## Defines if HTTPS is enforced for all requests.
var app_domains_nameservers: String ## Comma-separated list of nameservers.
var app_db_adapter: String ## Database adapter in use.
var supportforrelationships: bool ## Whether the database adapter supports relationships.
var supportforoperators: bool ## Whether the database adapter supports operators.
var supportforspatials: bool ## Whether the database adapter supports spatial attributes.
var supportforspatialindexnull: bool ## Whether the database adapter supports spatial indexes on nullable columns.
var supportforfulltextwildcard: bool ## Whether the database adapter supports fulltext wildcard search.
var supportformultiplefulltextindexes: bool ## Whether the database adapter supports multiple fulltext indexes per collection.
var supportforattributeresizing: bool ## Whether the database adapter supports resizing attributes.
var supportforschemas: bool ## Whether the database adapter supports fixed schemas with row width limits.
var maxindexlength: int ## Maximum index length supported by the database adapter.
var supportforintegerids: bool ## Whether the database adapter uses integer sequence IDs.
var app_console_email_verification: String ## Whether email verification for console users is required. Can be &quot;true&quot; or &quot;false&quot;.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteConsoleVariables.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if value != null:
            m.set(key, value)
    return m

## Convert to Dictionary
func to_dict() -> Dictionary:
    var dict := {}

    for key in _FIELD_MAP:
        var value = get(key)

        dict[_FIELD_MAP[key]] = value
    return dict