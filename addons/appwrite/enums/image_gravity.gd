## Enum: IMAGEGRAVITY

const CENTER = "center"
const TOP_LEFT = "top-left"
const TOP = "top"
const TOP_RIGHT = "top-right"
const LEFT = "left"
const RIGHT = "right"
const BOTTOM_LEFT = "bottom-left"
const BOTTOM = "bottom"
const BOTTOM_RIGHT = "bottom-right"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "center",
                "top-left",
                "top",
                "top-right",
                "left",
                "right",
                "bottom-left",
                "bottom",
                "bottom-right",
            ]