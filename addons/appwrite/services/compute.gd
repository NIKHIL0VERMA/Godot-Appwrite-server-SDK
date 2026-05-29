extends "../utils/service.gd"
## Service class.


## List all dedicated databases. Results support pagination.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings.[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabaseList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_databases(queries: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")

    var _path := '/compute/databases'

    var _params := {}
    if queries != null:
        _params['queries'] = queries

    var _headers := {
    }

    var model_script = AppwriteDedicatedDatabaseList

    return await _call('get', _path, _headers, _params, model_script)


## Create a new dedicated database with the chosen engine and configuration. Status will be &#039;provisioning&#039; until the database is ready.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Database display name. Max length: 128 chars.[br]
## - [param engine] [String]: Database engine: postgres, mysql, mariadb, or mongodb.[br]
## - [param version] [String]: Database engine version. Defaults to latest for selected engine.[br]
## - [param region] [String]: Region identifier. Use one of the enabled region codes (e.g., fra, nyc, syd).[br]
## - [param xtype] [String]: Database type: shared (serverless) or dedicated (always-on).[br]
## - [param specification] [String]: Specification identifier.[br]
## - [param backend] [String]: Database backend provider: prisma, or edge.[br]
## - [param cpu] [int]: CPU in millicores (125-16000).[br]
## - [param memory] [int]: Memory in MB to allocate (128-65536).[br]
## - [param storage] [int]: Storage in GB to allocate (1-16384).[br]
## - [param storage_class] [String]: Storage class: ssd, nvme, or hdd.[br]
## - [param storage_max_gb] [int]: Maximum storage limit in GB. 0 uses system default.[br]
## - [param high_availability] [bool]: Enable high availability.[br]
## - [param high_availability_replica_count] [int]: Number of high availability replicas (0-5).[br]
## - [param high_availability_sync_mode] [String]: Replication sync mode. Allowed values: async, sync, quorum.[br]
## - [param network_max_connections] [int]: Maximum concurrent connections.[br]
## - [param network_idle_timeout_seconds] [int]: Connection idle timeout in seconds.[br]
## - [param network_ip_allowlist] [Array]: IP addresses/CIDR ranges allowed to connect.[br]
## - [param idle_timeout_minutes] [int]: Minutes of inactivity before container scales to zero.[br]
## - [param backup_enabled] [bool]: Enable automatic backups.[br]
## - [param backup_pitr] [bool]: Enable point-in-time recovery.[br]
## - [param backup_cron] [String]: Backup schedule in cron format.[br]
## - [param backup_retention_days] [int]: Number of days to retain backups.[br]
## - [param pitr_retention_days] [int]: Number of days to retain PITR data.[br]
## - [param storage_autoscaling] [bool]: Enable automatic storage expansion when usage exceeds threshold.[br]
## - [param storage_autoscaling_threshold_percent] [int]: Storage usage percentage (50-95) that triggers automatic expansion.[br]
## - [param storage_autoscaling_max_gb] [int]: Maximum storage size in GB for autoscaling. 0 means no limit.[br]
## - [param metrics_enabled] [bool]: Enable metrics collection.[br]
## - [param pooler_enabled] [bool]: Enable connection pooler on provision.[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabase] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_database(database_id: String, xname: String, engine: Variant = null, version: Variant = null, region: Variant = null, xtype: Variant = null, specification: Variant = null, backend: Variant = null, cpu: Variant = null, memory: Variant = null, storage: Variant = null, storage_class: Variant = null, storage_max_gb: Variant = null, high_availability: Variant = null, high_availability_replica_count: Variant = null, high_availability_sync_mode: Variant = null, network_max_connections: Variant = null, network_idle_timeout_seconds: Variant = null, network_ip_allowlist: Variant = null, idle_timeout_minutes: Variant = null, backup_enabled: Variant = null, backup_pitr: Variant = null, backup_cron: Variant = null, backup_retention_days: Variant = null, pitr_retention_days: Variant = null, storage_autoscaling: Variant = null, storage_autoscaling_threshold_percent: Variant = null, storage_autoscaling_max_gb: Variant = null, metrics_enabled: Variant = null, pooler_enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if engine != null and not engine is String:
        return AppwriteException.new("Invalid type for parameter 'engine'. Expected String.", 0, "argument_error", "")
    if version != null and not version is String:
        return AppwriteException.new("Invalid type for parameter 'version'. Expected String.", 0, "argument_error", "")
    if region != null and not region is String:
        return AppwriteException.new("Invalid type for parameter 'region'. Expected String.", 0, "argument_error", "")
    if xtype != null and not xtype is String:
        return AppwriteException.new("Invalid type for parameter 'xtype'. Expected String.", 0, "argument_error", "")
    if specification != null and not specification is String:
        return AppwriteException.new("Invalid type for parameter 'specification'. Expected String.", 0, "argument_error", "")
    if backend != null and not backend is String:
        return AppwriteException.new("Invalid type for parameter 'backend'. Expected String.", 0, "argument_error", "")
    if cpu != null and not cpu is int:
        return AppwriteException.new("Invalid type for parameter 'cpu'. Expected int.", 0, "argument_error", "")
    if memory != null and not memory is int:
        return AppwriteException.new("Invalid type for parameter 'memory'. Expected int.", 0, "argument_error", "")
    if storage != null and not storage is int:
        return AppwriteException.new("Invalid type for parameter 'storage'. Expected int.", 0, "argument_error", "")
    if storage_class != null and not storage_class is String:
        return AppwriteException.new("Invalid type for parameter 'storage_class'. Expected String.", 0, "argument_error", "")
    if storage_max_gb != null and not storage_max_gb is int:
        return AppwriteException.new("Invalid type for parameter 'storage_max_gb'. Expected int.", 0, "argument_error", "")
    if high_availability != null and not high_availability is bool:
        return AppwriteException.new("Invalid type for parameter 'high_availability'. Expected bool.", 0, "argument_error", "")
    if high_availability_replica_count != null and not high_availability_replica_count is int:
        return AppwriteException.new("Invalid type for parameter 'high_availability_replica_count'. Expected int.", 0, "argument_error", "")
    if high_availability_sync_mode != null and not high_availability_sync_mode is String:
        return AppwriteException.new("Invalid type for parameter 'high_availability_sync_mode'. Expected String.", 0, "argument_error", "")
    if network_max_connections != null and not network_max_connections is int:
        return AppwriteException.new("Invalid type for parameter 'network_max_connections'. Expected int.", 0, "argument_error", "")
    if network_idle_timeout_seconds != null and not network_idle_timeout_seconds is int:
        return AppwriteException.new("Invalid type for parameter 'network_idle_timeout_seconds'. Expected int.", 0, "argument_error", "")
    if network_ip_allowlist != null and not network_ip_allowlist is Array:
        return AppwriteException.new("Invalid type for parameter 'network_ip_allowlist'. Expected Array.", 0, "argument_error", "")
    if idle_timeout_minutes != null and not idle_timeout_minutes is int:
        return AppwriteException.new("Invalid type for parameter 'idle_timeout_minutes'. Expected int.", 0, "argument_error", "")
    if backup_enabled != null and not backup_enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'backup_enabled'. Expected bool.", 0, "argument_error", "")
    if backup_pitr != null and not backup_pitr is bool:
        return AppwriteException.new("Invalid type for parameter 'backup_pitr'. Expected bool.", 0, "argument_error", "")
    if backup_cron != null and not backup_cron is String:
        return AppwriteException.new("Invalid type for parameter 'backup_cron'. Expected String.", 0, "argument_error", "")
    if backup_retention_days != null and not backup_retention_days is int:
        return AppwriteException.new("Invalid type for parameter 'backup_retention_days'. Expected int.", 0, "argument_error", "")
    if pitr_retention_days != null and not pitr_retention_days is int:
        return AppwriteException.new("Invalid type for parameter 'pitr_retention_days'. Expected int.", 0, "argument_error", "")
    if storage_autoscaling != null and not storage_autoscaling is bool:
        return AppwriteException.new("Invalid type for parameter 'storage_autoscaling'. Expected bool.", 0, "argument_error", "")
    if storage_autoscaling_threshold_percent != null and not storage_autoscaling_threshold_percent is int:
        return AppwriteException.new("Invalid type for parameter 'storage_autoscaling_threshold_percent'. Expected int.", 0, "argument_error", "")
    if storage_autoscaling_max_gb != null and not storage_autoscaling_max_gb is int:
        return AppwriteException.new("Invalid type for parameter 'storage_autoscaling_max_gb'. Expected int.", 0, "argument_error", "")
    if metrics_enabled != null and not metrics_enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'metrics_enabled'. Expected bool.", 0, "argument_error", "")
    if pooler_enabled != null and not pooler_enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'pooler_enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/compute/databases'

    var _params := {}
    _params['databaseId'] = database_id
    _params['name'] = xname
    if engine != null:
        _params['engine'] = engine
    if version != null:
        _params['version'] = version
    if region != null:
        _params['region'] = region
    if xtype != null:
        _params['type'] = xtype
    if specification != null:
        _params['specification'] = specification
    if backend != null:
        _params['backend'] = backend
    if cpu != null:
        _params['cpu'] = cpu
    if memory != null:
        _params['memory'] = memory
    if storage != null:
        _params['storage'] = storage
    if storage_class != null:
        _params['storageClass'] = storage_class
    if storage_max_gb != null:
        _params['storageMaxGb'] = storage_max_gb
    if high_availability != null:
        _params['highAvailability'] = high_availability
    if high_availability_replica_count != null:
        _params['highAvailabilityReplicaCount'] = high_availability_replica_count
    if high_availability_sync_mode != null:
        _params['highAvailabilitySyncMode'] = high_availability_sync_mode
    if network_max_connections != null:
        _params['networkMaxConnections'] = network_max_connections
    if network_idle_timeout_seconds != null:
        _params['networkIdleTimeoutSeconds'] = network_idle_timeout_seconds
    if network_ip_allowlist != null:
        _params['networkIPAllowlist'] = network_ip_allowlist
    if idle_timeout_minutes != null:
        _params['idleTimeoutMinutes'] = idle_timeout_minutes
    if backup_enabled != null:
        _params['backupEnabled'] = backup_enabled
    if backup_pitr != null:
        _params['backupPitr'] = backup_pitr
    if backup_cron != null:
        _params['backupCron'] = backup_cron
    if backup_retention_days != null:
        _params['backupRetentionDays'] = backup_retention_days
    if pitr_retention_days != null:
        _params['pitrRetentionDays'] = pitr_retention_days
    if storage_autoscaling != null:
        _params['storageAutoscaling'] = storage_autoscaling
    if storage_autoscaling_threshold_percent != null:
        _params['storageAutoscalingThresholdPercent'] = storage_autoscaling_threshold_percent
    if storage_autoscaling_max_gb != null:
        _params['storageAutoscalingMaxGb'] = storage_autoscaling_max_gb
    if metrics_enabled != null:
        _params['metricsEnabled'] = metrics_enabled
    if pooler_enabled != null:
        _params['poolerEnabled'] = pooler_enabled

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDedicatedDatabase

    return await _call('post', _path, _headers, _params, model_script)


## Get a dedicated database by its unique ID. Returns the database configuration and current status.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabase] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_database(database_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/compute/databases/{databaseId}'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteDedicatedDatabase

    return await _call('get', _path, _headers, _params, model_script)


## Update a dedicated database configuration. All changes are applied with zero downtime. Resource changes (cpu, memory) are handled via rolling cutover. Storage expansion is done online. All other settings are applied in-place.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param xname] [String]: Database display name.[br]
## - [param status] [String]: Database status. Allowed values: ready, paused, inactive. Set to &quot;paused&quot; to pause, &quot;ready&quot; to resume, or &quot;inactive&quot; to spin down a shared database.[br]
## - [param specification] [String]: Specification. Changes cpu, memory, and type based on specification config.[br]
## - [param cpu] [float]: CPU cores to allocate (125-16000).[br]
## - [param memory] [int]: Memory in MB to allocate (128-65536).[br]
## - [param storage] [int]: Storage in GB to allocate (1-16384).[br]
## - [param storage_class] [String]: Storage class. Allowed values: ssd, nvme, hdd.[br]
## - [param high_availability] [bool]: Enable high availability.[br]
## - [param high_availability_replica_count] [int]: Number of high availability replicas (0-5).[br]
## - [param network_max_connections] [int]: Maximum concurrent connections.[br]
## - [param network_idle_timeout_seconds] [int]: Connection idle timeout in seconds (60-86400).[br]
## - [param network_ip_allowlist] [Array]: IP addresses/CIDR ranges allowed to connect.[br]
## - [param idle_timeout_minutes] [int]: Minutes before container scales to zero.[br]
## - [param backup_enabled] [bool]: Enable automatic backups.[br]
## - [param backup_pitr] [bool]: Enable point-in-time recovery.[br]
## - [param backup_cron] [String]: Backup schedule in cron format.[br]
## - [param backup_retention_days] [int]: Days to retain backups.[br]
## - [param pitr_retention_days] [int]: Days to retain PITR data.[br]
## - [param storage_autoscaling] [bool]: Enable automatic storage expansion when usage exceeds threshold.[br]
## - [param storage_autoscaling_threshold_percent] [int]: Storage usage percentage (50-95) that triggers automatic expansion.[br]
## - [param storage_autoscaling_max_gb] [int]: Maximum storage size in GB for autoscaling. 0 means no limit.[br]
## - [param pooler_enabled] [bool]: Attach or detach the connection pooler sidecar. Set to true to add the sidecar (no-op if already attached) or false to remove it.[br]
## - [param metrics_enabled] [bool]: Enable or disable the metrics-agent sidecar.[br]
## - [param metrics_trace_sample_rate] [float]: Fraction of queries to trace (0.0–1.0). Forwarded to the sidecar.[br]
## - [param metrics_slow_query_log_threshold_ms] [int]: Threshold in ms above which queries are logged as slow. Forwarded to the sidecar.[br]
## - [param sql_api_enabled] [bool]: Enable the SQL API sidecar for this database.[br]
## - [param sql_api_allowed_statements] [Array]: Statement types the SQL API accepts. Allowed values: SELECT, INSERT, UPDATE, DELETE.[br]
## - [param sql_api_max_rows] [int]: Maximum rows returned per SQL API execution (1-1000000).[br]
## - [param sql_api_max_bytes] [int]: Maximum serialised SQL API result payload in bytes (1024-104857600).[br]
## - [param sql_api_timeout_seconds] [int]: Per-call SQL API execution timeout in seconds (1-300).[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabase] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_database(database_id: String, xname: Variant = null, status: Variant = null, specification: Variant = null, cpu: Variant = null, memory: Variant = null, storage: Variant = null, storage_class: Variant = null, high_availability: Variant = null, high_availability_replica_count: Variant = null, network_max_connections: Variant = null, network_idle_timeout_seconds: Variant = null, network_ip_allowlist: Variant = null, idle_timeout_minutes: Variant = null, backup_enabled: Variant = null, backup_pitr: Variant = null, backup_cron: Variant = null, backup_retention_days: Variant = null, pitr_retention_days: Variant = null, storage_autoscaling: Variant = null, storage_autoscaling_threshold_percent: Variant = null, storage_autoscaling_max_gb: Variant = null, pooler_enabled: Variant = null, metrics_enabled: Variant = null, metrics_trace_sample_rate: Variant = null, metrics_slow_query_log_threshold_ms: Variant = null, sql_api_enabled: Variant = null, sql_api_allowed_statements: Variant = null, sql_api_max_rows: Variant = null, sql_api_max_bytes: Variant = null, sql_api_timeout_seconds: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")
    if status != null and not status is String:
        return AppwriteException.new("Invalid type for parameter 'status'. Expected String.", 0, "argument_error", "")
    if specification != null and not specification is String:
        return AppwriteException.new("Invalid type for parameter 'specification'. Expected String.", 0, "argument_error", "")
    if cpu != null and not cpu is float and not typeof(cpu) == TYPE_INT:
        return AppwriteException.new("Invalid type for parameter 'cpu'. Expected float.", 0, "argument_error", "")
    if memory != null and not memory is int:
        return AppwriteException.new("Invalid type for parameter 'memory'. Expected int.", 0, "argument_error", "")
    if storage != null and not storage is int:
        return AppwriteException.new("Invalid type for parameter 'storage'. Expected int.", 0, "argument_error", "")
    if storage_class != null and not storage_class is String:
        return AppwriteException.new("Invalid type for parameter 'storage_class'. Expected String.", 0, "argument_error", "")
    if high_availability != null and not high_availability is bool:
        return AppwriteException.new("Invalid type for parameter 'high_availability'. Expected bool.", 0, "argument_error", "")
    if high_availability_replica_count != null and not high_availability_replica_count is int:
        return AppwriteException.new("Invalid type for parameter 'high_availability_replica_count'. Expected int.", 0, "argument_error", "")
    if network_max_connections != null and not network_max_connections is int:
        return AppwriteException.new("Invalid type for parameter 'network_max_connections'. Expected int.", 0, "argument_error", "")
    if network_idle_timeout_seconds != null and not network_idle_timeout_seconds is int:
        return AppwriteException.new("Invalid type for parameter 'network_idle_timeout_seconds'. Expected int.", 0, "argument_error", "")
    if network_ip_allowlist != null and not network_ip_allowlist is Array:
        return AppwriteException.new("Invalid type for parameter 'network_ip_allowlist'. Expected Array.", 0, "argument_error", "")
    if idle_timeout_minutes != null and not idle_timeout_minutes is int:
        return AppwriteException.new("Invalid type for parameter 'idle_timeout_minutes'. Expected int.", 0, "argument_error", "")
    if backup_enabled != null and not backup_enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'backup_enabled'. Expected bool.", 0, "argument_error", "")
    if backup_pitr != null and not backup_pitr is bool:
        return AppwriteException.new("Invalid type for parameter 'backup_pitr'. Expected bool.", 0, "argument_error", "")
    if backup_cron != null and not backup_cron is String:
        return AppwriteException.new("Invalid type for parameter 'backup_cron'. Expected String.", 0, "argument_error", "")
    if backup_retention_days != null and not backup_retention_days is int:
        return AppwriteException.new("Invalid type for parameter 'backup_retention_days'. Expected int.", 0, "argument_error", "")
    if pitr_retention_days != null and not pitr_retention_days is int:
        return AppwriteException.new("Invalid type for parameter 'pitr_retention_days'. Expected int.", 0, "argument_error", "")
    if storage_autoscaling != null and not storage_autoscaling is bool:
        return AppwriteException.new("Invalid type for parameter 'storage_autoscaling'. Expected bool.", 0, "argument_error", "")
    if storage_autoscaling_threshold_percent != null and not storage_autoscaling_threshold_percent is int:
        return AppwriteException.new("Invalid type for parameter 'storage_autoscaling_threshold_percent'. Expected int.", 0, "argument_error", "")
    if storage_autoscaling_max_gb != null and not storage_autoscaling_max_gb is int:
        return AppwriteException.new("Invalid type for parameter 'storage_autoscaling_max_gb'. Expected int.", 0, "argument_error", "")
    if pooler_enabled != null and not pooler_enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'pooler_enabled'. Expected bool.", 0, "argument_error", "")
    if metrics_enabled != null and not metrics_enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'metrics_enabled'. Expected bool.", 0, "argument_error", "")
    if metrics_trace_sample_rate != null and not metrics_trace_sample_rate is float and not typeof(metrics_trace_sample_rate) == TYPE_INT:
        return AppwriteException.new("Invalid type for parameter 'metrics_trace_sample_rate'. Expected float.", 0, "argument_error", "")
    if metrics_slow_query_log_threshold_ms != null and not metrics_slow_query_log_threshold_ms is int:
        return AppwriteException.new("Invalid type for parameter 'metrics_slow_query_log_threshold_ms'. Expected int.", 0, "argument_error", "")
    if sql_api_enabled != null and not sql_api_enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'sql_api_enabled'. Expected bool.", 0, "argument_error", "")
    if sql_api_allowed_statements != null and not sql_api_allowed_statements is Array:
        return AppwriteException.new("Invalid type for parameter 'sql_api_allowed_statements'. Expected Array.", 0, "argument_error", "")
    if sql_api_max_rows != null and not sql_api_max_rows is int:
        return AppwriteException.new("Invalid type for parameter 'sql_api_max_rows'. Expected int.", 0, "argument_error", "")
    if sql_api_max_bytes != null and not sql_api_max_bytes is int:
        return AppwriteException.new("Invalid type for parameter 'sql_api_max_bytes'. Expected int.", 0, "argument_error", "")
    if sql_api_timeout_seconds != null and not sql_api_timeout_seconds is int:
        return AppwriteException.new("Invalid type for parameter 'sql_api_timeout_seconds'. Expected int.", 0, "argument_error", "")

    var _path := '/compute/databases/{databaseId}'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}
    if xname != null:
        _params['name'] = xname
    if status != null:
        _params['status'] = status
    if specification != null:
        _params['specification'] = specification
    if cpu != null:
        _params['cpu'] = cpu
    if memory != null:
        _params['memory'] = memory
    if storage != null:
        _params['storage'] = storage
    if storage_class != null:
        _params['storageClass'] = storage_class
    if high_availability != null:
        _params['highAvailability'] = high_availability
    if high_availability_replica_count != null:
        _params['highAvailabilityReplicaCount'] = high_availability_replica_count
    if network_max_connections != null:
        _params['networkMaxConnections'] = network_max_connections
    if network_idle_timeout_seconds != null:
        _params['networkIdleTimeoutSeconds'] = network_idle_timeout_seconds
    if network_ip_allowlist != null:
        _params['networkIPAllowlist'] = network_ip_allowlist
    if idle_timeout_minutes != null:
        _params['idleTimeoutMinutes'] = idle_timeout_minutes
    if backup_enabled != null:
        _params['backupEnabled'] = backup_enabled
    if backup_pitr != null:
        _params['backupPitr'] = backup_pitr
    if backup_cron != null:
        _params['backupCron'] = backup_cron
    if backup_retention_days != null:
        _params['backupRetentionDays'] = backup_retention_days
    if pitr_retention_days != null:
        _params['pitrRetentionDays'] = pitr_retention_days
    if storage_autoscaling != null:
        _params['storageAutoscaling'] = storage_autoscaling
    if storage_autoscaling_threshold_percent != null:
        _params['storageAutoscalingThresholdPercent'] = storage_autoscaling_threshold_percent
    if storage_autoscaling_max_gb != null:
        _params['storageAutoscalingMaxGb'] = storage_autoscaling_max_gb
    if pooler_enabled != null:
        _params['poolerEnabled'] = pooler_enabled
    if metrics_enabled != null:
        _params['metricsEnabled'] = metrics_enabled
    if metrics_trace_sample_rate != null:
        _params['metricsTraceSampleRate'] = metrics_trace_sample_rate
    if metrics_slow_query_log_threshold_ms != null:
        _params['metricsSlowQueryLogThresholdMs'] = metrics_slow_query_log_threshold_ms
    if sql_api_enabled != null:
        _params['sqlApiEnabled'] = sql_api_enabled
    if sql_api_allowed_statements != null:
        _params['sqlApiAllowedStatements'] = sql_api_allowed_statements
    if sql_api_max_rows != null:
        _params['sqlApiMaxRows'] = sql_api_max_rows
    if sql_api_max_bytes != null:
        _params['sqlApiMaxBytes'] = sql_api_max_bytes
    if sql_api_timeout_seconds != null:
        _params['sqlApiTimeoutSeconds'] = sql_api_timeout_seconds

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDedicatedDatabase

    return await _call('patch', _path, _headers, _params, model_script)


## Delete a dedicated database. This action is irreversible. The database status will be set to &#039;deleting&#039; and all resources will be cleaned up.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_database(database_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/compute/databases/{databaseId}'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## List all backups for a dedicated database. Results can be filtered by status and type.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: status, type, databaseId[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabaseBackupList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_database_backups(database_id: String, queries: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")

    var _path := '/compute/databases/{databaseId}/backups'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}
    if queries != null:
        _params['queries'] = queries

    var _headers := {
    }

    var model_script = AppwriteDedicatedDatabaseBackupList

    return await _call('get', _path, _headers, _params, model_script)


## Create a manual backup of a dedicated database. The backup will be created asynchronously and its status can be checked via the get backup endpoint.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param xtype] [String]: Backup type: full or incremental.[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabaseBackup] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_database_backup(database_id: String, xtype: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xtype != null and not xtype is String:
        return AppwriteException.new("Invalid type for parameter 'xtype'. Expected String.", 0, "argument_error", "")

    var _path := '/compute/databases/{databaseId}/backups'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}
    if xtype != null:
        _params['type'] = xtype

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDedicatedDatabaseBackup

    return await _call('post', _path, _headers, _params, model_script)


## Configure off-cluster backup storage for a dedicated database. Supports S3, GCS, and Azure Blob Storage destinations. Backups will be stored to the configured destination in addition to on-cluster storage.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param provider] [String]: Storage provider for off-cluster backups. Allowed values: s3 (Amazon S3 or S3-compatible), gcs (Google Cloud Storage), azure (Azure Blob Storage).[br]
## - [param bucket] [String]: Storage bucket or container name.[br]
## - [param access_key] [String]: Access key or client ID for authentication.[br]
## - [param secret_key] [String]: Secret key or service account JSON for authentication.[br]
## - [param region] [String]: Storage region.[br]
## - [param prefix] [String]: Object key prefix for backups.[br]
## - [param endpoint] [String]: Custom endpoint for S3-compatible storage (e.g. MinIO).[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabaseBackupStorage] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_database_backup_storage(database_id: String, provider: String, bucket: String, access_key: String, secret_key: String, region: Variant = null, prefix: Variant = null, endpoint: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if region != null and not region is String:
        return AppwriteException.new("Invalid type for parameter 'region'. Expected String.", 0, "argument_error", "")
    if prefix != null and not prefix is String:
        return AppwriteException.new("Invalid type for parameter 'prefix'. Expected String.", 0, "argument_error", "")
    if endpoint != null and not endpoint is String:
        return AppwriteException.new("Invalid type for parameter 'endpoint'. Expected String.", 0, "argument_error", "")

    var _path := '/compute/databases/{databaseId}/backups/storage'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}
    _params['provider'] = provider
    _params['bucket'] = bucket
    if region != null:
        _params['region'] = region
    if prefix != null:
        _params['prefix'] = prefix
    if endpoint != null:
        _params['endpoint'] = endpoint
    _params['accessKey'] = access_key
    _params['secretKey'] = secret_key

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDedicatedDatabaseBackupStorage

    return await _call('put', _path, _headers, _params, model_script)


## Get details of a specific database backup including its status, size, and timestamps.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param backup_id] [String]: Backup ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabaseBackup] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_database_backup(database_id: String, backup_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/compute/databases/{databaseId}/backups/{backupId}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{backupId}', str(backup_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteDedicatedDatabaseBackup

    return await _call('get', _path, _headers, _params, model_script)


## Delete a database backup. This will permanently remove the backup from storage and cannot be undone.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param backup_id] [String]: Backup ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_database_backup(database_id: String, backup_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/compute/databases/{databaseId}/backups/{backupId}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{backupId}', str(backup_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## List all ephemeral branches for a dedicated database. Returns branch metadata including ID, name, namespace, and expiration time.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabaseBranchList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_database_branches(database_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/compute/databases/{databaseId}/branches'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteDedicatedDatabaseBranchList

    return await _call('get', _path, _headers, _params, model_script)


## Create an ephemeral database branch from the primary via PVC snapshot. The branch is a full copy of the database at the current point in time, useful for testing schema migrations or running experiments without affecting production data. Branches expire after the configured TTL (default 24 hours). The branch is created asynchronously.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param branch_id] [String]: Branch ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param ttl] [int]: Time-to-live in seconds before the branch expires. Min 300 (5 min), max 604800 (7 days). Default: 86400 (24h).[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabase] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_database_branch(database_id: String, branch_id: Variant = null, ttl: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if branch_id != null and not branch_id is String:
        return AppwriteException.new("Invalid type for parameter 'branch_id'. Expected String.", 0, "argument_error", "")
    if ttl != null and not ttl is int:
        return AppwriteException.new("Invalid type for parameter 'ttl'. Expected int.", 0, "argument_error", "")

    var _path := '/compute/databases/{databaseId}/branches'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}
    if branch_id != null:
        _params['branchId'] = branch_id
    if ttl != null:
        _params['ttl'] = ttl

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDedicatedDatabase

    return await _call('post', _path, _headers, _params, model_script)


## Delete an ephemeral database branch. This removes the branch namespace, its PVC, and the associated VolumeSnapshot. The deletion runs asynchronously and is irreversible.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param branch_id] [String]: Branch ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabase] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_database_branch(database_id: String, branch_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/compute/databases/{databaseId}/branches/{branchId}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{branchId}', str(branch_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDedicatedDatabase

    return await _call('delete', _path, _headers, _params, model_script)


## List all database connection users/roles for a dedicated database.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabaseConnectionList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_database_connections(database_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/compute/databases/{databaseId}/connections'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteDedicatedDatabaseConnectionList

    return await _call('get', _path, _headers, _params, model_script)


## Create a new database connection user/role. Returns the connection details including the generated credentials.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param username] [String]: Connection username.[br]
## - [param role] [String]: Connection role for the new user. Common values: readonly (read-only access), readwrite (full read and write access).[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabaseConnection] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_database_connection(database_id: String, username: String, role: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if role != null and not role is String:
        return AppwriteException.new("Invalid type for parameter 'role'. Expected String.", 0, "argument_error", "")

    var _path := '/compute/databases/{databaseId}/connections'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}
    _params['username'] = username
    if role != null:
        _params['role'] = role

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDedicatedDatabaseConnection

    return await _call('post', _path, _headers, _params, model_script)


## Delete a database connection user/role. The connection will be terminated immediately.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param connection_id] [String]: Connection ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_database_connection(database_id: String, connection_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/compute/databases/{databaseId}/connections/{connectionId}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{connectionId}', str(connection_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Get connection credentials for a dedicated database. Returns the hostname, port, username, password, database name, and full connection string.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabaseCredentials] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_database_credentials(database_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/compute/databases/{databaseId}/credentials'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteDedicatedDatabaseCredentials

    return await _call('get', _path, _headers, _params, model_script)


## Rotate the primary credentials for a dedicated database. Generates a new password and updates the database. Previous credentials will stop working immediately.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabaseCredentials] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_database_credentials(database_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/compute/databases/{databaseId}/credentials'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDedicatedDatabaseCredentials

    return await _call('post', _path, _headers, _params, model_script)


## Execute SQL through the console-facing Cloud endpoint. Cloud proxies through the edge platform to the per-database SQL API sidecar. Application traffic should bypass cloud entirely and POST directly to the per-database hostname: `https://db-{project}-{db}.{region}.appwrite.network/v1/sql/execute` with an `X-Appwrite-Key` header — that path scales to the whole DB fleet without a per-query cloud round-trip. The statement type must be on the database&#039;s configured allow-list. Use bound parameters for any user-supplied values — the API does not interpolate raw strings.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param sql] [String]: SQL statement to execute. Exactly one statement per request.[br]
## - [param bindings] [Dictionary]: Optional bound parameters. Pass either a positional list or a name =&gt; value map matching the placeholder style used in the SQL.[br]
## - [param timeout_seconds] [int]: Per-call execution timeout override. Must be less than or equal to the database&#039;s configured sqlApiTimeoutSeconds.[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabaseExecution] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_database_execution(database_id: String, sql: String, bindings: Variant = null, timeout_seconds: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if bindings != null and not bindings is Dictionary:
        return AppwriteException.new("Invalid type for parameter 'bindings'. Expected Dictionary.", 0, "argument_error", "")
    if timeout_seconds != null and not timeout_seconds is int:
        return AppwriteException.new("Invalid type for parameter 'timeout_seconds'. Expected int.", 0, "argument_error", "")

    var _path := '/compute/databases/{databaseId}/execution'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}
    _params['sql'] = sql
    if bindings != null:
        _params['bindings'] = bindings
    if timeout_seconds != null:
        _params['timeoutSeconds'] = timeout_seconds

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDedicatedDatabaseExecution

    return await _call('post', _path, _headers, _params, model_script)


## Run EXPLAIN on a query against a dedicated database. Available for SQL-compatible engines. Returns the query execution plan including scan types, estimated cost, and resource usage. Optionally run EXPLAIN ANALYZE to get actual execution statistics.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param query] [String]: Query to explain. Must be a valid query for the database engine.[br]
## - [param analyze] [bool]: Run EXPLAIN ANALYZE to get actual execution statistics. This executes the query.[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabaseQueryExplanation] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_database_query_explanation(database_id: String, query: String, analyze: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if analyze != null and not analyze is bool:
        return AppwriteException.new("Invalid type for parameter 'analyze'. Expected bool.", 0, "argument_error", "")

    var _path := '/compute/databases/{databaseId}/explanation'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}
    _params['query'] = query
    if analyze != null:
        _params['analyze'] = analyze

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDedicatedDatabaseQueryExplanation

    return await _call('post', _path, _headers, _params, model_script)


## List installed and available extensions for a PostgreSQL database.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabaseExtensions] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_database_extensions(database_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/compute/databases/{databaseId}/extensions'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteDedicatedDatabaseExtensions

    return await _call('get', _path, _headers, _params, model_script)


## Install a database extension. Only available for PostgreSQL databases. The install runs asynchronously; poll the extensions list endpoint for status.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param xname] [String]: Extension name (e.g., pgvector, postgis, uuid-ossp).[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabase] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_database_extension(database_id: String, xname: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/compute/databases/{databaseId}/extensions'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}
    _params['name'] = xname

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDedicatedDatabase

    return await _call('post', _path, _headers, _params, model_script)


## Uninstall a database extension from a PostgreSQL database. The uninstall runs asynchronously; poll the extensions list endpoint for status.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param extension_name] [String]: Extension name to uninstall.[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabase] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_database_extension(database_id: String, extension_name: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/compute/databases/{databaseId}/extensions/{extensionName}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{extensionName}', str(extension_name))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDedicatedDatabase

    return await _call('delete', _path, _headers, _params, model_script)


## Get high availability status for a dedicated database. Returns replica statuses, replication lag, and sync mode.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabaseHAStatus] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_database_ha_status(database_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/compute/databases/{databaseId}/ha'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteDedicatedDatabaseHAStatus

    return await _call('get', _path, _headers, _params, model_script)


## Trigger a manual failover for a dedicated database with high availability enabled. Promotes a replica to primary. The failover runs asynchronously; poll the database document for status updates.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param target_replica_id] [String]: Target replica ID to promote. If not specified, the healthiest replica is selected.[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabase] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_database_failover(database_id: String, target_replica_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if target_replica_id != null and not target_replica_id is String:
        return AppwriteException.new("Invalid type for parameter 'target_replica_id'. Expected String.", 0, "argument_error", "")

    var _path := '/compute/databases/{databaseId}/ha/failovers'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}
    if target_replica_id != null:
        _params['targetReplicaId'] = target_replica_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDedicatedDatabase

    return await _call('post', _path, _headers, _params, model_script)


## Get query-level performance insights for a dedicated database. Returns top queries by execution time, wait events, and aggregate query statistics.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param period] [String]: Analysis period for performance insights. Allowed values: 1h (last hour), 24h (last 24 hours), 7d (last 7 days).[br]
## - [param limit] [int]: Maximum number of queries to return.[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabasePerformanceInsights] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_database_insights(database_id: String, period: Variant = null, limit: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if period != null and not period is String:
        return AppwriteException.new("Invalid type for parameter 'period'. Expected String.", 0, "argument_error", "")
    if limit != null and not limit is int:
        return AppwriteException.new("Invalid type for parameter 'limit'. Expected int.", 0, "argument_error", "")

    var _path := '/compute/databases/{databaseId}/insights'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}
    if period != null:
        _params['period'] = period
    if limit != null:
        _params['limit'] = limit

    var _headers := {
    }

    var model_script = AppwriteDedicatedDatabasePerformanceInsights

    return await _call('get', _path, _headers, _params, model_script)


## List audit logs for a dedicated database. Returns DDL operations and security-relevant events.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param start_time] [String]: Start time in ISO 8601 format.[br]
## - [param end_time] [String]: End time in ISO 8601 format.[br]
## - [param limit] [int]: Maximum number of logs to return.[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabaseAuditLogList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_database_logs(database_id: String, start_time: Variant = null, end_time: Variant = null, limit: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if start_time != null and not start_time is String:
        return AppwriteException.new("Invalid type for parameter 'start_time'. Expected String.", 0, "argument_error", "")
    if end_time != null and not end_time is String:
        return AppwriteException.new("Invalid type for parameter 'end_time'. Expected String.", 0, "argument_error", "")
    if limit != null and not limit is int:
        return AppwriteException.new("Invalid type for parameter 'limit'. Expected int.", 0, "argument_error", "")

    var _path := '/compute/databases/{databaseId}/logs'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}
    if start_time != null:
        _params['startTime'] = start_time
    if end_time != null:
        _params['endTime'] = end_time
    if limit != null:
        _params['limit'] = limit

    var _headers := {
    }

    var model_script = AppwriteDedicatedDatabaseAuditLogList

    return await _call('get', _path, _headers, _params, model_script)


## Update the maintenance window for a dedicated database. Maintenance operations like minor version upgrades will be performed during this window.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param day] [String]: Day of the week for the maintenance window. Allowed values: sun, mon, tue, wed, thu, fri, sat.[br]
## - [param hour_utc] [int]: Hour in UTC (0-23) for maintenance window start.[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabase] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_database_maintenance_window(database_id: String, day: String, hour_utc: int) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/compute/databases/{databaseId}/maintenance'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}
    _params['day'] = day
    _params['hourUtc'] = hour_utc

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDedicatedDatabase

    return await _call('patch', _path, _headers, _params, model_script)


## Get detailed performance metrics for a dedicated database. Returns CPU, memory, storage, IOPS, QPS, and connection metrics.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param period] [String]: Metrics aggregation period. Allowed values: 1h (last hour), 24h (last 24 hours), 7d (last 7 days), 30d (last 30 days).[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabaseMetrics] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_database_metrics(database_id: String, period: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if period != null and not period is String:
        return AppwriteException.new("Invalid type for parameter 'period'. Expected String.", 0, "argument_error", "")

    var _path := '/compute/databases/{databaseId}/metrics'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}
    if period != null:
        _params['period'] = period

    var _headers := {
    }

    var model_script = AppwriteDedicatedDatabaseMetrics

    return await _call('get', _path, _headers, _params, model_script)


## Migrate a database between shared and dedicated types. Shared to dedicated creates an always-on StatefulSet with external access. Dedicated to shared converts to a serverless pod that scales to zero when idle. Data is preserved during migration.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param target_type] [String]: Target database type to migrate to. Allowed values: shared (serverless, scales to zero when idle), dedicated (always-on with persistent resources).[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabase] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_database_migration(database_id: String, target_type: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/compute/databases/{databaseId}/migrations'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}
    _params['targetType'] = target_type

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDedicatedDatabase

    return await _call('post', _path, _headers, _params, model_script)


## Get available point-in-time recovery windows for a dedicated database. Returns the earliest and latest recovery points.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabasePITRWindows] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_database_pitr_windows(database_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/compute/databases/{databaseId}/pitr'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteDedicatedDatabasePITRWindows

    return await _call('get', _path, _headers, _params, model_script)


## Get the connection pooler configuration for a dedicated database. Returns pooler mode, max connections, and pool size settings.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabasePooler] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_database_pooler(database_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/compute/databases/{databaseId}/pooler'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteDedicatedDatabasePooler

    return await _call('get', _path, _headers, _params, model_script)


## Update the connection pooler configuration for a dedicated database. Configure pool mode, max connections, and pool sizes.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param mode] [String]: Connection pool mode. Allowed values: transaction, session. Transaction mode returns connections to the pool after each transaction; session mode holds connections for the entire session lifetime.[br]
## - [param max_connections] [int]: Maximum pooled connections.[br]
## - [param default_pool_size] [int]: Default pool size per user.[br]
## - [param read_write_splitting] [bool]: Route SELECTs to HA replicas, writes and locked reads to the primary. Defaults to true when HA is enabled.[br]
## - [param pooler_cpu_request] [String]: Pooler sidecar CPU request override (Kubernetes quantity, e.g. &quot;250m&quot; or &quot;1&quot;). Leave null for the proportional default (5% of DB CPU, floor 100m).[br]
## - [param pooler_cpu_limit] [String]: Pooler sidecar CPU limit override (Kubernetes quantity, e.g. &quot;500m&quot; or &quot;1&quot;). Leave null for the proportional default (10% of DB CPU, floor 200m). Changing this field rolls the database pod.[br]
## - [param pooler_memory_request] [String]: Pooler sidecar memory request override (Kubernetes quantity, e.g. &quot;128Mi&quot; or &quot;1Gi&quot;). Leave null for the proportional default (7.5% of DB memory, floor 64Mi).[br]
## - [param pooler_memory_limit] [String]: Pooler sidecar memory limit override (Kubernetes quantity, e.g. &quot;256Mi&quot; or &quot;1Gi&quot;). Leave null for the proportional default (15% of DB memory, floor 128Mi). Changing this field rolls the database pod.[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabasePooler] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_database_pooler(database_id: String, mode: Variant = null, max_connections: Variant = null, default_pool_size: Variant = null, read_write_splitting: Variant = null, pooler_cpu_request: Variant = null, pooler_cpu_limit: Variant = null, pooler_memory_request: Variant = null, pooler_memory_limit: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if mode != null and not mode is String:
        return AppwriteException.new("Invalid type for parameter 'mode'. Expected String.", 0, "argument_error", "")
    if max_connections != null and not max_connections is int:
        return AppwriteException.new("Invalid type for parameter 'max_connections'. Expected int.", 0, "argument_error", "")
    if default_pool_size != null and not default_pool_size is int:
        return AppwriteException.new("Invalid type for parameter 'default_pool_size'. Expected int.", 0, "argument_error", "")
    if read_write_splitting != null and not read_write_splitting is bool:
        return AppwriteException.new("Invalid type for parameter 'read_write_splitting'. Expected bool.", 0, "argument_error", "")
    if pooler_cpu_request != null and not pooler_cpu_request is String:
        return AppwriteException.new("Invalid type for parameter 'pooler_cpu_request'. Expected String.", 0, "argument_error", "")
    if pooler_cpu_limit != null and not pooler_cpu_limit is String:
        return AppwriteException.new("Invalid type for parameter 'pooler_cpu_limit'. Expected String.", 0, "argument_error", "")
    if pooler_memory_request != null and not pooler_memory_request is String:
        return AppwriteException.new("Invalid type for parameter 'pooler_memory_request'. Expected String.", 0, "argument_error", "")
    if pooler_memory_limit != null and not pooler_memory_limit is String:
        return AppwriteException.new("Invalid type for parameter 'pooler_memory_limit'. Expected String.", 0, "argument_error", "")

    var _path := '/compute/databases/{databaseId}/pooler'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}
    if mode != null:
        _params['mode'] = mode
    if max_connections != null:
        _params['maxConnections'] = max_connections
    if default_pool_size != null:
        _params['defaultPoolSize'] = default_pool_size
    if read_write_splitting != null:
        _params['readWriteSplitting'] = read_write_splitting
    if pooler_cpu_request != null:
        _params['poolerCpuRequest'] = pooler_cpu_request
    if pooler_cpu_limit != null:
        _params['poolerCpuLimit'] = pooler_cpu_limit
    if pooler_memory_request != null:
        _params['poolerMemoryRequest'] = pooler_memory_request
    if pooler_memory_limit != null:
        _params['poolerMemoryLimit'] = pooler_memory_limit

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDedicatedDatabasePooler

    return await _call('patch', _path, _headers, _params, model_script)


## List all restorations for a dedicated database. Results can be filtered by status and type.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param status] [String]: Filter by restoration status.[br]
## - [param xtype] [String]: Filter by restoration type.[br]
## - [param limit] [int]: Maximum number of restorations to return.[br]
## - [param offset] [int]: Number of restorations to skip.[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabaseRestorationList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_database_restorations(database_id: String, status: Variant = null, xtype: Variant = null, limit: Variant = null, offset: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if status != null and not status is String:
        return AppwriteException.new("Invalid type for parameter 'status'. Expected String.", 0, "argument_error", "")
    if xtype != null and not xtype is String:
        return AppwriteException.new("Invalid type for parameter 'xtype'. Expected String.", 0, "argument_error", "")
    if limit != null and not limit is int:
        return AppwriteException.new("Invalid type for parameter 'limit'. Expected int.", 0, "argument_error", "")
    if offset != null and not offset is int:
        return AppwriteException.new("Invalid type for parameter 'offset'. Expected int.", 0, "argument_error", "")

    var _path := '/compute/databases/{databaseId}/restorations'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}
    if status != null:
        _params['status'] = status
    if xtype != null:
        _params['type'] = xtype
    if limit != null:
        _params['limit'] = limit
    if offset != null:
        _params['offset'] = offset

    var _headers := {
    }

    var model_script = AppwriteDedicatedDatabaseRestorationList

    return await _call('get', _path, _headers, _params, model_script)


## Restore a database from a backup or to a specific point in time (PITR). For backup restoration, provide a backupId. For PITR, provide a targetTime. PITR requires the database to have PITR enabled and is only available for enterprise databases.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param xtype] [String]: Restoration type. Allowed values: backup, pitr. Use &quot;backup&quot; to restore from a specific backup, or &quot;pitr&quot; for point-in-time recovery.[br]
## - [param backup_id] [String]: Backup ID to restore from (required for backup type).[br]
## - [param target_time] [int]: Target time for PITR as Unix timestamp (required for pitr type).[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabaseRestoration] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_database_restoration(database_id: String, xtype: Variant = null, backup_id: Variant = null, target_time: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xtype != null and not xtype is String:
        return AppwriteException.new("Invalid type for parameter 'xtype'. Expected String.", 0, "argument_error", "")
    if backup_id != null and not backup_id is String:
        return AppwriteException.new("Invalid type for parameter 'backup_id'. Expected String.", 0, "argument_error", "")
    if target_time != null and not target_time is int:
        return AppwriteException.new("Invalid type for parameter 'target_time'. Expected int.", 0, "argument_error", "")

    var _path := '/compute/databases/{databaseId}/restorations'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}
    if xtype != null:
        _params['type'] = xtype
    if backup_id != null:
        _params['backupId'] = backup_id
    if target_time != null:
        _params['targetTime'] = target_time

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDedicatedDatabaseRestoration

    return await _call('post', _path, _headers, _params, model_script)


## Get details of a specific database restoration including its status, type, and timestamps.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param restoration_id] [String]: Restoration ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabaseRestoration] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_database_restoration(database_id: String, restoration_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/compute/databases/{databaseId}/restorations/{restorationId}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{restorationId}', str(restoration_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteDedicatedDatabaseRestoration

    return await _call('get', _path, _headers, _params, model_script)


## Get the current schema for a dedicated database. Returns collections, fields, data types, constraints, and indexes.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabaseSchema] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_database_schema(database_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/compute/databases/{databaseId}/schema'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteDedicatedDatabaseSchema

    return await _call('get', _path, _headers, _params, model_script)


## Preview a schema change against a dedicated database. Returns the expected impact including affected collections, records, and a dry-run diff of the schema before and after the change.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param sql] [String]: Schema statement to preview.[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabaseSchemaPreview] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_database_schema_preview(database_id: String, sql: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/compute/databases/{databaseId}/schema/preview'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}
    _params['sql'] = sql

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDedicatedDatabaseSchemaPreview

    return await _call('post', _path, _headers, _params, model_script)


## List slow queries for a dedicated database. Returns queries that exceeded the specified threshold.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param limit] [int]: Maximum number of queries to return.[br]
## - [param threshold_ms] [int]: Minimum query duration in milliseconds.[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabaseSlowQueryList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_database_queries(database_id: String, limit: Variant = null, threshold_ms: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if limit != null and not limit is int:
        return AppwriteException.new("Invalid type for parameter 'limit'. Expected int.", 0, "argument_error", "")
    if threshold_ms != null and not threshold_ms is int:
        return AppwriteException.new("Invalid type for parameter 'threshold_ms'. Expected int.", 0, "argument_error", "")

    var _path := '/compute/databases/{databaseId}/slow-queries'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}
    if limit != null:
        _params['limit'] = limit
    if threshold_ms != null:
        _params['thresholdMs'] = threshold_ms

    var _headers := {
    }

    var model_script = AppwriteDedicatedDatabaseSlowQueryList

    return await _call('get', _path, _headers, _params, model_script)


## Get real-time health and status information for a dedicated database. Returns health status, readiness, uptime, connection info, replica status, and volume information.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDatabaseStatus] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_database_status(database_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/compute/databases/{databaseId}/status'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteDatabaseStatus

    return await _call('get', _path, _headers, _params, model_script)


## Upgrade a dedicated database to a new engine version. Uses blue-green deployment for zero-downtime cutover.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param target_version] [String]: Target engine version to upgrade to.[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabase] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_database_upgrade(database_id: String, target_version: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/compute/databases/{databaseId}/upgrades'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}
    _params['targetVersion'] = target_version

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDedicatedDatabase

    return await _call('post', _path, _headers, _params, model_script)


## Get usage metrics for a dedicated database including CPU, memory, storage, connections, and query statistics.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param xrange] [String]: Date range.[br]
##[br]
## Returns:[br]
## - [AppwriteDedicatedDatabaseUsage] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_database_usage(database_id: String, xrange: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xrange != null and not xrange is String:
        return AppwriteException.new("Invalid type for parameter 'xrange'. Expected String.", 0, "argument_error", "")

    var _path := '/compute/databases/{databaseId}/usage'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}
    if xrange != null:
        _params['range'] = xrange

    var _headers := {
    }

    var model_script = AppwriteDedicatedDatabaseUsage

    return await _call('get', _path, _headers, _params, model_script)

