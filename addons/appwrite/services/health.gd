extends "../utils/service.gd"
## The Health service allows you to both validate and monitor your Appwrite server&#039;s health.


## Check the Appwrite HTTP server is up and responsive.[br]
##[br]
## Returns:[br]
## - [AppwriteHealthStatus] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func xget() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/health'

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteHealthStatus


    return await _call('get', _path, _headers, _params, model_script)


## Check the Appwrite Antivirus server is up and connection is successful.[br]
##[br]
## Returns:[br]
## - [AppwriteHealthAntivirus] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_antivirus() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/health/anti-virus'

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteHealthAntivirus


    return await _call('get', _path, _headers, _params, model_script)


## Check the database that backs the audit and activity store. When the connection is reachable the endpoint returns a passing status with its response time.[br]
##[br]
##[br]
## Returns:[br]
## - [AppwriteHealthStatusList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_audits_db() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/health/audits-db'

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteHealthStatusList


    return await _call('get', _path, _headers, _params, model_script)


## Check the Appwrite in-memory cache servers are up and connection is successful.[br]
##[br]
## Returns:[br]
## - [AppwriteHealthStatusList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_cache() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/health/cache'

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteHealthStatusList


    return await _call('get', _path, _headers, _params, model_script)


## Get the SSL certificate for a domain[br]
##[br]
## Parameters:[br]
## - [param domain] [String]: string[br]
##[br]
## Returns:[br]
## - [AppwriteHealthCertificate] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_certificate(domain: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if domain != null and not domain is String:
        return AppwriteException.new("Invalid type for parameter 'domain'. Expected String.", 0, "argument_error", "")

    var _path := '/health/certificate'

    var _params := {}
    if domain != null:
        _params['domain'] = domain

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteHealthCertificate


    return await _call('get', _path, _headers, _params, model_script)


## Get console pausing health status. Monitors projects approaching the pause threshold to detect potential issues with console access tracking.[br]
##[br]
##[br]
## Parameters:[br]
## - [param threshold] [int]: Percentage threshold of projects approaching pause. When hit (equal or higher), endpoint returns server error. Default value is 10.[br]
## - [param inactivity_days] [int]: Number of days of inactivity before a project is paused. Should match the plan&#039;s projectInactivityDays setting. Default value is 7.[br]
##[br]
## Returns:[br]
## - [AppwriteHealthStatus] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_console_pausing(threshold: Variant = null, inactivity_days: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if threshold != null and not threshold is int:
        return AppwriteException.new("Invalid type for parameter 'threshold'. Expected int.", 0, "argument_error", "")
    if inactivity_days != null and not inactivity_days is int:
        return AppwriteException.new("Invalid type for parameter 'inactivity_days'. Expected int.", 0, "argument_error", "")

    var _path := '/health/console-pausing'

    var _params := {}
    if threshold != null:
        _params['threshold'] = threshold
    if inactivity_days != null:
        _params['inactivityDays'] = inactivity_days

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteHealthStatus


    return await _call('get', _path, _headers, _params, model_script)


## Check the Appwrite database servers are up and connection is successful.[br]
##[br]
## Returns:[br]
## - [AppwriteHealthStatusList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_db() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/health/db'

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteHealthStatusList


    return await _call('get', _path, _headers, _params, model_script)


## Check the Appwrite pub-sub servers are up and connection is successful.[br]
##[br]
## Returns:[br]
## - [AppwriteHealthStatusList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_pub_sub() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/health/pubsub'

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteHealthStatusList


    return await _call('get', _path, _headers, _params, model_script)


## Get the number of audit logs that are waiting to be processed in the Appwrite internal queue server.[br]
##[br]
##[br]
## Parameters:[br]
## - [param threshold] [int]: Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 5000.[br]
##[br]
## Returns:[br]
## - [AppwriteHealthQueue] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_queue_audits(threshold: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if threshold != null and not threshold is int:
        return AppwriteException.new("Invalid type for parameter 'threshold'. Expected int.", 0, "argument_error", "")

    var _path := '/health/queue/audits'

    var _params := {}
    if threshold != null:
        _params['threshold'] = threshold

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteHealthQueue


    return await _call('get', _path, _headers, _params, model_script)


## Get billing project aggregation queue.[br]
##[br]
## Parameters:[br]
## - [param threshold] [int]: Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 5000.[br]
##[br]
## Returns:[br]
## - [AppwriteHealthQueue] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_queue_billing_project_aggregation(threshold: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if threshold != null and not threshold is int:
        return AppwriteException.new("Invalid type for parameter 'threshold'. Expected int.", 0, "argument_error", "")

    var _path := '/health/queue/billing-project-aggregation'

    var _params := {}
    if threshold != null:
        _params['threshold'] = threshold

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteHealthQueue


    return await _call('get', _path, _headers, _params, model_script)


## Get billing team aggregation queue.[br]
##[br]
## Parameters:[br]
## - [param threshold] [int]: Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 5000.[br]
##[br]
## Returns:[br]
## - [AppwriteHealthQueue] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_queue_billing_team_aggregation(threshold: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if threshold != null and not threshold is int:
        return AppwriteException.new("Invalid type for parameter 'threshold'. Expected int.", 0, "argument_error", "")

    var _path := '/health/queue/billing-team-aggregation'

    var _params := {}
    if threshold != null:
        _params['threshold'] = threshold

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteHealthQueue


    return await _call('get', _path, _headers, _params, model_script)


## Get the number of builds that are waiting to be processed in the Appwrite internal queue server.[br]
##[br]
## Parameters:[br]
## - [param threshold] [int]: Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 5000.[br]
##[br]
## Returns:[br]
## - [AppwriteHealthQueue] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_queue_builds(threshold: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if threshold != null and not threshold is int:
        return AppwriteException.new("Invalid type for parameter 'threshold'. Expected int.", 0, "argument_error", "")

    var _path := '/health/queue/builds'

    var _params := {}
    if threshold != null:
        _params['threshold'] = threshold

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteHealthQueue


    return await _call('get', _path, _headers, _params, model_script)


## Get the number of certificates that are waiting to be issued against [Letsencrypt](https://letsencrypt.org/) in the Appwrite internal queue server.[br]
##[br]
## Parameters:[br]
## - [param threshold] [int]: Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 5000.[br]
##[br]
## Returns:[br]
## - [AppwriteHealthQueue] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_queue_certificates(threshold: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if threshold != null and not threshold is int:
        return AppwriteException.new("Invalid type for parameter 'threshold'. Expected int.", 0, "argument_error", "")

    var _path := '/health/queue/certificates'

    var _params := {}
    if threshold != null:
        _params['threshold'] = threshold

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteHealthQueue


    return await _call('get', _path, _headers, _params, model_script)


## Get the number of database changes that are waiting to be processed in the Appwrite internal queue server.[br]
##[br]
## Parameters:[br]
## - [param xname] [String]: Queue name for which to check the queue size[br]
## - [param threshold] [int]: Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 5000.[br]
##[br]
## Returns:[br]
## - [AppwriteHealthQueue] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_queue_databases(xname: Variant = null, threshold: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")
    if threshold != null and not threshold is int:
        return AppwriteException.new("Invalid type for parameter 'threshold'. Expected int.", 0, "argument_error", "")

    var _path := '/health/queue/databases'

    var _params := {}
    if xname != null:
        _params['name'] = xname
    if threshold != null:
        _params['threshold'] = threshold

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteHealthQueue


    return await _call('get', _path, _headers, _params, model_script)


## Get the number of background destructive changes that are waiting to be processed in the Appwrite internal queue server.[br]
##[br]
## Parameters:[br]
## - [param threshold] [int]: Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 5000.[br]
##[br]
## Returns:[br]
## - [AppwriteHealthQueue] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_queue_deletes(threshold: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if threshold != null and not threshold is int:
        return AppwriteException.new("Invalid type for parameter 'threshold'. Expected int.", 0, "argument_error", "")

    var _path := '/health/queue/deletes'

    var _params := {}
    if threshold != null:
        _params['threshold'] = threshold

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteHealthQueue


    return await _call('get', _path, _headers, _params, model_script)


## Returns the amount of failed jobs in a given queue.[br]
##[br]
##[br]
## Parameters:[br]
## - [param xname] [String]: The name of the queue[br]
## - [param threshold] [int]: Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 5000.[br]
##[br]
## Returns:[br]
## - [AppwriteHealthQueue] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_failed_jobs(xname: String, threshold: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if threshold != null and not threshold is int:
        return AppwriteException.new("Invalid type for parameter 'threshold'. Expected int.", 0, "argument_error", "")

    var _path := '/health/queue/failed/{name}'
    _path = _path.replace('{name}', xname.uri_encode())

    var _params := {}
    if threshold != null:
        _params['threshold'] = threshold

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteHealthQueue


    return await _call('get', _path, _headers, _params, model_script)


## Get the number of function executions that are waiting to be processed in the Appwrite internal queue server.[br]
##[br]
## Parameters:[br]
## - [param threshold] [int]: Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 5000.[br]
##[br]
## Returns:[br]
## - [AppwriteHealthQueue] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_queue_functions(threshold: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if threshold != null and not threshold is int:
        return AppwriteException.new("Invalid type for parameter 'threshold'. Expected int.", 0, "argument_error", "")

    var _path := '/health/queue/functions'

    var _params := {}
    if threshold != null:
        _params['threshold'] = threshold

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteHealthQueue


    return await _call('get', _path, _headers, _params, model_script)


## Get the number of logs that are waiting to be processed in the Appwrite internal queue server.[br]
##[br]
## Parameters:[br]
## - [param threshold] [int]: Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 5000.[br]
##[br]
## Returns:[br]
## - [AppwriteHealthQueue] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_queue_logs(threshold: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if threshold != null and not threshold is int:
        return AppwriteException.new("Invalid type for parameter 'threshold'. Expected int.", 0, "argument_error", "")

    var _path := '/health/queue/logs'

    var _params := {}
    if threshold != null:
        _params['threshold'] = threshold

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteHealthQueue


    return await _call('get', _path, _headers, _params, model_script)


## Get the number of mails that are waiting to be processed in the Appwrite internal queue server.[br]
##[br]
## Parameters:[br]
## - [param threshold] [int]: Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 5000.[br]
##[br]
## Returns:[br]
## - [AppwriteHealthQueue] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_queue_mails(threshold: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if threshold != null and not threshold is int:
        return AppwriteException.new("Invalid type for parameter 'threshold'. Expected int.", 0, "argument_error", "")

    var _path := '/health/queue/mails'

    var _params := {}
    if threshold != null:
        _params['threshold'] = threshold

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteHealthQueue


    return await _call('get', _path, _headers, _params, model_script)


## Get the number of messages that are waiting to be processed in the Appwrite internal queue server.[br]
##[br]
## Parameters:[br]
## - [param threshold] [int]: Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 5000.[br]
##[br]
## Returns:[br]
## - [AppwriteHealthQueue] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_queue_messaging(threshold: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if threshold != null and not threshold is int:
        return AppwriteException.new("Invalid type for parameter 'threshold'. Expected int.", 0, "argument_error", "")

    var _path := '/health/queue/messaging'

    var _params := {}
    if threshold != null:
        _params['threshold'] = threshold

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteHealthQueue


    return await _call('get', _path, _headers, _params, model_script)


## Get the number of migrations that are waiting to be processed in the Appwrite internal queue server.[br]
##[br]
## Parameters:[br]
## - [param threshold] [int]: Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 5000.[br]
##[br]
## Returns:[br]
## - [AppwriteHealthQueue] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_queue_migrations(threshold: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if threshold != null and not threshold is int:
        return AppwriteException.new("Invalid type for parameter 'threshold'. Expected int.", 0, "argument_error", "")

    var _path := '/health/queue/migrations'

    var _params := {}
    if threshold != null:
        _params['threshold'] = threshold

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteHealthQueue


    return await _call('get', _path, _headers, _params, model_script)


## Get region manager queue.[br]
##[br]
## Parameters:[br]
## - [param threshold] [int]: Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 100.[br]
##[br]
## Returns:[br]
## - [AppwriteHealthQueue] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_queue_region_manager(threshold: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if threshold != null and not threshold is int:
        return AppwriteException.new("Invalid type for parameter 'threshold'. Expected int.", 0, "argument_error", "")

    var _path := '/health/queue/region-manager'

    var _params := {}
    if threshold != null:
        _params['threshold'] = threshold

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteHealthQueue


    return await _call('get', _path, _headers, _params, model_script)


## Get the number of metrics that are waiting to be processed in the Appwrite stats resources queue.[br]
##[br]
## Parameters:[br]
## - [param threshold] [int]: Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 5000.[br]
##[br]
## Returns:[br]
## - [AppwriteHealthQueue] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_queue_stats_resources(threshold: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if threshold != null and not threshold is int:
        return AppwriteException.new("Invalid type for parameter 'threshold'. Expected int.", 0, "argument_error", "")

    var _path := '/health/queue/stats-resources'

    var _params := {}
    if threshold != null:
        _params['threshold'] = threshold

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteHealthQueue


    return await _call('get', _path, _headers, _params, model_script)


## Get the number of metrics that are waiting to be processed in the Appwrite internal queue server.[br]
##[br]
## Parameters:[br]
## - [param threshold] [int]: Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 5000.[br]
##[br]
## Returns:[br]
## - [AppwriteHealthQueue] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_queue_usage(threshold: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if threshold != null and not threshold is int:
        return AppwriteException.new("Invalid type for parameter 'threshold'. Expected int.", 0, "argument_error", "")

    var _path := '/health/queue/stats-usage'

    var _params := {}
    if threshold != null:
        _params['threshold'] = threshold

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteHealthQueue


    return await _call('get', _path, _headers, _params, model_script)


## Get threats queue.[br]
##[br]
## Parameters:[br]
## - [param threshold] [int]: Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 100.[br]
##[br]
## Returns:[br]
## - [AppwriteHealthQueue] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_queue_threats(threshold: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if threshold != null and not threshold is int:
        return AppwriteException.new("Invalid type for parameter 'threshold'. Expected int.", 0, "argument_error", "")

    var _path := '/health/queue/threats'

    var _params := {}
    if threshold != null:
        _params['threshold'] = threshold

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteHealthQueue


    return await _call('get', _path, _headers, _params, model_script)


## Get the number of webhooks that are waiting to be processed in the Appwrite internal queue server.[br]
##[br]
## Parameters:[br]
## - [param threshold] [int]: Queue size threshold. When hit (equal or higher), endpoint returns server error. Default value is 5000.[br]
##[br]
## Returns:[br]
## - [AppwriteHealthQueue] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_queue_webhooks(threshold: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if threshold != null and not threshold is int:
        return AppwriteException.new("Invalid type for parameter 'threshold'. Expected int.", 0, "argument_error", "")

    var _path := '/health/queue/webhooks'

    var _params := {}
    if threshold != null:
        _params['threshold'] = threshold

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteHealthQueue


    return await _call('get', _path, _headers, _params, model_script)


## Check the Appwrite storage device is up and connection is successful.[br]
##[br]
## Returns:[br]
## - [AppwriteHealthStatus] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_storage() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/health/storage'

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteHealthStatus


    return await _call('get', _path, _headers, _params, model_script)


## Check the Appwrite local storage device is up and connection is successful.[br]
##[br]
## Returns:[br]
## - [AppwriteHealthStatus] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_storage_local() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/health/storage/local'

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteHealthStatus


    return await _call('get', _path, _headers, _params, model_script)


## Check the Appwrite server time is synced with Google remote NTP server. We use this technology to smoothly handle leap seconds with no disruptive events. The [Network Time Protocol](https://en.wikipedia.org/wiki/Network_Time_Protocol) (NTP) is used by hundreds of millions of computers and devices to synchronize their clocks over the Internet. If your computer sets its own clock, it likely uses NTP.[br]
##[br]
## Returns:[br]
## - [AppwriteHealthTime] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_time() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/health/time'

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteHealthTime


    return await _call('get', _path, _headers, _params, model_script)

