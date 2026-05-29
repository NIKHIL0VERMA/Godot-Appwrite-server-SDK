## Enum: DATABASETYPE

const LEGACY = "legacy"
const TABLESDB = "tablesdb"
const DOCUMENTSDB = "documentsdb"
const VECTORSDB = "vectorsdb"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "legacy",
                "tablesdb",
                "documentsdb",
                "vectorsdb",
            ]