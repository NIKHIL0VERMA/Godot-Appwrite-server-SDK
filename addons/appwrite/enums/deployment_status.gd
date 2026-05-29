## Enum: DEPLOYMENTSTATUS

const WAITING = "waiting"
const PROCESSING = "processing"
const BUILDING = "building"
const READY = "ready"
const CANCELED = "canceled"
const FAILED = "failed"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "waiting",
                "processing",
                "building",
                "ready",
                "canceled",
                "failed",
            ]