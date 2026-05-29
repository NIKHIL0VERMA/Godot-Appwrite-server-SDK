class_name AppwriteEmailTemplate
extends RefCounted
## EmailTemplate[br]


const _FIELD_MAP := {
    "templateid": "templateId",
    "locale": "locale",
    "message": "message",
    "sendername": "senderName",
    "senderemail": "senderEmail",
    "replytoemail": "replyToEmail",
    "replytoname": "replyToName",
    "subject": "subject",
}

var templateid: String ## Template type
var locale: String ## Template locale
var message: String ## Template message
var sendername: String ## Name of the sender
var senderemail: String ## Email of the sender
var replytoemail: String ## Reply to email address
var replytoname: String ## Reply to name
var subject: String ## Email subject

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteEmailTemplate.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

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