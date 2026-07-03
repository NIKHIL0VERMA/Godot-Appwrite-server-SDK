class_name AppwriteApp
extends RefCounted
## App[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "xname": "name",
    "description": "description",
    "clienturi": "clientUri",
    "logouri": "logoUri",
    "privacypolicyurl": "privacyPolicyUrl",
    "termsurl": "termsUrl",
    "contacts": "contacts",
    "tagline": "tagline",
    "tags": "tags",
    "images": "images",
    "supporturl": "supportUrl",
    "datadeletionurl": "dataDeletionUrl",
    "redirecturis": "redirectUris",
    "postlogoutredirecturis": "postLogoutRedirectUris",
    "enabled": "enabled",
    "xtype": "type",
    "deviceflow": "deviceFlow",
    "teamid": "teamId",
    "userid": "userId",
    "secrets": "secrets",
}

var id: String ## App ID.
var createdat: String ## App creation time in ISO 8601 format.
var updatedat: String ## App update date in ISO 8601 format.
var xname: String ## Application name.
var description: String ## Application description shown to users during OAuth2 consent.
var clienturi: String ## Application homepage URL shown to users during OAuth2 consent.
var logouri: String ## Application logo URL shown to users during OAuth2 consent.
var privacypolicyurl: String ## Application privacy policy URL shown to users during OAuth2 consent.
var termsurl: String ## Application terms of service URL shown to users during OAuth2 consent.
var contacts: Array ## Application support or security contact emails.
var tagline: String ## Application tagline shown to users during OAuth2 consent.
var tags: Array ## Application tags shown to users during OAuth2 consent.
var images: Array ## Application image URLs shown to users during OAuth2 consent.
var supporturl: String ## Application support URL shown to users during OAuth2 consent.
var datadeletionurl: String ## Application data deletion URL shown to users during OAuth2 consent.
var redirecturis: Array ## List of authorized redirect URIs. These URIs can be used to redirect users after they authenticate.
var postlogoutredirecturis: Array ## List of authorized post-logout redirect URIs for OpenID Connect RP-Initiated Logout. The logout endpoint only redirects users to URIs in this list after ending their session.
var enabled: bool ## Whether the app is enabled or not.
var xtype: String ## OAuth2 client type. `public` for SPAs, mobile, and native apps that cannot keep a client secret (PKCE required); `confidential` for server-side clients that authenticate with a client secret.
var deviceflow: bool ## Whether this client may use the OAuth2 Device Authorization Grant (RFC 8628).
var teamid: String ## ID of team that owns the application, if owned by team. Otherwise, user ID will be used.
var userid: String ## ID of user who owns the application, if owned by user. Otherwise, team ID will be used.
var secrets: Array ## List of application secrets.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteApp.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "contacts" and value is Array:
            m.set(key, value)
            continue
        if key == "tags" and value is Array:
            m.set(key, value)
            continue
        if key == "images" and value is Array:
            m.set(key, value)
            continue
        if key == "redirecturis" and value is Array:
            m.set(key, value)
            continue
        if key == "postlogoutredirecturis" and value is Array:
            m.set(key, value)
            continue
        if key == "secrets" and value is Array:
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