## Enum: BACKUPSERVICES

const DATABASES = "databases"
const TABLESDB = "tablesdb"
const DOCUMENTSDB = "documentsdb"
const VECTORSDB = "vectorsdb"
const FUNCTIONS = "functions"
const STORAGE = "storage"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "databases",
                "tablesdb",
                "documentsdb",
                "vectorsdb",
                "functions",
                "storage",
            ]