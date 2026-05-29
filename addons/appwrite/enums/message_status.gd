## Enum: MESSAGESTATUS

const DRAFT = "draft"
const PROCESSING = "processing"
const SCHEDULED = "scheduled"
const SENT = "sent"
const FAILED = "failed"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "draft",
                "processing",
                "scheduled",
                "sent",
                "failed",
            ]