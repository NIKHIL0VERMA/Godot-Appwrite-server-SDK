## Enum: APPWRITEMIGRATIONRESOURCE

const USER = "user"
const TEAM = "team"
const MEMBERSHIP = "membership"
const DATABASE = "database"
const TABLE = "table"
const COLUMN = "column"
const INDEX = "index"
const ROW = "row"
const DOCUMENT = "document"
const ATTRIBUTE = "attribute"
const COLLECTION = "collection"
const DOCUMENTSDB = "documentsdb"
const VECTORSDB = "vectorsdb"
const BUCKET = "bucket"
const FILE = "file"
const FUNCTION = "function"
const DEPLOYMENT = "deployment"
const ENVIRONMENT_VARIABLE = "environment-variable"
const PROVIDER = "provider"
const TOPIC = "topic"
const SUBSCRIBER = "subscriber"
const MESSAGE = "message"
const SITE = "site"
const SITE_DEPLOYMENT = "site-deployment"
const SITE_VARIABLE = "site-variable"
const PLATFORM = "platform"
const BACKUP_POLICY = "backup-policy"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "user",
                "team",
                "membership",
                "database",
                "table",
                "column",
                "index",
                "row",
                "document",
                "attribute",
                "collection",
                "documentsdb",
                "vectorsdb",
                "bucket",
                "file",
                "function",
                "deployment",
                "environment-variable",
                "provider",
                "topic",
                "subscriber",
                "message",
                "site",
                "site-deployment",
                "site-variable",
                "platform",
                "backup-policy",
            ]