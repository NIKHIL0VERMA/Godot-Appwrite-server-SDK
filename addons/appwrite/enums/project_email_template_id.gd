## Enum: PROJECTEMAILTEMPLATEID

const VERIFICATION = "verification"
const MAGICSESSION = "magicSession"
const RECOVERY = "recovery"
const INVITATION = "invitation"
const MFACHALLENGE = "mfaChallenge"
const SESSIONALERT = "sessionAlert"
const OTPSESSION = "otpSession"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "verification",
                "magicSession",
                "recovery",
                "invitation",
                "mfaChallenge",
                "sessionAlert",
                "otpSession",
            ]