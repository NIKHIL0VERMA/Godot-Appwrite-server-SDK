## Enum: INDEXSTATUS

const AVAILABLE = "available"
const PROCESSING = "processing"
const DELETING = "deleting"
const STUCK = "stuck"
const FAILED = "failed"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "available",
                "processing",
                "deleting",
                "stuck",
                "failed",
            ]