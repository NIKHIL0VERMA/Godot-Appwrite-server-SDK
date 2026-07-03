class_name AppwriteUser
extends RefCounted
## User[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "xname": "name",
    "password": "password",
    "hash": "hash",
    "hashoptions": "hashOptions",
    "registration": "registration",
    "status": "status",
    "labels": "labels",
    "passwordupdate": "passwordUpdate",
    "email": "email",
    "phone": "phone",
    "emailverification": "emailVerification",
    "emailcanonical": "emailCanonical",
    "emailisfree": "emailIsFree",
    "emailisdisposable": "emailIsDisposable",
    "emailiscorporate": "emailIsCorporate",
    "emailiscanonical": "emailIsCanonical",
    "phoneverification": "phoneVerification",
    "mfa": "mfa",
    "prefs": "prefs",
    "targets": "targets",
    "accessedat": "accessedAt",
    "impersonator": "impersonator",
    "impersonatoruserid": "impersonatorUserId",
}

var id: String ## User ID.
var createdat: String ## User creation date in ISO 8601 format.
var updatedat: String ## User update date in ISO 8601 format.
var xname: String ## User name.
var password: String ## Hashed user password.
var hash: String ## Password hashing algorithm.
var hashoptions: Dictionary ## Password hashing algorithm configuration.
var registration: String ## User registration date in ISO 8601 format.
var status: bool ## User status. Pass `true` for enabled and `false` for disabled.
var labels: Array ## Labels for the user.
var passwordupdate: String ## Password update time in ISO 8601 format.
var email: String ## User email address.
var phone: String ## User phone number in E.164 format.
var emailverification: bool ## Email verification status.
var emailcanonical: String ## Canonical form of the user email address.
var emailisfree: bool ## Whether the user email is from a free email provider.
var emailisdisposable: bool ## Whether the user email is from a disposable email provider.
var emailiscorporate: bool ## Whether the user email is from a corporate domain.
var emailiscanonical: bool ## Whether the user email is in its canonical form.
var phoneverification: bool ## Phone verification status.
var mfa: bool ## Multi factor authentication status.
var prefs: Dictionary ## User preferences as a key-value object
var targets: Array ## A user-owned message receiver. A single user may have multiple e.g. emails, phones, and a browser. Each target is registered with a single provider.
var accessedat: String ## Most recent access date in ISO 8601 format. This attribute is only updated again after 24 hours.
var impersonator: bool ## Whether the user can impersonate other users.
var impersonatoruserid: String ## ID of the original actor performing the impersonation. Present only when the current request is impersonating another user. Internal audit logs attribute the action to this user, while the impersonated target is recorded only in internal audit payload data.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteUser.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "labels" and value is Array:
            m.set(key, value)
            continue
        if key == "targets" and value is Array:
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