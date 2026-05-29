## Enum: FIREBASEMIGRATIONRESOURCE

const USER = "user"
const DATABASE = "database"
const TABLE = "table"
const COLUMN = "column"
const ROW = "row"
const DOCUMENT = "document"
const ATTRIBUTE = "attribute"
const COLLECTION = "collection"
const BUCKET = "bucket"
const FILE = "file"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "user",
                "database",
                "table",
                "column",
                "row",
                "document",
                "attribute",
                "collection",
                "bucket",
                "file",
            ]