## Enum: PROJECTAUTHMETHODID

const EMAIL_PASSWORD = "email-password"
const MAGIC_URL = "magic-url"
const EMAIL_OTP = "email-otp"
const ANONYMOUS = "anonymous"
const INVITES = "invites"
const JWT = "jwt"
const PHONE = "phone"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "email-password",
                "magic-url",
                "email-otp",
                "anonymous",
                "invites",
                "jwt",
                "phone",
            ]