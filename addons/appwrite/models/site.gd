class_name AppwriteSite
extends RefCounted
## Site[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "xname": "name",
    "enabled": "enabled",
    "live": "live",
    "logging": "logging",
    "framework": "framework",
    "deploymentretention": "deploymentRetention",
    "deploymentid": "deploymentId",
    "deploymentcreatedat": "deploymentCreatedAt",
    "deploymentscreenshotlight": "deploymentScreenshotLight",
    "deploymentscreenshotdark": "deploymentScreenshotDark",
    "latestdeploymentid": "latestDeploymentId",
    "latestdeploymentcreatedat": "latestDeploymentCreatedAt",
    "latestdeploymentstatus": "latestDeploymentStatus",
    "vars": "vars",
    "timeout": "timeout",
    "installcommand": "installCommand",
    "buildcommand": "buildCommand",
    "startcommand": "startCommand",
    "outputdirectory": "outputDirectory",
    "installationid": "installationId",
    "providerrepositoryid": "providerRepositoryId",
    "providerbranch": "providerBranch",
    "providerrootdirectory": "providerRootDirectory",
    "providersilentmode": "providerSilentMode",
    "providerbranches": "providerBranches",
    "providerpaths": "providerPaths",
    "buildspecification": "buildSpecification",
    "runtimespecification": "runtimeSpecification",
    "buildruntime": "buildRuntime",
    "adapter": "adapter",
    "fallbackfile": "fallbackFile",
}

var id: String ## Site ID.
var createdat: String ## Site creation date in ISO 8601 format.
var updatedat: String ## Site update date in ISO 8601 format.
var xname: String ## Site name.
var enabled: bool ## Site enabled.
var live: bool ## Is the site deployed with the latest configuration? This is set to false if you&#039;ve changed an environment variables, entrypoint, commands, or other settings that needs redeploy to be applied. When the value is false, redeploy the site to update it with the latest configuration.
var logging: bool ## When disabled, request logs will exclude logs and errors, and site responses will be slightly faster.
var framework: String ## Site framework.
var deploymentretention: int ## How many days to keep the non-active deployments before they will be automatically deleted.
var deploymentid: String ## Site&#039;s active deployment ID.
var deploymentcreatedat: String ## Active deployment creation date in ISO 8601 format.
var deploymentscreenshotlight: String ## Screenshot of active deployment with light theme preference file ID.
var deploymentscreenshotdark: String ## Screenshot of active deployment with dark theme preference file ID.
var latestdeploymentid: String ## Site&#039;s latest deployment ID.
var latestdeploymentcreatedat: String ## Latest deployment creation date in ISO 8601 format.
var latestdeploymentstatus: String ## Status of latest deployment. Possible values are &quot;waiting&quot;, &quot;processing&quot;, &quot;building&quot;, &quot;ready&quot;, and &quot;failed&quot;.
var vars: Array ## Site variables.
var timeout: int ## Site request timeout in seconds.
var installcommand: String ## The install command used to install the site dependencies.
var buildcommand: String ## The build command used to build the site.
var startcommand: String ## Custom command to use when starting site runtime.
var outputdirectory: String ## The directory where the site build output is located.
var installationid: String ## Site VCS (Version Control System) installation id.
var providerrepositoryid: String ## VCS (Version Control System) Repository ID
var providerbranch: String ## VCS (Version Control System) branch name
var providerrootdirectory: String ## Path to site in VCS (Version Control System) repository
var providersilentmode: bool ## Is VCS (Version Control System) connection is in silent mode? When in silence mode, no comments will be posted on the repository pull or merge requests
var providerbranches: Array ## List of branch name patterns that trigger automatic deployments. Supports glob wildcards. Empty list deploys on all branches.
var providerpaths: Array ## List of file path patterns that trigger automatic deployments. Supports glob wildcards. Empty list deploys on all file changes.
var buildspecification: String ## Machine specification for deployment builds.
var runtimespecification: String ## Machine specification for SSR executions.
var buildruntime: String ## Site build runtime.
var adapter: String ## Site framework adapter.
var fallbackfile: String ## Name of fallback file to use instead of 404 page. If null, Appwrite 404 page will be displayed.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteSite.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "vars" and value is Array:
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