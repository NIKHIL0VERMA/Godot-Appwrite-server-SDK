## Enum: OAUTH2GOOGLEPROMPT

const NONE = "none"
const CONSENT = "consent"
const SELECT_ACCOUNT = "select_account"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "none",
                "consent",
                "select_account",
            ]