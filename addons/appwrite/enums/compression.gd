## Enum: COMPRESSION

const NONE = "none"
const GZIP = "gzip"
const ZSTD = "zstd"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "none",
                "gzip",
                "zstd",
            ]