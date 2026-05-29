## Enum: HEALTHANTIVIRUSSTATUS

const DISABLED = "disabled"
const OFFLINE = "offline"
const ONLINE = "online"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "disabled",
                "offline",
                "online",
            ]