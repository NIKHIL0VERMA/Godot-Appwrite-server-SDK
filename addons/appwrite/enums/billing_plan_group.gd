## Enum: BILLINGPLANGROUP

const STARTER = "starter"
const PRO = "pro"
const SCALE = "scale"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "starter",
                "pro",
                "scale",
            ]