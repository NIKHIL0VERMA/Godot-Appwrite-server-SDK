## Enum: HEALTHQUEUENAME

const V1_DATABASE = "v1-database"
const V1_DELETES = "v1-deletes"
const V1_AUDITS = "v1-audits"
const V1_MAILS = "v1-mails"
const V1_FUNCTIONS = "v1-functions"
const V1_STATS_RESOURCES = "v1-stats-resources"
const V1_STATS_USAGE = "v1-stats-usage"
const V1_WEBHOOKS = "v1-webhooks"
const V1_CERTIFICATES = "v1-certificates"
const V1_BUILDS = "v1-builds"
const V1_SCREENSHOTS = "v1-screenshots"
const V1_MESSAGING = "v1-messaging"
const V1_MIGRATIONS = "v1-migrations"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "v1-database",
                "v1-deletes",
                "v1-audits",
                "v1-mails",
                "v1-functions",
                "v1-stats-resources",
                "v1-stats-usage",
                "v1-webhooks",
                "v1-certificates",
                "v1-builds",
                "v1-screenshots",
                "v1-messaging",
                "v1-migrations",
            ]