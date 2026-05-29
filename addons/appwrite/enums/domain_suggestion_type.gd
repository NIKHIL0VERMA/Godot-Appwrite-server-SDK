## Enum: DOMAINSUGGESTIONTYPE

const PREMIUM = "premium"
const SUGGESTION = "suggestion"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "premium",
                "suggestion",
            ]