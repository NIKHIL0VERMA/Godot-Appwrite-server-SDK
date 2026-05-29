## Enum: PROJECTSERVICEID

const ACCOUNT = "account"
const AVATARS = "avatars"
const DATABASES = "databases"
const TABLESDB = "tablesdb"
const LOCALE = "locale"
const HEALTH = "health"
const PROJECT = "project"
const STORAGE = "storage"
const TEAMS = "teams"
const USERS = "users"
const VCS = "vcs"
const SITES = "sites"
const FUNCTIONS = "functions"
const PROXY = "proxy"
const GRAPHQL = "graphql"
const MIGRATIONS = "migrations"
const MESSAGING = "messaging"
const ADVISOR = "advisor"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "account",
                "avatars",
                "databases",
                "tablesdb",
                "locale",
                "health",
                "project",
                "storage",
                "teams",
                "users",
                "vcs",
                "sites",
                "functions",
                "proxy",
                "graphql",
                "migrations",
                "messaging",
                "advisor",
            ]