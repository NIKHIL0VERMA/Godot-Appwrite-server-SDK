class_name AppwriteBillingPlan
extends RefCounted
## billingPlan[br]

const _BillingPlanGroup := preload("res://addons/appwrite/enums/billing_plan_group.gd")

const _FIELD_MAP := {
    "id": "$id",
    "xname": "name",
    "desc": "desc",
    "order": "order",
    "price": "price",
    "trial": "trial",
    "bandwidth": "bandwidth",
    "storage": "storage",
    "imagetransformations": "imageTransformations",
    "screenshotsgenerated": "screenshotsGenerated",
    "members": "members",
    "webhooks": "webhooks",
    "projects": "projects",
    "platforms": "platforms",
    "users": "users",
    "teams": "teams",
    "databases": "databases",
    "databasesreads": "databasesReads",
    "databaseswrites": "databasesWrites",
    "databasesbatchsize": "databasesBatchSize",
    "buckets": "buckets",
    "filesize": "fileSize",
    "functions": "functions",
    "sites": "sites",
    "executions": "executions",
    "executionsretentioncount": "executionsRetentionCount",
    "gbhours": "GBHours",
    "realtime": "realtime",
    "realtimemessages": "realtimeMessages",
    "messages": "messages",
    "topics": "topics",
    "authphone": "authPhone",
    "domains": "domains",
    "logs": "logs",
    "projectinactivitydays": "projectInactivityDays",
    "alertlimit": "alertLimit",
    "usage": "usage",
    "addons": "addons",
    "budgetcapenabled": "budgetCapEnabled",
    "customsmtp": "customSmtp",
    "emailbranding": "emailBranding",
    "requirespaymentmethod": "requiresPaymentMethod",
    "requiresbillingaddress": "requiresBillingAddress",
    "isavailable": "isAvailable",
    "selfservice": "selfService",
    "premiumsupport": "premiumSupport",
    "budgeting": "budgeting",
    "supportsmocknumbers": "supportsMockNumbers",
    "supportsorganizationroles": "supportsOrganizationRoles",
    "supportscredits": "supportsCredits",
    "supportsdisposableemailvalidation": "supportsDisposableEmailValidation",
    "supportscanonicalemailvalidation": "supportsCanonicalEmailValidation",
    "supportsfreeemailvalidation": "supportsFreeEmailValidation",
    "backupsenabled": "backupsEnabled",
    "usageperproject": "usagePerProject",
    "supportedaddons": "supportedAddons",
    "backuppolicies": "backupPolicies",
    "deploymentsize": "deploymentSize",
    "buildsize": "buildSize",
    "databasesallowencrypt": "databasesAllowEncrypt",
    "limits": "limits",
    "group": "group",
    "program": "program",
}

var id: String ## Plan ID.
var xname: String ## Plan name
var desc: String ## Plan description
var order: int ## Plan order
var price: float ## Price
var trial: int ## Trial days
var bandwidth: int ## Bandwidth
var storage: int ## Storage
var imagetransformations: int ## Image Transformations
var screenshotsgenerated: int ## Screenshots generated
var members: int ## Members
var webhooks: int ## Webhooks
var projects: int ## Projects
var platforms: int ## Platforms
var users: int ## Users
var teams: int ## Teams
var databases: int ## Databases
var databasesreads: int ## Database reads per month
var databaseswrites: int ## Database writes per month
var databasesbatchsize: int ## Database batch size limit
var buckets: int ## Buckets
var filesize: int ## File size
var functions: int ## Functions
var sites: int ## Sites
var executions: int ## Function executions
var executionsretentioncount: int ## Rolling max executions retained per function/site
var gbhours: int ## GB hours for functions
var realtime: int ## Realtime connections
var realtimemessages: int ## Realtime messages
var messages: int ## Messages per month
var topics: int ## Topics for messaging
var authphone: int ## SMS authentications per month
var domains: int ## Custom domains
var logs: int ## Log days
var projectinactivitydays: int ## Number of days of console inactivity before a project is paused. 0 means pausing is disabled.
var alertlimit: int ## Alert threshold percentage
var usage: Dictionary ## Additional resources
var addons: Dictionary ## Addons
var budgetcapenabled: bool ## Budget cap enabled or disabled.
var customsmtp: bool ## Custom SMTP
var emailbranding: bool ## Appwrite branding in email
var requirespaymentmethod: bool ## Does plan require payment method
var requiresbillingaddress: bool ## Does plan require billing address
var isavailable: bool ## Is the billing plan available
var selfservice: bool ## Can user change the plan themselves
var premiumsupport: bool ## Does plan enable premium support
var budgeting: bool ## Does plan support budget cap
var supportsmocknumbers: bool ## Does plan support mock numbers
var supportsorganizationroles: bool ## Does plan support organization roles
var supportscredits: bool ## Does plan support credit
var supportsdisposableemailvalidation: bool ## Does plan support blocking disposable email addresses.
var supportscanonicalemailvalidation: bool ## Does plan support requiring canonical email addresses.
var supportsfreeemailvalidation: bool ## Does plan support blocking free email addresses.
var backupsenabled: bool ## Does plan support backup policies.
var usageperproject: bool ## Whether usage addons are calculated per project.
var supportedaddons: Dictionary ## Supported addons for this plan
var backuppolicies: int ## How many policies does plan support
var deploymentsize: int ## Maximum function and site deployment size in MB
var buildsize: int ## Maximum function and site deployment size in MB
var databasesallowencrypt: bool ## Does the plan support encrypted string attributes or not.
var limits: Dictionary ## Plan specific limits
var group: String ## Group of this billing plan for variants
var program: Dictionary ## Details of the program this plan is a part of.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteBillingPlan.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "group" and value != null:
            if not _BillingPlanGroup.is_valid(value):
                push_error("Invalid enum value for group: %s" % value)
                return AppwriteException.new("Invalid enum value for group: %s" % value, 0, "invalid_enum_value", str(dict))
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