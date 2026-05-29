## Enum: PROXYRULESTATUS

const UNVERIFIED = "unverified"
const VERIFYING = "verifying"
const VERIFIED = "verified"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "unverified",
                "verifying",
                "verified",
            ]