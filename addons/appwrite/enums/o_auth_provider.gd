## Enum: OAUTHPROVIDER

const AMAZON = "amazon"
const APPLE = "apple"
const AUTH0 = "auth0"
const AUTHENTIK = "authentik"
const AUTODESK = "autodesk"
const BITBUCKET = "bitbucket"
const BITLY = "bitly"
const BOX = "box"
const DAILYMOTION = "dailymotion"
const DISCORD = "discord"
const DISQUS = "disqus"
const DROPBOX = "dropbox"
const ETSY = "etsy"
const FACEBOOK = "facebook"
const FIGMA = "figma"
const FUSIONAUTH = "fusionauth"
const GITHUB = "github"
const GITLAB = "gitlab"
const GOOGLE = "google"
const KEYCLOAK = "keycloak"
const KICK = "kick"
const LINKEDIN = "linkedin"
const MICROSOFT = "microsoft"
const NOTION = "notion"
const OIDC = "oidc"
const OKTA = "okta"
const PAYPAL = "paypal"
const PAYPALSANDBOX = "paypalSandbox"
const PODIO = "podio"
const SALESFORCE = "salesforce"
const SLACK = "slack"
const SPOTIFY = "spotify"
const STRIPE = "stripe"
const TRADESHIFT = "tradeshift"
const TRADESHIFTBOX = "tradeshiftBox"
const TWITCH = "twitch"
const WORDPRESS = "wordpress"
const X = "x"
const YAHOO = "yahoo"
const YAMMER = "yammer"
const YANDEX = "yandex"
const ZOHO = "zoho"
const ZOOM = "zoom"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "amazon",
                "apple",
                "auth0",
                "authentik",
                "autodesk",
                "bitbucket",
                "bitly",
                "box",
                "dailymotion",
                "discord",
                "disqus",
                "dropbox",
                "etsy",
                "facebook",
                "figma",
                "fusionauth",
                "github",
                "gitlab",
                "google",
                "keycloak",
                "kick",
                "linkedin",
                "microsoft",
                "notion",
                "oidc",
                "okta",
                "paypal",
                "paypalSandbox",
                "podio",
                "salesforce",
                "slack",
                "spotify",
                "stripe",
                "tradeshift",
                "tradeshiftBox",
                "twitch",
                "wordpress",
                "x",
                "yahoo",
                "yammer",
                "yandex",
                "zoho",
                "zoom",
            ]