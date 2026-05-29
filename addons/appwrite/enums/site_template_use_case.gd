## Enum: SITETEMPLATEUSECASE

const PORTFOLIO = "portfolio"
const STARTER = "starter"
const EVENTS = "events"
const ECOMMERCE = "ecommerce"
const DOCUMENTATION = "documentation"
const BLOG = "blog"
const AI = "ai"
const FORMS = "forms"
const DASHBOARD = "dashboard"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "portfolio",
                "starter",
                "events",
                "ecommerce",
                "documentation",
                "blog",
                "ai",
                "forms",
                "dashboard",
            ]