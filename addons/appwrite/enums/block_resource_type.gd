## Enum: BLOCKRESOURCETYPE

const PROJECTS = "projects"
const FUNCTIONS = "functions"
const SITES = "sites"
const DATABASES = "databases"
const BUCKETS = "buckets"
const PROVIDERS = "providers"
const TOPICS = "topics"
const SUBSCRIBERS = "subscribers"
const MESSAGES = "messages"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "projects",
                "functions",
                "sites",
                "databases",
                "buckets",
                "providers",
                "topics",
                "subscribers",
                "messages",
            ]