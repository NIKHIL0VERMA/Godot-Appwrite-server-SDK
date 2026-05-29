## Enum: FUNCTIONTEMPLATEUSECASE

const STARTER = "starter"
const DATABASES = "databases"
const AI = "ai"
const MESSAGING = "messaging"
const UTILITIES = "utilities"
const DEV_TOOLS = "dev-tools"
const AUTH = "auth"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "starter",
                "databases",
                "ai",
                "messaging",
                "utilities",
                "dev-tools",
                "auth",
            ]