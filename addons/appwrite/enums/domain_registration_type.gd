## Enum: DOMAINREGISTRATIONTYPE

const NEW = "new"
const TRANSFER = "transfer"
const RENEWAL = "renewal"
const TRADE = "trade"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "new",
                "transfer",
                "renewal",
                "trade",
            ]