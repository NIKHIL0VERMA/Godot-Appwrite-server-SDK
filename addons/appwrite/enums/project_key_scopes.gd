## Enum: PROJECTKEYSCOPES

const PROJECT_READ = "project.read"
const PROJECT_WRITE = "project.write"
const KEYS_READ = "keys.read"
const KEYS_WRITE = "keys.write"
const PLATFORMS_READ = "platforms.read"
const PLATFORMS_WRITE = "platforms.write"
const MOCKS_READ = "mocks.read"
const MOCKS_WRITE = "mocks.write"
const POLICIES_READ = "policies.read"
const POLICIES_WRITE = "policies.write"
const PROJECT_POLICIES_READ = "project.policies.read"
const PROJECT_POLICIES_WRITE = "project.policies.write"
const TEMPLATES_READ = "templates.read"
const TEMPLATES_WRITE = "templates.write"
const OAUTH2_READ = "oauth2.read"
const OAUTH2_WRITE = "oauth2.write"
const USERS_READ = "users.read"
const USERS_WRITE = "users.write"
const SESSIONS_READ = "sessions.read"
const SESSIONS_WRITE = "sessions.write"
const TEAMS_READ = "teams.read"
const TEAMS_WRITE = "teams.write"
const DATABASES_READ = "databases.read"
const DATABASES_WRITE = "databases.write"
const TABLES_READ = "tables.read"
const TABLES_WRITE = "tables.write"
const COLUMNS_READ = "columns.read"
const COLUMNS_WRITE = "columns.write"
const INDEXES_READ = "indexes.read"
const INDEXES_WRITE = "indexes.write"
const ROWS_READ = "rows.read"
const ROWS_WRITE = "rows.write"
const COLLECTIONS_READ = "collections.read"
const COLLECTIONS_WRITE = "collections.write"
const ATTRIBUTES_READ = "attributes.read"
const ATTRIBUTES_WRITE = "attributes.write"
const DOCUMENTS_READ = "documents.read"
const DOCUMENTS_WRITE = "documents.write"
const BUCKETS_READ = "buckets.read"
const BUCKETS_WRITE = "buckets.write"
const FILES_READ = "files.read"
const FILES_WRITE = "files.write"
const TOKENS_READ = "tokens.read"
const TOKENS_WRITE = "tokens.write"
const FUNCTIONS_READ = "functions.read"
const FUNCTIONS_WRITE = "functions.write"
const EXECUTIONS_READ = "executions.read"
const EXECUTIONS_WRITE = "executions.write"
const EXECUTION_READ = "execution.read"
const EXECUTION_WRITE = "execution.write"
const SITES_READ = "sites.read"
const SITES_WRITE = "sites.write"
const LOG_READ = "log.read"
const LOG_WRITE = "log.write"
const PROVIDERS_READ = "providers.read"
const PROVIDERS_WRITE = "providers.write"
const TOPICS_READ = "topics.read"
const TOPICS_WRITE = "topics.write"
const SUBSCRIBERS_READ = "subscribers.read"
const SUBSCRIBERS_WRITE = "subscribers.write"
const TARGETS_READ = "targets.read"
const TARGETS_WRITE = "targets.write"
const MESSAGES_READ = "messages.read"
const MESSAGES_WRITE = "messages.write"
const RULES_READ = "rules.read"
const RULES_WRITE = "rules.write"
const WEBHOOKS_READ = "webhooks.read"
const WEBHOOKS_WRITE = "webhooks.write"
const LOCALE_READ = "locale.read"
const AVATARS_READ = "avatars.read"
const HEALTH_READ = "health.read"
const ASSISTANT_READ = "assistant.read"
const MIGRATIONS_READ = "migrations.read"
const MIGRATIONS_WRITE = "migrations.write"
const SCHEDULES_READ = "schedules.read"
const SCHEDULES_WRITE = "schedules.write"
const VCS_READ = "vcs.read"
const VCS_WRITE = "vcs.write"
const INSIGHTS_READ = "insights.read"
const INSIGHTS_WRITE = "insights.write"
const REPORTS_READ = "reports.read"
const REPORTS_WRITE = "reports.write"
const PRESENCES_READ = "presences.read"
const PRESENCES_WRITE = "presences.write"
const BACKUPS_POLICIES_READ = "backups.policies.read"
const BACKUPS_POLICIES_WRITE = "backups.policies.write"
const ARCHIVES_READ = "archives.read"
const ARCHIVES_WRITE = "archives.write"
const RESTORATIONS_READ = "restorations.read"
const RESTORATIONS_WRITE = "restorations.write"
const DEDICATEDDATABASES_EXECUTE = "dedicatedDatabases.execute"
const DOMAINS_READ = "domains.read"
const DOMAINS_WRITE = "domains.write"
const EVENTS_READ = "events.read"
const APPS_READ = "apps.read"
const APPS_WRITE = "apps.write"
const USAGE_READ = "usage.read"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "project.read",
                "project.write",
                "keys.read",
                "keys.write",
                "platforms.read",
                "platforms.write",
                "mocks.read",
                "mocks.write",
                "policies.read",
                "policies.write",
                "project.policies.read",
                "project.policies.write",
                "templates.read",
                "templates.write",
                "oauth2.read",
                "oauth2.write",
                "users.read",
                "users.write",
                "sessions.read",
                "sessions.write",
                "teams.read",
                "teams.write",
                "databases.read",
                "databases.write",
                "tables.read",
                "tables.write",
                "columns.read",
                "columns.write",
                "indexes.read",
                "indexes.write",
                "rows.read",
                "rows.write",
                "collections.read",
                "collections.write",
                "attributes.read",
                "attributes.write",
                "documents.read",
                "documents.write",
                "buckets.read",
                "buckets.write",
                "files.read",
                "files.write",
                "tokens.read",
                "tokens.write",
                "functions.read",
                "functions.write",
                "executions.read",
                "executions.write",
                "execution.read",
                "execution.write",
                "sites.read",
                "sites.write",
                "log.read",
                "log.write",
                "providers.read",
                "providers.write",
                "topics.read",
                "topics.write",
                "subscribers.read",
                "subscribers.write",
                "targets.read",
                "targets.write",
                "messages.read",
                "messages.write",
                "rules.read",
                "rules.write",
                "webhooks.read",
                "webhooks.write",
                "locale.read",
                "avatars.read",
                "health.read",
                "assistant.read",
                "migrations.read",
                "migrations.write",
                "schedules.read",
                "schedules.write",
                "vcs.read",
                "vcs.write",
                "insights.read",
                "insights.write",
                "reports.read",
                "reports.write",
                "presences.read",
                "presences.write",
                "backups.policies.read",
                "backups.policies.write",
                "archives.read",
                "archives.write",
                "restorations.read",
                "restorations.write",
                "dedicatedDatabases.execute",
                "domains.read",
                "domains.write",
                "events.read",
                "apps.read",
                "apps.write",
                "usage.read",
            ]