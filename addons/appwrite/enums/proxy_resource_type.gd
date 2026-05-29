## Enum: PROXYRESOURCETYPE

const SITE = "site"
const FUNCTION = "function"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "site",
                "function",
            ]