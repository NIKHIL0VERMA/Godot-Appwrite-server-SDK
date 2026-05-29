class_name AppwriteFunction
extends RefCounted
## Function[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "execute": "execute",
    "xname": "name",
    "enabled": "enabled",
    "live": "live",
    "logging": "logging",
    "runtime": "runtime",
    "deploymentretention": "deploymentRetention",
    "deploymentid": "deploymentId",
    "deploymentcreatedat": "deploymentCreatedAt",
    "latestdeploymentid": "latestDeploymentId",
    "latestdeploymentcreatedat": "latestDeploymentCreatedAt",
    "latestdeploymentstatus": "latestDeploymentStatus",
    "scopes": "scopes",
    "vars": "vars",
    "events": "events",
    "schedule": "schedule",
    "timeout": "timeout",
    "entrypoint": "entrypoint",
    "commands": "commands",
    "version": "version",
    "installationid": "installationId",
    "providerrepositoryid": "providerRepositoryId",
    "providerbranch": "providerBranch",
    "providerrootdirectory": "providerRootDirectory",
    "providersilentmode": "providerSilentMode",
    "providerbranches": "providerBranches",
    "providerpaths": "providerPaths",
    "buildspecification": "buildSpecification",
    "runtimespecification": "runtimeSpecification",
}

var id: String ## Function ID.
var createdat: String ## Function creation date in ISO 8601 format.
var updatedat: String ## Function update date in ISO 8601 format.
var execute: Array ## Execution permissions.
var xname: String ## Function name.
var enabled: bool ## Function enabled.
var live: bool ## Is the function deployed with the latest configuration? This is set to false if you&#039;ve changed an environment variables, entrypoint, commands, or other settings that needs redeploy to be applied. When the value is false, redeploy the function to update it with the latest configuration.
var logging: bool ## When disabled, executions will exclude logs and errors, and will be slightly faster.
var runtime: String ## Function execution and build runtime.
var deploymentretention: int ## How many days to keep the non-active deployments before they will be automatically deleted.
var deploymentid: String ## Function&#039;s active deployment ID.
var deploymentcreatedat: String ## Active deployment creation date in ISO 8601 format.
var latestdeploymentid: String ## Function&#039;s latest deployment ID.
var latestdeploymentcreatedat: String ## Latest deployment creation date in ISO 8601 format.
var latestdeploymentstatus: String ## Status of latest deployment. Possible values are &quot;waiting&quot;, &quot;processing&quot;, &quot;building&quot;, &quot;ready&quot;, and &quot;failed&quot;.
var scopes: Array ## Allowed permission scopes.
var vars: Array ## Function variables.
var events: Array ## Function trigger events.
var schedule: String ## Function execution schedule in CRON format.
var timeout: int ## Function execution timeout in seconds.
var entrypoint: String ## The entrypoint file used to execute the deployment.
var commands: String ## The build command used to build the deployment.
var version: String ## Version of Open Runtimes used for the function.
var installationid: String ## Function VCS (Version Control System) installation id.
var providerrepositoryid: String ## VCS (Version Control System) Repository ID
var providerbranch: String ## VCS (Version Control System) branch name
var providerrootdirectory: String ## Path to function in VCS (Version Control System) repository
var providersilentmode: bool ## Is VCS (Version Control System) connection is in silent mode? When in silence mode, no comments will be posted on the repository pull or merge requests
var providerbranches: Array ## List of branch name patterns that trigger automatic deployments. Supports glob wildcards. Empty list deploys on all branches.
var providerpaths: Array ## List of file path patterns that trigger automatic deployments. Supports glob wildcards. Empty list deploys on all file changes.
var buildspecification: String ## Machine specification for deployment builds.
var runtimespecification: String ## Machine specification for executions.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteFunction.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "execute" and value is Array:
            m.set(key, value)
            continue
        if key == "scopes" and value is Array:
            m.set(key, value)
            continue
        if key == "vars" and value is Array:
            m.set(key, value)
            continue
        if key == "events" and value is Array:
            m.set(key, value)
            continue
        if key == "providerbranches" and value is Array:
            m.set(key, value)
            continue
        if key == "providerpaths" and value is Array:
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