class_name AppwriteProject
extends RefCounted
## Project[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "xname": "name",
    "teamid": "teamId",
    "region": "region",
    "devkeys": "devKeys",
    "smtpenabled": "smtpEnabled",
    "smtpsendername": "smtpSenderName",
    "smtpsenderemail": "smtpSenderEmail",
    "smtpreplytoname": "smtpReplyToName",
    "smtpreplytoemail": "smtpReplyToEmail",
    "smtphost": "smtpHost",
    "smtpport": "smtpPort",
    "smtpusername": "smtpUsername",
    "smtppassword": "smtpPassword",
    "smtpsecure": "smtpSecure",
    "pingcount": "pingCount",
    "pingedat": "pingedAt",
    "labels": "labels",
    "status": "status",
    "authmethods": "authMethods",
    "services": "services",
    "protocols": "protocols",
    "blocks": "blocks",
    "consoleaccessedat": "consoleAccessedAt",
    "billinglimits": "billingLimits",
    "oauth2serverenabled": "oAuth2ServerEnabled",
    "oauth2serverauthorizationurl": "oAuth2ServerAuthorizationUrl",
    "oauth2serverscopes": "oAuth2ServerScopes",
    "oauth2serverauthorizationdetailstypes": "oAuth2ServerAuthorizationDetailsTypes",
    "oauth2serveraccesstokenduration": "oAuth2ServerAccessTokenDuration",
    "oauth2serverrefreshtokenduration": "oAuth2ServerRefreshTokenDuration",
    "oauth2serverpublicaccesstokenduration": "oAuth2ServerPublicAccessTokenDuration",
    "oauth2serverpublicrefreshtokenduration": "oAuth2ServerPublicRefreshTokenDuration",
    "oauth2serverconfidentialpkce": "oAuth2ServerConfidentialPkce",
    "oauth2serververificationurl": "oAuth2ServerVerificationUrl",
    "oauth2serverusercodelength": "oAuth2ServerUserCodeLength",
    "oauth2serverusercodeformat": "oAuth2ServerUserCodeFormat",
    "oauth2serverdevicecodeduration": "oAuth2ServerDeviceCodeDuration",
    "oauth2serverdiscoveryurl": "oAuth2ServerDiscoveryUrl",
}

var id: String ## Project ID.
var createdat: String ## Project creation date in ISO 8601 format.
var updatedat: String ## Project update date in ISO 8601 format.
var xname: String ## Project name.
var teamid: String ## Project team ID.
var region: String ## Project region
var devkeys: Array ## Deprecated since 1.9.5: List of dev keys.
var smtpenabled: bool ## Status for custom SMTP
var smtpsendername: String ## SMTP sender name
var smtpsenderemail: String ## SMTP sender email
var smtpreplytoname: String ## SMTP reply to name
var smtpreplytoemail: String ## SMTP reply to email
var smtphost: String ## SMTP server host name
var smtpport: int ## SMTP server port
var smtpusername: String ## SMTP server username
var smtppassword: String ## SMTP server password. This property is write-only and always returned empty.
var smtpsecure: String ## SMTP server secure protocol
var pingcount: int ## Number of times the ping was received for this project.
var pingedat: String ## Last ping datetime in ISO 8601 format.
var labels: Array ## Labels for the project.
var status: String ## Project status
var authmethods: Array ## List of auth methods.
var services: Array ## List of services.
var protocols: Array ## List of protocols.
var blocks: Array ## Project blocks information
var consoleaccessedat: String ## Last time the project was accessed via console. Used with plan&#039;s projectInactivityDays to determine if project is paused.
var billinglimits: Dictionary ## Billing limits reached
var oauth2serverenabled: bool ## OAuth2 server status
var oauth2serverauthorizationurl: String ## OAuth2 server authorization URL
var oauth2serverscopes: Array ## OAuth2 server allowed scopes
var oauth2serverauthorizationdetailstypes: Array ## OAuth2 server accepted RFC 9396 authorization_details types
var oauth2serveraccesstokenduration: int ## OAuth2 server access token duration in seconds for confidential clients
var oauth2serverrefreshtokenduration: int ## OAuth2 server refresh token duration in seconds for confidential clients
var oauth2serverpublicaccesstokenduration: int ## OAuth2 server access token duration in seconds for public clients (SPAs, mobile, native)
var oauth2serverpublicrefreshtokenduration: int ## OAuth2 server refresh token duration in seconds for public clients (SPAs, mobile, native)
var oauth2serverconfidentialpkce: bool ## When enabled, PKCE is required for confidential clients (server-side flows using client_secret). PKCE is always required for public clients regardless of this setting.
var oauth2serververificationurl: String ## URL to your application page where users enter the device flow user code. Empty when the Device Authorization Grant is not configured.
var oauth2serverusercodelength: int ## Number of characters in the device flow user code, excluding the formatting separator.
var oauth2serverusercodeformat: String ## Character set for device flow user codes: `numeric`, `alphabetic`, or `alphanumeric`.
var oauth2serverdevicecodeduration: int ## Lifetime in seconds of device flow device codes and user codes.
var oauth2serverdiscoveryurl: String ## OAuth2 server discovery URL

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteProject.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "devkeys" and value is Array:
            m.set(key, value)
            continue
        if key == "labels" and value is Array:
            m.set(key, value)
            continue
        if key == "authmethods" and value is Array:
            m.set(key, value)
            continue
        if key == "services" and value is Array:
            m.set(key, value)
            continue
        if key == "protocols" and value is Array:
            m.set(key, value)
            continue
        if key == "blocks" and value is Array:
            m.set(key, value)
            continue
        if key == "oauth2serverscopes" and value is Array:
            m.set(key, value)
            continue
        if key == "oauth2serverauthorizationdetailstypes" and value is Array:
            m.set(key, value)
            continue
        if value != null:
            m.set(key, value)
    return m

## Convert to Dictionary
func to_dict() -> Dictionary:
    var dict := {}

    for key in _FIELD_MAP:
        var value = get(key)

        dict[_FIELD_MAP[key]] = value
    return dict