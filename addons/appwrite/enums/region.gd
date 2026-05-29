## Enum: REGION

const FRA = "fra"
const NYC = "nyc"
const SYD = "syd"
const SFO = "sfo"
const SGP = "sgp"
const TOR = "tor"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "fra",
                "nyc",
                "syd",
                "sfo",
                "sgp",
                "tor",
            ]