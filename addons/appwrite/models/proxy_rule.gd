class_name AppwriteProxyRule
extends RefCounted
## Rule[br]

const _ProxyRuleDeploymentResourceType := preload("res://addons/appwrite/enums/proxy_rule_deployment_resource_type.gd")
const _ProxyRuleStatus := preload("res://addons/appwrite/enums/proxy_rule_status.gd")

const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "domain": "domain",
    "xtype": "type",
    "trigger": "trigger",
    "redirecturl": "redirectUrl",
    "redirectstatuscode": "redirectStatusCode",
    "deploymentid": "deploymentId",
    "deploymentresourcetype": "deploymentResourceType",
    "deploymentresourceid": "deploymentResourceId",
    "deploymentvcsproviderbranch": "deploymentVcsProviderBranch",
    "status": "status",
    "logs": "logs",
    "renewat": "renewAt",
}

var id: String ## Rule ID.
var createdat: String ## Rule creation date in ISO 8601 format.
var updatedat: String ## Rule update date in ISO 8601 format.
var domain: String ## Domain name.
var xtype: String ## Action definition for the rule. Possible values are &quot;api&quot;, &quot;deployment&quot;, or &quot;redirect&quot;
var trigger: String ## Defines how the rule was created. Possible values are &quot;manual&quot; or &quot;deployment&quot;
var redirecturl: String ## URL to redirect to. Used if type is &quot;redirect&quot;
var redirectstatuscode: int ## Status code to apply during redirect. Used if type is &quot;redirect&quot;
var deploymentid: String ## ID of deployment. Used if type is &quot;deployment&quot;
var deploymentresourcetype: String ## Type of deployment. Possible values are &quot;function&quot;, &quot;site&quot;. Used if rule&#039;s type is &quot;deployment&quot;.
var deploymentresourceid: String ## ID of deployment&#039;s resource (site or function ID). Used if type is &quot;deployment&quot;
var deploymentvcsproviderbranch: String ## Name of Git branch that updates rule. Used if type is &quot;deployment&quot;
var status: String ## Domain verification status. Possible values are &quot;unverified&quot;, &quot;verifying&quot;, &quot;verified&quot;
var logs: String ## Logs from rule verification or certificate generation. Certificate generation logs are prioritized if both are available.
var renewat: String ## Certificate auto-renewal date in ISO 8601 format.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteProxyRule.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "deploymentresourcetype" and value != null:
            if not _ProxyRuleDeploymentResourceType.is_valid(value):
                push_error("Invalid enum value for deploymentresourcetype: %s" % value)
                return AppwriteException.new("Invalid enum value for deploymentresourcetype: %s" % value, 0, "invalid_enum_value", str(dict))
            m.set(key, value)
            continue
        if key == "status" and value != null:
            if not _ProxyRuleStatus.is_valid(value):
                push_error("Invalid enum value for status: %s" % value)
                return AppwriteException.new("Invalid enum value for status: %s" % value, 0, "invalid_enum_value", str(dict))
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