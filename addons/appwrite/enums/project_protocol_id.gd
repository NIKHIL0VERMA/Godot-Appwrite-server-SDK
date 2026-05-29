## Enum: PROJECTPROTOCOLID

const REST = "rest"
const GRAPHQL = "graphql"
const WEBSOCKET = "websocket"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "rest",
                "graphql",
                "websocket",
            ]