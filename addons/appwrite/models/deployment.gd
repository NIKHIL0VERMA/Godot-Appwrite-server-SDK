class_name AppwriteDeployment
extends RefCounted
## Deployment[br]

const _DeploymentStatus := preload("res://addons/appwrite/enums/deployment_status.gd")

const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "xtype": "type",
    "resourceid": "resourceId",
    "resourcetype": "resourceType",
    "entrypoint": "entrypoint",
    "sourcesize": "sourceSize",
    "buildsize": "buildSize",
    "totalsize": "totalSize",
    "buildid": "buildId",
    "activate": "activate",
    "screenshotlight": "screenshotLight",
    "screenshotdark": "screenshotDark",
    "status": "status",
    "buildlogs": "buildLogs",
    "buildduration": "buildDuration",
    "providerrepositoryname": "providerRepositoryName",
    "providerrepositoryowner": "providerRepositoryOwner",
    "providerrepositoryurl": "providerRepositoryUrl",
    "providercommithash": "providerCommitHash",
    "providercommitauthorurl": "providerCommitAuthorUrl",
    "providercommitauthor": "providerCommitAuthor",
    "providercommitmessage": "providerCommitMessage",
    "providercommiturl": "providerCommitUrl",
    "providerbranch": "providerBranch",
    "providerbranchurl": "providerBranchUrl",
}

var id: String ## Deployment ID.
var createdat: String ## Deployment creation date in ISO 8601 format.
var updatedat: String ## Deployment update date in ISO 8601 format.
var xtype: String ## Type of deployment.
var resourceid: String ## Resource ID.
var resourcetype: String ## Resource type.
var entrypoint: String ## The entrypoint file to use to execute the deployment code.
var sourcesize: int ## The code size in bytes.
var buildsize: int ## The build output size in bytes.
var totalsize: int ## The total size in bytes (source and build output).
var buildid: String ## The current build ID.
var activate: bool ## Whether the deployment should be automatically activated.
var screenshotlight: String ## Screenshot with light theme preference file ID.
var screenshotdark: String ## Screenshot with dark theme preference file ID.
var status: String ## The deployment status. Possible values are &quot;waiting&quot;, &quot;processing&quot;, &quot;building&quot;, &quot;ready&quot;, &quot;canceled&quot; and &quot;failed&quot;.
var buildlogs: String ## The build logs.
var buildduration: int ## The current build time in seconds.
var providerrepositoryname: String ## The name of the vcs provider repository
var providerrepositoryowner: String ## The name of the vcs provider repository owner
var providerrepositoryurl: String ## The url of the vcs provider repository
var providercommithash: String ## The commit hash of the vcs commit
var providercommitauthorurl: String ## The url of vcs commit author
var providercommitauthor: String ## The name of vcs commit author
var providercommitmessage: String ## The commit message
var providercommiturl: String ## The url of the vcs commit
var providerbranch: String ## The branch of the vcs repository
var providerbranchurl: String ## The branch of the vcs repository

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDeployment.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "status" and value != null:
            if not _DeploymentStatus.is_valid(value):
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