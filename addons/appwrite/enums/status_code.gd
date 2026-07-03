## Enum: STATUSCODE

const MOVEDPERMANENTLY = "301"
const FOUND = "302"
const TEMPORARYREDIRECT = "307"
const PERMANENTREDIRECT = "308"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "301",
                "302",
                "307",
                "308",
            ]