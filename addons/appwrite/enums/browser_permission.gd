## Enum: BROWSERPERMISSION

const GEOLOCATION = "geolocation"
const CAMERA = "camera"
const MICROPHONE = "microphone"
const NOTIFICATIONS = "notifications"
const MIDI = "midi"
const PUSH = "push"
const CLIPBOARD_READ = "clipboard-read"
const CLIPBOARD_WRITE = "clipboard-write"
const PAYMENT_HANDLER = "payment-handler"
const USB = "usb"
const BLUETOOTH = "bluetooth"
const ACCELEROMETER = "accelerometer"
const GYROSCOPE = "gyroscope"
const MAGNETOMETER = "magnetometer"
const AMBIENT_LIGHT_SENSOR = "ambient-light-sensor"
const BACKGROUND_SYNC = "background-sync"
const PERSISTENT_STORAGE = "persistent-storage"
const SCREEN_WAKE_LOCK = "screen-wake-lock"
const WEB_SHARE = "web-share"
const XR_SPATIAL_TRACKING = "xr-spatial-tracking"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "geolocation",
                "camera",
                "microphone",
                "notifications",
                "midi",
                "push",
                "clipboard-read",
                "clipboard-write",
                "payment-handler",
                "usb",
                "bluetooth",
                "accelerometer",
                "gyroscope",
                "magnetometer",
                "ambient-light-sensor",
                "background-sync",
                "persistent-storage",
                "screen-wake-lock",
                "web-share",
                "xr-spatial-tracking",
            ]