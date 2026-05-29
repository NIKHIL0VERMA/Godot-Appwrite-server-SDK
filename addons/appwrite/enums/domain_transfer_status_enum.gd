## Enum: DOMAINTRANSFERSTATUSENUM

const TRANSFERRABLE = "transferrable"
const NOT_TRANSFERRABLE = "not_transferrable"
const PENDING_OWNER = "pending_owner"
const PENDING_ADMIN = "pending_admin"
const PENDING_REGISTRY = "pending_registry"
const COMPLETED = "completed"
const CANCELLED = "cancelled"
const SERVICE_UNAVAILABLE = "service_unavailable"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "transferrable",
                "not_transferrable",
                "pending_owner",
                "pending_admin",
                "pending_registry",
                "completed",
                "cancelled",
                "service_unavailable",
            ]