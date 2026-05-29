## Enum: QUERYSUGGESTIONRESOURCE

const ACTIVITIES = "activities"
const ACTIVITY_EVENTS = "activityevents"
const ARCHIVES = "archives"
const CREDITS = "credits"
const DNS_RECORDS = "dnsrecords"
const DOMAINS = "domains"
const INVOICES = "invoices"
const PAYMENT_METHODS = "paymentmethods"
const POLICIES = "policies"
const PROJECTS = "projects"
const RESTORATIONS = "restorations"
const TEAM_AGGREGATIONS = "teamaggregations"
const TEAMS = "teams"
const DATABASES = "databases"
const TABLES = "tables"
const ROWS = "rows"
const SCHEDULES = "schedules"
const PLATFORMS = "platforms"
const KEYS = "keys"
const DEV_KEYS = "devkeys"
const WEBHOOKS = "webhooks"
const CERTIFICATES = "certificates"
const REALTIME = "realtime"
const RULES = "rules"
const INSTALLATIONS = "installations"
const REPOSITORIES = "repositories"
const VCS_COMMENTS = "vcscomments"
const VCS_COMMENT_LOCKS = "vcscommentlocks"
const REPORTS = "reports"
const INSIGHTS = "insights"
const USERS = "users"
const CACHE = "cache"
const TOKENS = "tokens"
const AUTHENTICATORS = "authenticators"
const CHALLENGES = "challenges"
const SESSIONS = "sessions"
const IDENTITIES = "identities"
const MEMBERSHIPS = "memberships"
const BUCKETS = "buckets"
const PROVIDERS = "providers"
const MESSAGES = "messages"
const TOPICS = "topics"
const SUBSCRIBERS = "subscribers"
const TARGETS = "targets"
const PRESENCE_LOGS = "presencelogs"
const COMPANIES = "companies"
const BILLING_ADDRESSES = "billingaddresses"
const BILLING_AGGREGATIONS = "billingaggregations"
const BILLING_AGGREGATION_RESOURCES = "billingaggregationresources"
const BILLING_TEAM_PROJECT_AGGREGATIONS = "billingteamprojectaggregations"
const BILLING_TEAM_AGGREGATIONS_V2 = "billingteamaggregations_v2"
const BILLING_TEAM_AGGREGATION_RESOURCES = "billingteamaggregationresources"
const BILLING_INVOICES_V2 = "billinginvoices_v2"
const BILLING_ADDONS = "billingaddons"
const ALERTS = "alerts"
const PAYMENTS = "payments"
const BILLING_DISCOUNTS = "billingdiscounts"
const SOURCES = "sources"
const DEALS = "deals"
const BLOCKS = "blocks"
const THREATS = "threats"
const FEEDBACKS = "feedbacks"
const SH_INSTALLATIONS = "sh_installations"
const ATTRIBUTES = "attributes"
const INDEXES = "indexes"
const FUNCTIONS = "functions"
const SITES = "sites"
const DEPLOYMENTS = "deployments"
const EXECUTIONS = "executions"
const VARIABLES = "variables"
const MIGRATIONS = "migrations"
const RESOURCE_TOKENS = "resourcetokens"
const TRANSACTIONS = "transactions"
const TRANSACTION_LOGS = "transactionlogs"
const STATS = "stats"
const DEDICATED_DATABASES = "dedicateddatabases"
const DEDICATED_DATABASE_CONFIGS = "dedicateddatabaseconfigs"
const DEDICATED_DATABASE_RUNTIMES = "dedicateddatabaseruntimes"
const DEDICATED_DATABASE_OPERATIONS = "dedicateddatabaseoperations"
const DEDICATED_DATABASE_BACKUPS = "dedicateddatabasebackups"
const DEDICATED_DATABASE_RESTORATIONS = "dedicateddatabaserestorations"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "activities",
                "activityevents",
                "archives",
                "credits",
                "dnsrecords",
                "domains",
                "invoices",
                "paymentmethods",
                "policies",
                "projects",
                "restorations",
                "teamaggregations",
                "teams",
                "databases",
                "tables",
                "rows",
                "schedules",
                "platforms",
                "keys",
                "devkeys",
                "webhooks",
                "certificates",
                "realtime",
                "rules",
                "installations",
                "repositories",
                "vcscomments",
                "vcscommentlocks",
                "reports",
                "insights",
                "users",
                "cache",
                "tokens",
                "authenticators",
                "challenges",
                "sessions",
                "identities",
                "memberships",
                "buckets",
                "providers",
                "messages",
                "topics",
                "subscribers",
                "targets",
                "presencelogs",
                "companies",
                "billingaddresses",
                "billingaggregations",
                "billingaggregationresources",
                "billingteamprojectaggregations",
                "billingteamaggregations_v2",
                "billingteamaggregationresources",
                "billinginvoices_v2",
                "billingaddons",
                "alerts",
                "payments",
                "billingdiscounts",
                "sources",
                "deals",
                "blocks",
                "threats",
                "feedbacks",
                "sh_installations",
                "attributes",
                "indexes",
                "functions",
                "sites",
                "deployments",
                "executions",
                "variables",
                "migrations",
                "resourcetokens",
                "transactions",
                "transactionlogs",
                "stats",
                "dedicateddatabases",
                "dedicateddatabaseconfigs",
                "dedicateddatabaseruntimes",
                "dedicateddatabaseoperations",
                "dedicateddatabasebackups",
                "dedicateddatabaserestorations",
            ]