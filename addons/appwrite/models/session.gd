class_name AppwriteSession
extends RefCounted
## Session[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "userid": "userId",
    "expire": "expire",
    "provider": "provider",
    "provideruid": "providerUid",
    "provideraccesstoken": "providerAccessToken",
    "provideraccesstokenexpiry": "providerAccessTokenExpiry",
    "providerrefreshtoken": "providerRefreshToken",
    "ip": "ip",
    "oscode": "osCode",
    "osname": "osName",
    "osversion": "osVersion",
    "clienttype": "clientType",
    "clientcode": "clientCode",
    "clientname": "clientName",
    "clientversion": "clientVersion",
    "clientengine": "clientEngine",
    "clientengineversion": "clientEngineVersion",
    "devicename": "deviceName",
    "devicebrand": "deviceBrand",
    "devicemodel": "deviceModel",
    "countrycode": "countryCode",
    "countryname": "countryName",
    "current": "current",
    "factors": "factors",
    "secret": "secret",
    "mfaupdatedat": "mfaUpdatedAt",
}

var id: String ## Session ID.
var createdat: String ## Session creation date in ISO 8601 format.
var updatedat: String ## Session update date in ISO 8601 format.
var userid: String ## User ID.
var expire: String ## Session expiration date in ISO 8601 format.
var provider: String ## Session Provider.
var provideruid: String ## Session Provider User ID.
var provideraccesstoken: String ## Session Provider Access Token.
var provideraccesstokenexpiry: String ## The date of when the access token expires in ISO 8601 format.
var providerrefreshtoken: String ## Session Provider Refresh Token.
var ip: String ## IP in use when the session was created.
var oscode: String ## Operating system code name. View list of [available options](https://github.com/appwrite/appwrite/blob/master/docs/lists/os.json).
var osname: String ## Operating system name.
var osversion: String ## Operating system version.
var clienttype: String ## Client type.
var clientcode: String ## Client code name. View list of [available options](https://github.com/appwrite/appwrite/blob/master/docs/lists/clients.json).
var clientname: String ## Client name.
var clientversion: String ## Client version.
var clientengine: String ## Client engine name.
var clientengineversion: String ## Client engine name.
var devicename: String ## Device name.
var devicebrand: String ## Device brand name.
var devicemodel: String ## Device model name.
var countrycode: String ## Country two-character ISO 3166-1 alpha code.
var countryname: String ## Country name.
var current: bool ## Returns true if this the current user session.
var factors: Array ## Returns a list of active session factors.
var secret: String ## Secret used to authenticate the user. Only included if the request was made with an API key
var mfaupdatedat: String ## Most recent date in ISO 8601 format when the session successfully passed MFA challenge.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteSession.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "factors" and value is Array:
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