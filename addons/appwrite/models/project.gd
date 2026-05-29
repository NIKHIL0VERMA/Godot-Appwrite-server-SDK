class_name AppwriteProject
extends RefCounted
## Project[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "xname": "name",
    "teamid": "teamId",
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
    "region": "region",
    "billinglimits": "billingLimits",
    "blocks": "blocks",
    "consoleaccessedat": "consoleAccessedAt",
}

var id: String ## Project ID.
var createdat: String ## Project creation date in ISO 8601 format.
var updatedat: String ## Project update date in ISO 8601 format.
var xname: String ## Project name.
var teamid: String ## Project team ID.
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
var region: String ## Project region
var billinglimits: Dictionary ## Billing limits reached
var blocks: Array ## Project blocks information
var consoleaccessedat: String ## Last time the project was accessed via console. Used with plan&#039;s projectInactivityDays to determine if project is paused.

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