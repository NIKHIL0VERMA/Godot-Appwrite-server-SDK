## Enum: PLATFORMTYPE

const WINDOWS = "windows"
const APPLE = "apple"
const ANDROID = "android"
const LINUX = "linux"
const WEB = "web"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "windows",
                "apple",
                "android",
                "linux",
                "web",
            ]