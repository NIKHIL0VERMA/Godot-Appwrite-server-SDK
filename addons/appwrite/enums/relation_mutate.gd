## Enum: RELATIONMUTATE

const CASCADE = "cascade"
const RESTRICT = "restrict"
const SETNULL = "setNull"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "cascade",
                "restrict",
                "setNull",
            ]