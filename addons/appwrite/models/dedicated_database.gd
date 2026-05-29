class_name AppwriteDedicatedDatabase
extends RefCounted
## DedicatedDatabase[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "projectid": "projectId",
    "xname": "name",
    "xtype": "type",
    "region": "region",
    "engine": "engine",
    "version": "version",
    "specification": "specification",
    "backend": "backend",
    "hostname": "hostname",
    "connectionport": "connectionPort",
    "connectionuser": "connectionUser",
    "connectionpassword": "connectionPassword",
    "connectionstring": "connectionString",
    "status": "status",
    "containerstatus": "containerStatus",
    "lastaccessedat": "lastAccessedAt",
    "idleuntil": "idleUntil",
    "idletimeoutminutes": "idleTimeoutMinutes",
    "cpu": "cpu",
    "memory": "memory",
    "storage": "storage",
    "storageclass": "storageClass",
    "storagemaxgb": "storageMaxGb",
    "nodepool": "nodePool",
    "highavailability": "highAvailability",
    "highavailabilityreplicacount": "highAvailabilityReplicaCount",
    "highavailabilitysyncmode": "highAvailabilitySyncMode",
    "networkmaxconnections": "networkMaxConnections",
    "networkidletimeoutseconds": "networkIdleTimeoutSeconds",
    "networkipallowlist": "networkIPAllowlist",
    "backupenabled": "backupEnabled",
    "backuppitr": "backupPitr",
    "backupcron": "backupCron",
    "backupretentiondays": "backupRetentionDays",
    "pitrretentiondays": "pitrRetentionDays",
    "storageautoscaling": "storageAutoscaling",
    "storageautoscalingthresholdpercent": "storageAutoscalingThresholdPercent",
    "storageautoscalingmaxgb": "storageAutoscalingMaxGb",
    "maintenancewindowday": "maintenanceWindowDay",
    "maintenancewindowhourutc": "maintenanceWindowHourUtc",
    "metricsenabled": "metricsEnabled",
    "sqlapienabled": "sqlApiEnabled",
    "sqlapiallowedstatements": "sqlApiAllowedStatements",
    "sqlapimaxrows": "sqlApiMaxRows",
    "sqlapimaxbytes": "sqlApiMaxBytes",
    "sqlapitimeoutseconds": "sqlApiTimeoutSeconds",
    "error": "error",
}

var id: String ## Dedicated database ID.
var createdat: String ## Database creation time in ISO 8601 format.
var updatedat: String ## Database update date in ISO 8601 format.
var projectid: String ## Project ID that owns this database.
var xname: String ## Database display name.
var xtype: String ## Database type: shared (serverless) or dedicated (always-on).
var region: String ## Region identifier (e.g., fra, nyc, syd).
var engine: String ## Database engine: postgres, mysql, mariadb, or mongodb.
var version: String ## Database engine version.
var specification: String ## Specification identifier.
var backend: String ## Database backend provider. Possible values: prisma, edge.
var hostname: String ## Database hostname for connections.
var connectionport: int ## Database port for connections.
var connectionuser: String ## Database username for connections.
var connectionpassword: String ## Database password for connections.
var connectionstring: String ## Full database connection string (URI format).
var status: String ## Database status. Possible values: provisioning, ready, inactive, paused, failed, deleted, restoring, scaling.
var containerstatus: String ## Container status for shared databases: active or inactive.
var lastaccessedat: String ## Last activity timestamp in ISO 8601 format.
var idleuntil: String ## Timestamp when container will be considered idle and scale to zero (ISO 8601 format).
var idletimeoutminutes: int ## Minutes of inactivity before container scales to zero.
var cpu: int ## CPU allocated in millicores.
var memory: int ## Memory allocated in MB.
var storage: int ## Storage allocated in GB.
var storageclass: String ## Storage class: ssd, nvme, or hdd.
var storagemaxgb: int ## Maximum storage allowed in GB. 0 means use system default.
var nodepool: String ## Kubernetes node pool where the database is scheduled.
var highavailability: bool ## Whether high availability is enabled.
var highavailabilityreplicacount: int ## Number of high availability replicas.
var highavailabilitysyncmode: String ## Replication sync mode: async, sync, or quorum.
var networkmaxconnections: int ## Maximum concurrent connections.
var networkidletimeoutseconds: int ## Connection idle timeout in seconds.
var networkipallowlist: Array ## IP addresses/CIDR ranges allowed to connect.
var backupenabled: bool ## Whether automatic backups are enabled.
var backuppitr: bool ## Whether point-in-time recovery is enabled.
var backupcron: String ## Backup schedule in cron format.
var backupretentiondays: int ## Number of days to retain backups.
var pitrretentiondays: int ## Number of days to retain PITR data.
var storageautoscaling: bool ## Whether automatic storage expansion is enabled.
var storageautoscalingthresholdpercent: int ## Storage usage percentage that triggers automatic expansion.
var storageautoscalingmaxgb: int ## Maximum storage size in GB for autoscaling. 0 means no limit.
var maintenancewindowday: String ## Day of the week for the maintenance window. Possible values: sun, mon, tue, wed, thu, fri, sat.
var maintenancewindowhourutc: int ## Hour in UTC (0-23) when the maintenance window starts.
var metricsenabled: bool ## Whether metrics collection is enabled.
var sqlapienabled: bool ## Whether the SQL API sidecar is enabled for this database.
var sqlapiallowedstatements: Array ## Statement types accepted by the SQL API. Allowed values: SELECT, INSERT, UPDATE, DELETE.
var sqlapimaxrows: int ## Maximum rows returned per SQL API execution. Results larger than this are truncated.
var sqlapimaxbytes: int ## Maximum serialised SQL API result payload in bytes. Results larger than this are truncated.
var sqlapitimeoutseconds: int ## Maximum server-side SQL API execution time in seconds before the query is cancelled.
var error: String ## Error message if status is failed.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDedicatedDatabase.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "networkipallowlist" and value is Array:
            m.set(key, value)
            continue
        if key == "sqlapiallowedstatements" and value is Array:
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