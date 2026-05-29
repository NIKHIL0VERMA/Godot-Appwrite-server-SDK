## Enum: BROWSER

const AVANT_BROWSER = "aa"
const ANDROID_WEBVIEW_BETA = "an"
const GOOGLE_CHROME = "ch"
const GOOGLE_CHROME_IOS = "ci"
const GOOGLE_CHROME_MOBILE = "cm"
const CHROMIUM = "cr"
const MOZILLA_FIREFOX = "ff"
const SAFARI = "sf"
const MOBILE_SAFARI = "mf"
const MICROSOFT_EDGE = "ps"
const MICROSOFT_EDGE_IOS = "oi"
const OPERA_MINI = "om"
const OPERA = "op"
const OPERA_NEXT = "on"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "aa",
                "an",
                "ch",
                "ci",
                "cm",
                "cr",
                "ff",
                "sf",
                "mf",
                "ps",
                "oi",
                "om",
                "op",
                "on",
            ]