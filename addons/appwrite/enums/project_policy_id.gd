## Enum: PROJECTPOLICYID

const PASSWORD_DICTIONARY = "password-dictionary"
const PASSWORD_HISTORY = "password-history"
const PASSWORD_STRENGTH = "password-strength"
const PASSWORD_PERSONAL_DATA = "password-personal-data"
const SESSION_ALERT = "session-alert"
const SESSION_DURATION = "session-duration"
const SESSION_INVALIDATION = "session-invalidation"
const SESSION_LIMIT = "session-limit"
const USER_LIMIT = "user-limit"
const MEMBERSHIP_PRIVACY = "membership-privacy"
const DENY_ALIASED_EMAIL = "deny-aliased-email"
const DENY_DISPOSABLE_EMAIL = "deny-disposable-email"
const DENY_FREE_EMAIL = "deny-free-email"
const DENY_CORPORATE_EMAIL = "deny-corporate-email"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "password-dictionary",
                "password-history",
                "password-strength",
                "password-personal-data",
                "session-alert",
                "session-duration",
                "session-invalidation",
                "session-limit",
                "user-limit",
                "membership-privacy",
                "deny-aliased-email",
                "deny-disposable-email",
                "deny-free-email",
                "deny-corporate-email",
            ]