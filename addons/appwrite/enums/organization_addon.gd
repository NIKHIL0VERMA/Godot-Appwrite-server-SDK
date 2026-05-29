## Enum: ORGANIZATIONADDON

const BAA = "baa"
const BACKUP_RECOVERY = "backup_recovery"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "baa",
                "backup_recovery",
            ]