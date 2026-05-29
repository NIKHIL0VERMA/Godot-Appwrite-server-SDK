## Enum: BROWSERTHEME

const LIGHT = "light"
const DARK = "dark"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "light",
                "dark",
            ]