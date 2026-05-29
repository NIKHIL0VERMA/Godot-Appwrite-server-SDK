## Enum: ACCOUNTKEYSCOPES

const ACCOUNT = "account"
const TEAMS_READ = "teams.read"
const TEAMS_WRITE = "teams.write"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "account",
                "teams.read",
                "teams.write",
            ]