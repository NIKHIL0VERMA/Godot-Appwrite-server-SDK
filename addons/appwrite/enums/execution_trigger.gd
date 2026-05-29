## Enum: EXECUTIONTRIGGER

const HTTP = "http"
const SCHEDULE = "schedule"
const EVENT = "event"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "http",
                "schedule",
                "event",
            ]