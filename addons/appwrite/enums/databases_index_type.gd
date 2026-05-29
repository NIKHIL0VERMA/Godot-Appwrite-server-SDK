## Enum: DATABASESINDEXTYPE

const KEY = "key"
const FULLTEXT = "fulltext"
const UNIQUE = "unique"
const SPATIAL = "spatial"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "key",
                "fulltext",
                "unique",
                "spatial",
            ]