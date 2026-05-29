## Enum: PROJECTUSAGERANGE

const ONEHOUR = "1h"
const ONEDAY = "1d"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "1h",
                "1d",
            ]