## Enum: MIGRATIONONDUPLICATE

const FAIL = "fail"
const SKIP = "skip"
const OVERWRITE = "overwrite"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "fail",
                "skip",
                "overwrite",
            ]