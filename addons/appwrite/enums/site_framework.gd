## Enum: SITEFRAMEWORK

const ANALOG = "analog"
const ANGULAR = "angular"
const NEXTJS = "nextjs"
const REACT = "react"
const NUXT = "nuxt"
const VUE = "vue"
const SVELTEKIT = "sveltekit"
const ASTRO = "astro"
const TANSTACK_START = "tanstack-start"
const REMIX = "remix"
const LYNX = "lynx"
const FLUTTER = "flutter"
const REACT_NATIVE = "react-native"
const VITE = "vite"
const OTHER = "other"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "analog",
                "angular",
                "nextjs",
                "react",
                "nuxt",
                "vue",
                "sveltekit",
                "astro",
                "tanstack-start",
                "remix",
                "lynx",
                "flutter",
                "react-native",
                "vite",
                "other",
            ]