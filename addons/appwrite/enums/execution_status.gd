## Enum: EXECUTIONSTATUS

const WAITING = "waiting"
const PROCESSING = "processing"
const COMPLETED = "completed"
const FAILED = "failed"
const SCHEDULED = "scheduled"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "waiting",
                "processing",
                "completed",
                "failed",
                "scheduled",
            ]