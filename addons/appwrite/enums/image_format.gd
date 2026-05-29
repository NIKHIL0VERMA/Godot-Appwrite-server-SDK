## Enum: IMAGEFORMAT

const JPG = "jpg"
const JPEG = "jpeg"
const PNG = "png"
const WEBP = "webp"
const HEIC = "heic"
const AVIF = "avif"
const GIF = "gif"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "jpg",
                "jpeg",
                "png",
                "webp",
                "heic",
                "avif",
                "gif",
            ]