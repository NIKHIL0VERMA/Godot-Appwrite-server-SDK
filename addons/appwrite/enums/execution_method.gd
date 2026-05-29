## Enum: EXECUTIONMETHOD

const GET = "GET"
const POST = "POST"
const PUT = "PUT"
const PATCH = "PATCH"
const DELETE = "DELETE"
const OPTIONS = "OPTIONS"
const HEAD = "HEAD"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "GET",
                "POST",
                "PUT",
                "PATCH",
                "DELETE",
                "OPTIONS",
                "HEAD",
            ]