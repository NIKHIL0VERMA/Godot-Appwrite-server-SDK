## Enum: AUTHENTICATIONFACTOR

const EMAIL = "email"
const PHONE = "phone"
const TOTP = "totp"
const RECOVERYCODE = "recoverycode"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "email",
                "phone",
                "totp",
                "recoverycode",
            ]