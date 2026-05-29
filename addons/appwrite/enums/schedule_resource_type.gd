## Enum: SCHEDULERESOURCETYPE

const FUNCTION = "function"
const EXECUTION = "execution"
const MESSAGE = "message"
const BACKUP = "backup"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "function",
                "execution",
                "message",
                "backup",
            ]