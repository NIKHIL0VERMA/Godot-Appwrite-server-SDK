## Enum: ORGANIZATIONKEYSCOPES

const PROJECTS_READ = "projects.read"
const PROJECTS_WRITE = "projects.write"
const DEVKEYS_READ = "devKeys.read"
const DEVKEYS_WRITE = "devKeys.write"
const ORGANIZATION_KEYS_READ = "organization.keys.read"
const ORGANIZATION_KEYS_WRITE = "organization.keys.write"
const DOMAINS_READ = "domains.read"
const DOMAINS_WRITE = "domains.write"
const KEYS_READ = "keys.read"
const KEYS_WRITE = "keys.write"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "projects.read",
                "projects.write",
                "devKeys.read",
                "devKeys.write",
                "organization.keys.read",
                "organization.keys.write",
                "domains.read",
                "domains.write",
                "keys.read",
                "keys.write",
            ]