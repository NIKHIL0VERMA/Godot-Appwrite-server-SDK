class_name AppwriteOrganization
extends RefCounted
## Organization[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "xname": "name",
    "total": "total",
    "prefs": "prefs",
    "billingbudget": "billingBudget",
    "budgetalerts": "budgetAlerts",
    "billingplan": "billingPlan",
    "billingplanid": "billingPlanId",
    "billingplandetails": "billingPlanDetails",
    "billingemail": "billingEmail",
    "billingstartdate": "billingStartDate",
    "billingcurrentinvoicedate": "billingCurrentInvoiceDate",
    "billingnextinvoicedate": "billingNextInvoiceDate",
    "billingtrialstartdate": "billingTrialStartDate",
    "billingtrialdays": "billingTrialDays",
    "billingaggregationid": "billingAggregationId",
    "billinginvoiceid": "billingInvoiceId",
    "paymentmethodid": "paymentMethodId",
    "billingaddressid": "billingAddressId",
    "backuppaymentmethodid": "backupPaymentMethodId",
    "status": "status",
    "remarks": "remarks",
    "agreementbaa": "agreementBAA",
    "programmanagername": "programManagerName",
    "programmanagercalendar": "programManagerCalendar",
    "programdiscordchannelname": "programDiscordChannelName",
    "programdiscordchannelurl": "programDiscordChannelUrl",
    "billinglimits": "billingLimits",
    "billingplandowngrade": "billingPlanDowngrade",
    "billingtaxid": "billingTaxId",
    "markedfordeletion": "markedForDeletion",
    "platform": "platform",
    "projects": "projects",
}

var id: String ## Team ID.
var createdat: String ## Team creation date in ISO 8601 format.
var updatedat: String ## Team update date in ISO 8601 format.
var xname: String ## Team name.
var total: int ## Total number of team members.
var prefs: Dictionary ## Team preferences as a key-value object
var billingbudget: int ## Project budget limit
var budgetalerts: Array ## Project budget limit
var billingplan: String ## Organization&#039;s billing plan ID.
var billingplanid: String ## Organization&#039;s billing plan ID.
var billingplandetails: Dictionary ## Organization&#039;s billing plan.
var billingemail: String ## Billing email set for the organization.
var billingstartdate: String ## Billing cycle start date.
var billingcurrentinvoicedate: String ## Current invoice cycle start date.
var billingnextinvoicedate: String ## Next invoice cycle start date.
var billingtrialstartdate: String ## Start date of trial.
var billingtrialdays: int ## Number of trial days.
var billingaggregationid: String ## Current active aggregation id.
var billinginvoiceid: String ## Current active aggregation id.
var paymentmethodid: String ## Default payment method.
var billingaddressid: String ## Default payment method.
var backuppaymentmethodid: String ## Backup payment method.
var status: String ## Team status.
var remarks: String ## Remarks on team status.
var agreementbaa: String ## Organization agreements
var programmanagername: String ## Program manager&#039;s name.
var programmanagercalendar: String ## Program manager&#039;s calendar link.
var programdiscordchannelname: String ## Program&#039;s discord channel name.
var programdiscordchannelurl: String ## Program&#039;s discord channel URL.
var billinglimits: Dictionary ## Billing limits reached
var billingplandowngrade: String ## Billing plan selected for downgrade.
var billingtaxid: String ## Tax Id
var markedfordeletion: bool ## Marked for deletion
var platform: String ## Product with which the organization is associated (appwrite or imagine)
var projects: Array ## Selected projects

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteOrganization.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "budgetalerts" and value is Array:
            m.set(key, value)
            continue
        if key == "projects" and value is Array:
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