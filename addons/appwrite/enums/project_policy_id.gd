## Enum: PROJECTPOLICYID

const PASSWORD_DICTIONARY = "password-dictionary"
const PASSWORD_HISTORY = "password-history"
const PASSWORD_PERSONAL_DATA = "password-personal-data"
const SESSION_ALERT = "session-alert"
const SESSION_DURATION = "session-duration"
const SESSION_INVALIDATION = "session-invalidation"
const SESSION_LIMIT = "session-limit"
const USER_LIMIT = "user-limit"
const MEMBERSHIP_PRIVACY = "membership-privacy"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "password-dictionary",
                "password-history",
                "password-personal-data",
                "session-alert",
                "session-duration",
                "session-invalidation",
                "session-limit",
                "user-limit",
                "membership-privacy",
            ]