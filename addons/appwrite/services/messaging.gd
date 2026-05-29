extends "../utils/service.gd"
## The Messaging service allows you to send messages to any provider type (SMTP, push notification, SMS, etc.).


## Get a list of all messages from the current Appwrite project.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: scheduledAt, deliveredAt, deliveredTotal, status, description, providerType[br]
## - [param search] [String]: Search term to filter your list results. Max length: 256 chars.[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteMessageList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_messages(queries: Variant = null, search: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if search != null and not search is String:
        return AppwriteException.new("Invalid type for parameter 'search'. Expected String.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/messaging/messages'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if search != null:
        _params['search'] = search
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteMessageList

    return await _call('get', _path, _headers, _params, model_script)


## Create a new email message.[br]
##[br]
## Parameters:[br]
## - [param message_id] [String]: Message ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param subject] [String]: Email Subject.[br]
## - [param content] [String]: Email Content.[br]
## - [param topics] [Array]: List of Topic IDs.[br]
## - [param users] [Array]: List of User IDs.[br]
## - [param targets] [Array]: List of Targets IDs.[br]
## - [param cc] [Array]: Array of target IDs to be added as CC.[br]
## - [param bcc] [Array]: Array of target IDs to be added as BCC.[br]
## - [param attachments] [Array]: Array of compound ID strings of bucket IDs and file IDs to be attached to the email. They should be formatted as &lt;BUCKET_ID&gt;:&lt;FILE_ID&gt;.[br]
## - [param draft] [bool]: Is message a draft[br]
## - [param html] [bool]: Is content of type HTML[br]
## - [param scheduled_at] [String]: Scheduled delivery time for message in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. DateTime value must be in future.[br]
##[br]
## Returns:[br]
## - [AppwriteMessage] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_email(message_id: String, subject: String, content: String, topics: Variant = null, users: Variant = null, targets: Variant = null, cc: Variant = null, bcc: Variant = null, attachments: Variant = null, draft: Variant = null, html: Variant = null, scheduled_at: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if topics != null and not topics is Array:
        return AppwriteException.new("Invalid type for parameter 'topics'. Expected Array.", 0, "argument_error", "")
    if users != null and not users is Array:
        return AppwriteException.new("Invalid type for parameter 'users'. Expected Array.", 0, "argument_error", "")
    if targets != null and not targets is Array:
        return AppwriteException.new("Invalid type for parameter 'targets'. Expected Array.", 0, "argument_error", "")
    if cc != null and not cc is Array:
        return AppwriteException.new("Invalid type for parameter 'cc'. Expected Array.", 0, "argument_error", "")
    if bcc != null and not bcc is Array:
        return AppwriteException.new("Invalid type for parameter 'bcc'. Expected Array.", 0, "argument_error", "")
    if attachments != null and not attachments is Array:
        return AppwriteException.new("Invalid type for parameter 'attachments'. Expected Array.", 0, "argument_error", "")
    if draft != null and not draft is bool:
        return AppwriteException.new("Invalid type for parameter 'draft'. Expected bool.", 0, "argument_error", "")
    if html != null and not html is bool:
        return AppwriteException.new("Invalid type for parameter 'html'. Expected bool.", 0, "argument_error", "")
    if scheduled_at != null and not scheduled_at is String:
        return AppwriteException.new("Invalid type for parameter 'scheduled_at'. Expected String.", 0, "argument_error", "")

    var _path := '/messaging/messages/email'

    var _params := {}
    _params['messageId'] = message_id
    _params['subject'] = subject
    _params['content'] = content
    if topics != null:
        _params['topics'] = topics
    if users != null:
        _params['users'] = users
    if targets != null:
        _params['targets'] = targets
    if cc != null:
        _params['cc'] = cc
    if bcc != null:
        _params['bcc'] = bcc
    if attachments != null:
        _params['attachments'] = attachments
    if draft != null:
        _params['draft'] = draft
    if html != null:
        _params['html'] = html
    if scheduled_at != null:
        _params['scheduledAt'] = scheduled_at

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteMessage

    return await _call('post', _path, _headers, _params, model_script)


## Update an email message by its unique ID. This endpoint only works on messages that are in draft status. Messages that are already processing, sent, or failed cannot be updated.[br]
##[br]
##[br]
## Parameters:[br]
## - [param message_id] [String]: Message ID.[br]
## - [param topics] [Array]: List of Topic IDs.[br]
## - [param users] [Array]: List of User IDs.[br]
## - [param targets] [Array]: List of Targets IDs.[br]
## - [param subject] [String]: Email Subject.[br]
## - [param content] [String]: Email Content.[br]
## - [param draft] [bool]: Is message a draft[br]
## - [param html] [bool]: Is content of type HTML[br]
## - [param cc] [Array]: Array of target IDs to be added as CC.[br]
## - [param bcc] [Array]: Array of target IDs to be added as BCC.[br]
## - [param scheduled_at] [String]: Scheduled delivery time for message in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. DateTime value must be in future.[br]
## - [param attachments] [Array]: Array of compound ID strings of bucket IDs and file IDs to be attached to the email. They should be formatted as &lt;BUCKET_ID&gt;:&lt;FILE_ID&gt;.[br]
##[br]
## Returns:[br]
## - [AppwriteMessage] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_email(message_id: String, topics: Variant = null, users: Variant = null, targets: Variant = null, subject: Variant = null, content: Variant = null, draft: Variant = null, html: Variant = null, cc: Variant = null, bcc: Variant = null, scheduled_at: Variant = null, attachments: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if topics != null and not topics is Array:
        return AppwriteException.new("Invalid type for parameter 'topics'. Expected Array.", 0, "argument_error", "")
    if users != null and not users is Array:
        return AppwriteException.new("Invalid type for parameter 'users'. Expected Array.", 0, "argument_error", "")
    if targets != null and not targets is Array:
        return AppwriteException.new("Invalid type for parameter 'targets'. Expected Array.", 0, "argument_error", "")
    if subject != null and not subject is String:
        return AppwriteException.new("Invalid type for parameter 'subject'. Expected String.", 0, "argument_error", "")
    if content != null and not content is String:
        return AppwriteException.new("Invalid type for parameter 'content'. Expected String.", 0, "argument_error", "")
    if draft != null and not draft is bool:
        return AppwriteException.new("Invalid type for parameter 'draft'. Expected bool.", 0, "argument_error", "")
    if html != null and not html is bool:
        return AppwriteException.new("Invalid type for parameter 'html'. Expected bool.", 0, "argument_error", "")
    if cc != null and not cc is Array:
        return AppwriteException.new("Invalid type for parameter 'cc'. Expected Array.", 0, "argument_error", "")
    if bcc != null and not bcc is Array:
        return AppwriteException.new("Invalid type for parameter 'bcc'. Expected Array.", 0, "argument_error", "")
    if scheduled_at != null and not scheduled_at is String:
        return AppwriteException.new("Invalid type for parameter 'scheduled_at'. Expected String.", 0, "argument_error", "")
    if attachments != null and not attachments is Array:
        return AppwriteException.new("Invalid type for parameter 'attachments'. Expected Array.", 0, "argument_error", "")

    var _path := '/messaging/messages/email/{messageId}'
    _path = _path.replace('{messageId}', str(message_id))

    var _params := {}
    if topics != null:
        _params['topics'] = topics
    if users != null:
        _params['users'] = users
    if targets != null:
        _params['targets'] = targets
    if subject != null:
        _params['subject'] = subject
    if content != null:
        _params['content'] = content
    if draft != null:
        _params['draft'] = draft
    if html != null:
        _params['html'] = html
    if cc != null:
        _params['cc'] = cc
    if bcc != null:
        _params['bcc'] = bcc
    if scheduled_at != null:
        _params['scheduledAt'] = scheduled_at
    if attachments != null:
        _params['attachments'] = attachments

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteMessage

    return await _call('patch', _path, _headers, _params, model_script)


## Create a new push notification.[br]
##[br]
## Parameters:[br]
## - [param message_id] [String]: Message ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param title] [String]: Title for push notification.[br]
## - [param body] [String]: Body for push notification.[br]
## - [param topics] [Array]: List of Topic IDs.[br]
## - [param users] [Array]: List of User IDs.[br]
## - [param targets] [Array]: List of Targets IDs.[br]
## - [param data] [Dictionary]: Additional key-value pair data for push notification.[br]
## - [param action] [String]: Action for push notification.[br]
## - [param image] [String]: Image for push notification. Must be a compound bucket ID to file ID of a jpeg, png, or bmp image in Appwrite Storage. It should be formatted as &lt;BUCKET_ID&gt;:&lt;FILE_ID&gt;.[br]
## - [param icon] [String]: Icon for push notification. Available only for Android and Web Platform.[br]
## - [param sound] [String]: Sound for push notification. Available only for Android and iOS Platform.[br]
## - [param color] [String]: Color for push notification. Available only for Android Platform.[br]
## - [param tag] [String]: Tag for push notification. Available only for Android Platform.[br]
## - [param badge] [int]: Badge for push notification. Available only for iOS Platform.[br]
## - [param draft] [bool]: Is message a draft[br]
## - [param scheduled_at] [String]: Scheduled delivery time for message in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. DateTime value must be in future.[br]
## - [param content_available] [bool]: If set to true, the notification will be delivered in the background. Available only for iOS Platform.[br]
## - [param critical] [bool]: If set to true, the notification will be marked as critical. This requires the app to have the critical notification entitlement. Available only for iOS Platform.[br]
## - [param priority] [String]: Set the notification priority. &quot;normal&quot; will consider device state and may not deliver notifications immediately. &quot;high&quot; will always attempt to immediately deliver the notification.[br]
##[br]
## Returns:[br]
## - [AppwriteMessage] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_push(message_id: String, title: Variant = null, body: Variant = null, topics: Variant = null, users: Variant = null, targets: Variant = null, data: Variant = null, action: Variant = null, image: Variant = null, icon: Variant = null, sound: Variant = null, color: Variant = null, tag: Variant = null, badge: Variant = null, draft: Variant = null, scheduled_at: Variant = null, content_available: Variant = null, critical: Variant = null, priority: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if title != null and not title is String:
        return AppwriteException.new("Invalid type for parameter 'title'. Expected String.", 0, "argument_error", "")
    if body != null and not body is String:
        return AppwriteException.new("Invalid type for parameter 'body'. Expected String.", 0, "argument_error", "")
    if topics != null and not topics is Array:
        return AppwriteException.new("Invalid type for parameter 'topics'. Expected Array.", 0, "argument_error", "")
    if users != null and not users is Array:
        return AppwriteException.new("Invalid type for parameter 'users'. Expected Array.", 0, "argument_error", "")
    if targets != null and not targets is Array:
        return AppwriteException.new("Invalid type for parameter 'targets'. Expected Array.", 0, "argument_error", "")
    if data != null and not data is Dictionary:
        return AppwriteException.new("Invalid type for parameter 'data'. Expected Dictionary.", 0, "argument_error", "")
    if action != null and not action is String:
        return AppwriteException.new("Invalid type for parameter 'action'. Expected String.", 0, "argument_error", "")
    if image != null and not image is String:
        return AppwriteException.new("Invalid type for parameter 'image'. Expected String.", 0, "argument_error", "")
    if icon != null and not icon is String:
        return AppwriteException.new("Invalid type for parameter 'icon'. Expected String.", 0, "argument_error", "")
    if sound != null and not sound is String:
        return AppwriteException.new("Invalid type for parameter 'sound'. Expected String.", 0, "argument_error", "")
    if color != null and not color is String:
        return AppwriteException.new("Invalid type for parameter 'color'. Expected String.", 0, "argument_error", "")
    if tag != null and not tag is String:
        return AppwriteException.new("Invalid type for parameter 'tag'. Expected String.", 0, "argument_error", "")
    if badge != null and not badge is int:
        return AppwriteException.new("Invalid type for parameter 'badge'. Expected int.", 0, "argument_error", "")
    if draft != null and not draft is bool:
        return AppwriteException.new("Invalid type for parameter 'draft'. Expected bool.", 0, "argument_error", "")
    if scheduled_at != null and not scheduled_at is String:
        return AppwriteException.new("Invalid type for parameter 'scheduled_at'. Expected String.", 0, "argument_error", "")
    if content_available != null and not content_available is bool:
        return AppwriteException.new("Invalid type for parameter 'content_available'. Expected bool.", 0, "argument_error", "")
    if critical != null and not critical is bool:
        return AppwriteException.new("Invalid type for parameter 'critical'. Expected bool.", 0, "argument_error", "")
    if priority != null and not priority is String:
        return AppwriteException.new("Invalid type for parameter 'priority'. Expected String.", 0, "argument_error", "")

    var _path := '/messaging/messages/push'

    var _params := {}
    _params['messageId'] = message_id
    if title != null:
        _params['title'] = title
    if body != null:
        _params['body'] = body
    if topics != null:
        _params['topics'] = topics
    if users != null:
        _params['users'] = users
    if targets != null:
        _params['targets'] = targets
    if data != null:
        _params['data'] = data
    if action != null:
        _params['action'] = action
    if image != null:
        _params['image'] = image
    if icon != null:
        _params['icon'] = icon
    if sound != null:
        _params['sound'] = sound
    if color != null:
        _params['color'] = color
    if tag != null:
        _params['tag'] = tag
    if badge != null:
        _params['badge'] = badge
    if draft != null:
        _params['draft'] = draft
    if scheduled_at != null:
        _params['scheduledAt'] = scheduled_at
    if content_available != null:
        _params['contentAvailable'] = content_available
    if critical != null:
        _params['critical'] = critical
    if priority != null:
        _params['priority'] = priority

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteMessage

    return await _call('post', _path, _headers, _params, model_script)


## Update a push notification by its unique ID. This endpoint only works on messages that are in draft status. Messages that are already processing, sent, or failed cannot be updated.[br]
##[br]
##[br]
## Parameters:[br]
## - [param message_id] [String]: Message ID.[br]
## - [param topics] [Array]: List of Topic IDs.[br]
## - [param users] [Array]: List of User IDs.[br]
## - [param targets] [Array]: List of Targets IDs.[br]
## - [param title] [String]: Title for push notification.[br]
## - [param body] [String]: Body for push notification.[br]
## - [param data] [Dictionary]: Additional Data for push notification.[br]
## - [param action] [String]: Action for push notification.[br]
## - [param image] [String]: Image for push notification. Must be a compound bucket ID to file ID of a jpeg, png, or bmp image in Appwrite Storage. It should be formatted as &lt;BUCKET_ID&gt;:&lt;FILE_ID&gt;.[br]
## - [param icon] [String]: Icon for push notification. Available only for Android and Web platforms.[br]
## - [param sound] [String]: Sound for push notification. Available only for Android and iOS platforms.[br]
## - [param color] [String]: Color for push notification. Available only for Android platforms.[br]
## - [param tag] [String]: Tag for push notification. Available only for Android platforms.[br]
## - [param badge] [int]: Badge for push notification. Available only for iOS platforms.[br]
## - [param draft] [bool]: Is message a draft[br]
## - [param scheduled_at] [String]: Scheduled delivery time for message in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. DateTime value must be in future.[br]
## - [param content_available] [bool]: If set to true, the notification will be delivered in the background. Available only for iOS Platform.[br]
## - [param critical] [bool]: If set to true, the notification will be marked as critical. This requires the app to have the critical notification entitlement. Available only for iOS Platform.[br]
## - [param priority] [String]: Set the notification priority. &quot;normal&quot; will consider device battery state and may send notifications later. &quot;high&quot; will always attempt to immediately deliver the notification.[br]
##[br]
## Returns:[br]
## - [AppwriteMessage] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_push(message_id: String, topics: Variant = null, users: Variant = null, targets: Variant = null, title: Variant = null, body: Variant = null, data: Variant = null, action: Variant = null, image: Variant = null, icon: Variant = null, sound: Variant = null, color: Variant = null, tag: Variant = null, badge: Variant = null, draft: Variant = null, scheduled_at: Variant = null, content_available: Variant = null, critical: Variant = null, priority: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if topics != null and not topics is Array:
        return AppwriteException.new("Invalid type for parameter 'topics'. Expected Array.", 0, "argument_error", "")
    if users != null and not users is Array:
        return AppwriteException.new("Invalid type for parameter 'users'. Expected Array.", 0, "argument_error", "")
    if targets != null and not targets is Array:
        return AppwriteException.new("Invalid type for parameter 'targets'. Expected Array.", 0, "argument_error", "")
    if title != null and not title is String:
        return AppwriteException.new("Invalid type for parameter 'title'. Expected String.", 0, "argument_error", "")
    if body != null and not body is String:
        return AppwriteException.new("Invalid type for parameter 'body'. Expected String.", 0, "argument_error", "")
    if data != null and not data is Dictionary:
        return AppwriteException.new("Invalid type for parameter 'data'. Expected Dictionary.", 0, "argument_error", "")
    if action != null and not action is String:
        return AppwriteException.new("Invalid type for parameter 'action'. Expected String.", 0, "argument_error", "")
    if image != null and not image is String:
        return AppwriteException.new("Invalid type for parameter 'image'. Expected String.", 0, "argument_error", "")
    if icon != null and not icon is String:
        return AppwriteException.new("Invalid type for parameter 'icon'. Expected String.", 0, "argument_error", "")
    if sound != null and not sound is String:
        return AppwriteException.new("Invalid type for parameter 'sound'. Expected String.", 0, "argument_error", "")
    if color != null and not color is String:
        return AppwriteException.new("Invalid type for parameter 'color'. Expected String.", 0, "argument_error", "")
    if tag != null and not tag is String:
        return AppwriteException.new("Invalid type for parameter 'tag'. Expected String.", 0, "argument_error", "")
    if badge != null and not badge is int:
        return AppwriteException.new("Invalid type for parameter 'badge'. Expected int.", 0, "argument_error", "")
    if draft != null and not draft is bool:
        return AppwriteException.new("Invalid type for parameter 'draft'. Expected bool.", 0, "argument_error", "")
    if scheduled_at != null and not scheduled_at is String:
        return AppwriteException.new("Invalid type for parameter 'scheduled_at'. Expected String.", 0, "argument_error", "")
    if content_available != null and not content_available is bool:
        return AppwriteException.new("Invalid type for parameter 'content_available'. Expected bool.", 0, "argument_error", "")
    if critical != null and not critical is bool:
        return AppwriteException.new("Invalid type for parameter 'critical'. Expected bool.", 0, "argument_error", "")
    if priority != null and not priority is String:
        return AppwriteException.new("Invalid type for parameter 'priority'. Expected String.", 0, "argument_error", "")

    var _path := '/messaging/messages/push/{messageId}'
    _path = _path.replace('{messageId}', str(message_id))

    var _params := {}
    if topics != null:
        _params['topics'] = topics
    if users != null:
        _params['users'] = users
    if targets != null:
        _params['targets'] = targets
    if title != null:
        _params['title'] = title
    if body != null:
        _params['body'] = body
    if data != null:
        _params['data'] = data
    if action != null:
        _params['action'] = action
    if image != null:
        _params['image'] = image
    if icon != null:
        _params['icon'] = icon
    if sound != null:
        _params['sound'] = sound
    if color != null:
        _params['color'] = color
    if tag != null:
        _params['tag'] = tag
    if badge != null:
        _params['badge'] = badge
    if draft != null:
        _params['draft'] = draft
    if scheduled_at != null:
        _params['scheduledAt'] = scheduled_at
    if content_available != null:
        _params['contentAvailable'] = content_available
    if critical != null:
        _params['critical'] = critical
    if priority != null:
        _params['priority'] = priority

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteMessage

    return await _call('patch', _path, _headers, _params, model_script)


## Create a new SMS message.[br]
##[br]
## Parameters:[br]
## - [param message_id] [String]: Message ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param content] [String]: SMS Content.[br]
## - [param topics] [Array]: List of Topic IDs.[br]
## - [param users] [Array]: List of User IDs.[br]
## - [param targets] [Array]: List of Targets IDs.[br]
## - [param draft] [bool]: Is message a draft[br]
## - [param scheduled_at] [String]: Scheduled delivery time for message in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. DateTime value must be in future.[br]
##[br]
## Returns:[br]
## - [AppwriteMessage] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_sms(message_id: String, content: String, topics: Variant = null, users: Variant = null, targets: Variant = null, draft: Variant = null, scheduled_at: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if topics != null and not topics is Array:
        return AppwriteException.new("Invalid type for parameter 'topics'. Expected Array.", 0, "argument_error", "")
    if users != null and not users is Array:
        return AppwriteException.new("Invalid type for parameter 'users'. Expected Array.", 0, "argument_error", "")
    if targets != null and not targets is Array:
        return AppwriteException.new("Invalid type for parameter 'targets'. Expected Array.", 0, "argument_error", "")
    if draft != null and not draft is bool:
        return AppwriteException.new("Invalid type for parameter 'draft'. Expected bool.", 0, "argument_error", "")
    if scheduled_at != null and not scheduled_at is String:
        return AppwriteException.new("Invalid type for parameter 'scheduled_at'. Expected String.", 0, "argument_error", "")

    var _path := '/messaging/messages/sms'

    var _params := {}
    _params['messageId'] = message_id
    _params['content'] = content
    if topics != null:
        _params['topics'] = topics
    if users != null:
        _params['users'] = users
    if targets != null:
        _params['targets'] = targets
    if draft != null:
        _params['draft'] = draft
    if scheduled_at != null:
        _params['scheduledAt'] = scheduled_at

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteMessage

    return await _call('post', _path, _headers, _params, model_script)


## Update an SMS message by its unique ID. This endpoint only works on messages that are in draft status. Messages that are already processing, sent, or failed cannot be updated.[br]
##[br]
##[br]
## Parameters:[br]
## - [param message_id] [String]: Message ID.[br]
## - [param topics] [Array]: List of Topic IDs.[br]
## - [param users] [Array]: List of User IDs.[br]
## - [param targets] [Array]: List of Targets IDs.[br]
## - [param content] [String]: Email Content.[br]
## - [param draft] [bool]: Is message a draft[br]
## - [param scheduled_at] [String]: Scheduled delivery time for message in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. DateTime value must be in future.[br]
##[br]
## Returns:[br]
## - [AppwriteMessage] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_sms(message_id: String, topics: Variant = null, users: Variant = null, targets: Variant = null, content: Variant = null, draft: Variant = null, scheduled_at: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if topics != null and not topics is Array:
        return AppwriteException.new("Invalid type for parameter 'topics'. Expected Array.", 0, "argument_error", "")
    if users != null and not users is Array:
        return AppwriteException.new("Invalid type for parameter 'users'. Expected Array.", 0, "argument_error", "")
    if targets != null and not targets is Array:
        return AppwriteException.new("Invalid type for parameter 'targets'. Expected Array.", 0, "argument_error", "")
    if content != null and not content is String:
        return AppwriteException.new("Invalid type for parameter 'content'. Expected String.", 0, "argument_error", "")
    if draft != null and not draft is bool:
        return AppwriteException.new("Invalid type for parameter 'draft'. Expected bool.", 0, "argument_error", "")
    if scheduled_at != null and not scheduled_at is String:
        return AppwriteException.new("Invalid type for parameter 'scheduled_at'. Expected String.", 0, "argument_error", "")

    var _path := '/messaging/messages/sms/{messageId}'
    _path = _path.replace('{messageId}', str(message_id))

    var _params := {}
    if topics != null:
        _params['topics'] = topics
    if users != null:
        _params['users'] = users
    if targets != null:
        _params['targets'] = targets
    if content != null:
        _params['content'] = content
    if draft != null:
        _params['draft'] = draft
    if scheduled_at != null:
        _params['scheduledAt'] = scheduled_at

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteMessage

    return await _call('patch', _path, _headers, _params, model_script)


## Get a message by its unique ID.[br]
##[br]
##[br]
## Parameters:[br]
## - [param message_id] [String]: Message ID.[br]
##[br]
## Returns:[br]
## - [AppwriteMessage] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_message(message_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/messaging/messages/{messageId}'
    _path = _path.replace('{messageId}', str(message_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteMessage

    return await _call('get', _path, _headers, _params, model_script)


## Delete a message. If the message is not a draft or scheduled, but has been sent, this will not recall the message.[br]
##[br]
## Parameters:[br]
## - [param message_id] [String]: Message ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete(message_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/messaging/messages/{messageId}'
    _path = _path.replace('{messageId}', str(message_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Get the message activity logs listed by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param message_id] [String]: Message ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Only supported methods are limit and offset[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteLogList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_message_logs(message_id: String, queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/messaging/messages/{messageId}/logs'
    _path = _path.replace('{messageId}', str(message_id))

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteLogList

    return await _call('get', _path, _headers, _params, model_script)


## Get a list of the targets associated with a message.[br]
##[br]
## Parameters:[br]
## - [param message_id] [String]: Message ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: userId, providerId, identifier, providerType[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteTargetList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_targets(message_id: String, queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/messaging/messages/{messageId}/targets'
    _path = _path.replace('{messageId}', str(message_id))

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteTargetList

    return await _call('get', _path, _headers, _params, model_script)


## Get a list of all providers from the current Appwrite project.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, provider, type, enabled[br]
## - [param search] [String]: Search term to filter your list results. Max length: 256 chars.[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteProviderList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_providers(queries: Variant = null, search: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if search != null and not search is String:
        return AppwriteException.new("Invalid type for parameter 'search'. Expected String.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/messaging/providers'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if search != null:
        _params['search'] = search
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteProviderList

    return await _call('get', _path, _headers, _params, model_script)


## Create a new Apple Push Notification service provider.[br]
##[br]
## Parameters:[br]
## - [param provider_id] [String]: Provider ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Provider name.[br]
## - [param auth_key] [String]: APNS authentication key.[br]
## - [param auth_key_id] [String]: APNS authentication key ID.[br]
## - [param team_id] [String]: APNS team ID.[br]
## - [param bundle_id] [String]: APNS bundle ID.[br]
## - [param sandbox] [bool]: Use APNS sandbox environment.[br]
## - [param enabled] [bool]: Set as enabled.[br]
##[br]
## Returns:[br]
## - [AppwriteProvider] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_apns_provider(provider_id: String, xname: String, auth_key: Variant = null, auth_key_id: Variant = null, team_id: Variant = null, bundle_id: Variant = null, sandbox: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if auth_key != null and not auth_key is String:
        return AppwriteException.new("Invalid type for parameter 'auth_key'. Expected String.", 0, "argument_error", "")
    if auth_key_id != null and not auth_key_id is String:
        return AppwriteException.new("Invalid type for parameter 'auth_key_id'. Expected String.", 0, "argument_error", "")
    if team_id != null and not team_id is String:
        return AppwriteException.new("Invalid type for parameter 'team_id'. Expected String.", 0, "argument_error", "")
    if bundle_id != null and not bundle_id is String:
        return AppwriteException.new("Invalid type for parameter 'bundle_id'. Expected String.", 0, "argument_error", "")
    if sandbox != null and not sandbox is bool:
        return AppwriteException.new("Invalid type for parameter 'sandbox'. Expected bool.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/messaging/providers/apns'

    var _params := {}
    _params['providerId'] = provider_id
    _params['name'] = xname
    if auth_key != null:
        _params['authKey'] = auth_key
    if auth_key_id != null:
        _params['authKeyId'] = auth_key_id
    if team_id != null:
        _params['teamId'] = team_id
    if bundle_id != null:
        _params['bundleId'] = bundle_id
    if sandbox != null:
        _params['sandbox'] = sandbox
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteProvider

    return await _call('post', _path, _headers, _params, model_script)


## Update a Apple Push Notification service provider by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param provider_id] [String]: Provider ID.[br]
## - [param xname] [String]: Provider name.[br]
## - [param enabled] [bool]: Set as enabled.[br]
## - [param auth_key] [String]: APNS authentication key.[br]
## - [param auth_key_id] [String]: APNS authentication key ID.[br]
## - [param team_id] [String]: APNS team ID.[br]
## - [param bundle_id] [String]: APNS bundle ID.[br]
## - [param sandbox] [bool]: Use APNS sandbox environment.[br]
##[br]
## Returns:[br]
## - [AppwriteProvider] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_apns_provider(provider_id: String, xname: Variant = null, enabled: Variant = null, auth_key: Variant = null, auth_key_id: Variant = null, team_id: Variant = null, bundle_id: Variant = null, sandbox: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")
    if auth_key != null and not auth_key is String:
        return AppwriteException.new("Invalid type for parameter 'auth_key'. Expected String.", 0, "argument_error", "")
    if auth_key_id != null and not auth_key_id is String:
        return AppwriteException.new("Invalid type for parameter 'auth_key_id'. Expected String.", 0, "argument_error", "")
    if team_id != null and not team_id is String:
        return AppwriteException.new("Invalid type for parameter 'team_id'. Expected String.", 0, "argument_error", "")
    if bundle_id != null and not bundle_id is String:
        return AppwriteException.new("Invalid type for parameter 'bundle_id'. Expected String.", 0, "argument_error", "")
    if sandbox != null and not sandbox is bool:
        return AppwriteException.new("Invalid type for parameter 'sandbox'. Expected bool.", 0, "argument_error", "")

    var _path := '/messaging/providers/apns/{providerId}'
    _path = _path.replace('{providerId}', str(provider_id))

    var _params := {}
    if xname != null:
        _params['name'] = xname
    if enabled != null:
        _params['enabled'] = enabled
    if auth_key != null:
        _params['authKey'] = auth_key
    if auth_key_id != null:
        _params['authKeyId'] = auth_key_id
    if team_id != null:
        _params['teamId'] = team_id
    if bundle_id != null:
        _params['bundleId'] = bundle_id
    if sandbox != null:
        _params['sandbox'] = sandbox

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteProvider

    return await _call('patch', _path, _headers, _params, model_script)


## Create a new Firebase Cloud Messaging provider.[br]
##[br]
## Parameters:[br]
## - [param provider_id] [String]: Provider ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Provider name.[br]
## - [param service_account_json] [Dictionary]: FCM service account JSON.[br]
## - [param enabled] [bool]: Set as enabled.[br]
##[br]
## Returns:[br]
## - [AppwriteProvider] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_fcm_provider(provider_id: String, xname: String, service_account_json: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if service_account_json != null and not service_account_json is Dictionary:
        return AppwriteException.new("Invalid type for parameter 'service_account_json'. Expected Dictionary.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/messaging/providers/fcm'

    var _params := {}
    _params['providerId'] = provider_id
    _params['name'] = xname
    if service_account_json != null:
        _params['serviceAccountJSON'] = service_account_json
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteProvider

    return await _call('post', _path, _headers, _params, model_script)


## Update a Firebase Cloud Messaging provider by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param provider_id] [String]: Provider ID.[br]
## - [param xname] [String]: Provider name.[br]
## - [param enabled] [bool]: Set as enabled.[br]
## - [param service_account_json] [Dictionary]: FCM service account JSON.[br]
##[br]
## Returns:[br]
## - [AppwriteProvider] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_fcm_provider(provider_id: String, xname: Variant = null, enabled: Variant = null, service_account_json: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")
    if service_account_json != null and not service_account_json is Dictionary:
        return AppwriteException.new("Invalid type for parameter 'service_account_json'. Expected Dictionary.", 0, "argument_error", "")

    var _path := '/messaging/providers/fcm/{providerId}'
    _path = _path.replace('{providerId}', str(provider_id))

    var _params := {}
    if xname != null:
        _params['name'] = xname
    if enabled != null:
        _params['enabled'] = enabled
    if service_account_json != null:
        _params['serviceAccountJSON'] = service_account_json

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteProvider

    return await _call('patch', _path, _headers, _params, model_script)


## Create a new Mailgun provider.[br]
##[br]
## Parameters:[br]
## - [param provider_id] [String]: Provider ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Provider name.[br]
## - [param api_key] [String]: Mailgun API Key.[br]
## - [param domain] [String]: Mailgun Domain.[br]
## - [param is_eu_region] [bool]: Set as EU region.[br]
## - [param from_name] [String]: Sender Name.[br]
## - [param from_email] [String]: Sender email address.[br]
## - [param reply_to_name] [String]: Name set in the reply to field for the mail. Default value is sender name. Reply to name must have reply to email as well.[br]
## - [param reply_to_email] [String]: Email set in the reply to field for the mail. Default value is sender email. Reply to email must have reply to name as well.[br]
## - [param enabled] [bool]: Set as enabled.[br]
##[br]
## Returns:[br]
## - [AppwriteProvider] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_mailgun_provider(provider_id: String, xname: String, api_key: Variant = null, domain: Variant = null, is_eu_region: Variant = null, from_name: Variant = null, from_email: Variant = null, reply_to_name: Variant = null, reply_to_email: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if api_key != null and not api_key is String:
        return AppwriteException.new("Invalid type for parameter 'api_key'. Expected String.", 0, "argument_error", "")
    if domain != null and not domain is String:
        return AppwriteException.new("Invalid type for parameter 'domain'. Expected String.", 0, "argument_error", "")
    if is_eu_region != null and not is_eu_region is bool:
        return AppwriteException.new("Invalid type for parameter 'is_eu_region'. Expected bool.", 0, "argument_error", "")
    if from_name != null and not from_name is String:
        return AppwriteException.new("Invalid type for parameter 'from_name'. Expected String.", 0, "argument_error", "")
    if from_email != null and not from_email is String:
        return AppwriteException.new("Invalid type for parameter 'from_email'. Expected String.", 0, "argument_error", "")
    if reply_to_name != null and not reply_to_name is String:
        return AppwriteException.new("Invalid type for parameter 'reply_to_name'. Expected String.", 0, "argument_error", "")
    if reply_to_email != null and not reply_to_email is String:
        return AppwriteException.new("Invalid type for parameter 'reply_to_email'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/messaging/providers/mailgun'

    var _params := {}
    _params['providerId'] = provider_id
    _params['name'] = xname
    if api_key != null:
        _params['apiKey'] = api_key
    if domain != null:
        _params['domain'] = domain
    if is_eu_region != null:
        _params['isEuRegion'] = is_eu_region
    if from_name != null:
        _params['fromName'] = from_name
    if from_email != null:
        _params['fromEmail'] = from_email
    if reply_to_name != null:
        _params['replyToName'] = reply_to_name
    if reply_to_email != null:
        _params['replyToEmail'] = reply_to_email
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteProvider

    return await _call('post', _path, _headers, _params, model_script)


## Update a Mailgun provider by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param provider_id] [String]: Provider ID.[br]
## - [param xname] [String]: Provider name.[br]
## - [param api_key] [String]: Mailgun API Key.[br]
## - [param domain] [String]: Mailgun Domain.[br]
## - [param is_eu_region] [bool]: Set as EU region.[br]
## - [param enabled] [bool]: Set as enabled.[br]
## - [param from_name] [String]: Sender Name.[br]
## - [param from_email] [String]: Sender email address.[br]
## - [param reply_to_name] [String]: Name set in the reply to field for the mail. Default value is sender name.[br]
## - [param reply_to_email] [String]: Email set in the reply to field for the mail. Default value is sender email.[br]
##[br]
## Returns:[br]
## - [AppwriteProvider] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_mailgun_provider(provider_id: String, xname: Variant = null, api_key: Variant = null, domain: Variant = null, is_eu_region: Variant = null, enabled: Variant = null, from_name: Variant = null, from_email: Variant = null, reply_to_name: Variant = null, reply_to_email: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")
    if api_key != null and not api_key is String:
        return AppwriteException.new("Invalid type for parameter 'api_key'. Expected String.", 0, "argument_error", "")
    if domain != null and not domain is String:
        return AppwriteException.new("Invalid type for parameter 'domain'. Expected String.", 0, "argument_error", "")
    if is_eu_region != null and not is_eu_region is bool:
        return AppwriteException.new("Invalid type for parameter 'is_eu_region'. Expected bool.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")
    if from_name != null and not from_name is String:
        return AppwriteException.new("Invalid type for parameter 'from_name'. Expected String.", 0, "argument_error", "")
    if from_email != null and not from_email is String:
        return AppwriteException.new("Invalid type for parameter 'from_email'. Expected String.", 0, "argument_error", "")
    if reply_to_name != null and not reply_to_name is String:
        return AppwriteException.new("Invalid type for parameter 'reply_to_name'. Expected String.", 0, "argument_error", "")
    if reply_to_email != null and not reply_to_email is String:
        return AppwriteException.new("Invalid type for parameter 'reply_to_email'. Expected String.", 0, "argument_error", "")

    var _path := '/messaging/providers/mailgun/{providerId}'
    _path = _path.replace('{providerId}', str(provider_id))

    var _params := {}
    if xname != null:
        _params['name'] = xname
    if api_key != null:
        _params['apiKey'] = api_key
    if domain != null:
        _params['domain'] = domain
    if is_eu_region != null:
        _params['isEuRegion'] = is_eu_region
    if enabled != null:
        _params['enabled'] = enabled
    if from_name != null:
        _params['fromName'] = from_name
    if from_email != null:
        _params['fromEmail'] = from_email
    if reply_to_name != null:
        _params['replyToName'] = reply_to_name
    if reply_to_email != null:
        _params['replyToEmail'] = reply_to_email

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteProvider

    return await _call('patch', _path, _headers, _params, model_script)


## Create a new MSG91 provider.[br]
##[br]
## Parameters:[br]
## - [param provider_id] [String]: Provider ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Provider name.[br]
## - [param template_id] [String]: Msg91 template ID[br]
## - [param sender_id] [String]: Msg91 sender ID.[br]
## - [param auth_key] [String]: Msg91 auth key.[br]
## - [param enabled] [bool]: Set as enabled.[br]
##[br]
## Returns:[br]
## - [AppwriteProvider] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_msg91_provider(provider_id: String, xname: String, template_id: Variant = null, sender_id: Variant = null, auth_key: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if template_id != null and not template_id is String:
        return AppwriteException.new("Invalid type for parameter 'template_id'. Expected String.", 0, "argument_error", "")
    if sender_id != null and not sender_id is String:
        return AppwriteException.new("Invalid type for parameter 'sender_id'. Expected String.", 0, "argument_error", "")
    if auth_key != null and not auth_key is String:
        return AppwriteException.new("Invalid type for parameter 'auth_key'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/messaging/providers/msg91'

    var _params := {}
    _params['providerId'] = provider_id
    _params['name'] = xname
    if template_id != null:
        _params['templateId'] = template_id
    if sender_id != null:
        _params['senderId'] = sender_id
    if auth_key != null:
        _params['authKey'] = auth_key
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteProvider

    return await _call('post', _path, _headers, _params, model_script)


## Update a MSG91 provider by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param provider_id] [String]: Provider ID.[br]
## - [param xname] [String]: Provider name.[br]
## - [param enabled] [bool]: Set as enabled.[br]
## - [param template_id] [String]: Msg91 template ID.[br]
## - [param sender_id] [String]: Msg91 sender ID.[br]
## - [param auth_key] [String]: Msg91 auth key.[br]
##[br]
## Returns:[br]
## - [AppwriteProvider] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_msg91_provider(provider_id: String, xname: Variant = null, enabled: Variant = null, template_id: Variant = null, sender_id: Variant = null, auth_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")
    if template_id != null and not template_id is String:
        return AppwriteException.new("Invalid type for parameter 'template_id'. Expected String.", 0, "argument_error", "")
    if sender_id != null and not sender_id is String:
        return AppwriteException.new("Invalid type for parameter 'sender_id'. Expected String.", 0, "argument_error", "")
    if auth_key != null and not auth_key is String:
        return AppwriteException.new("Invalid type for parameter 'auth_key'. Expected String.", 0, "argument_error", "")

    var _path := '/messaging/providers/msg91/{providerId}'
    _path = _path.replace('{providerId}', str(provider_id))

    var _params := {}
    if xname != null:
        _params['name'] = xname
    if enabled != null:
        _params['enabled'] = enabled
    if template_id != null:
        _params['templateId'] = template_id
    if sender_id != null:
        _params['senderId'] = sender_id
    if auth_key != null:
        _params['authKey'] = auth_key

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteProvider

    return await _call('patch', _path, _headers, _params, model_script)


## Create a new Resend provider.[br]
##[br]
## Parameters:[br]
## - [param provider_id] [String]: Provider ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Provider name.[br]
## - [param api_key] [String]: Resend API key.[br]
## - [param from_name] [String]: Sender Name.[br]
## - [param from_email] [String]: Sender email address.[br]
## - [param reply_to_name] [String]: Name set in the reply to field for the mail. Default value is sender name.[br]
## - [param reply_to_email] [String]: Email set in the reply to field for the mail. Default value is sender email.[br]
## - [param enabled] [bool]: Set as enabled.[br]
##[br]
## Returns:[br]
## - [AppwriteProvider] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_resend_provider(provider_id: String, xname: String, api_key: Variant = null, from_name: Variant = null, from_email: Variant = null, reply_to_name: Variant = null, reply_to_email: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if api_key != null and not api_key is String:
        return AppwriteException.new("Invalid type for parameter 'api_key'. Expected String.", 0, "argument_error", "")
    if from_name != null and not from_name is String:
        return AppwriteException.new("Invalid type for parameter 'from_name'. Expected String.", 0, "argument_error", "")
    if from_email != null and not from_email is String:
        return AppwriteException.new("Invalid type for parameter 'from_email'. Expected String.", 0, "argument_error", "")
    if reply_to_name != null and not reply_to_name is String:
        return AppwriteException.new("Invalid type for parameter 'reply_to_name'. Expected String.", 0, "argument_error", "")
    if reply_to_email != null and not reply_to_email is String:
        return AppwriteException.new("Invalid type for parameter 'reply_to_email'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/messaging/providers/resend'

    var _params := {}
    _params['providerId'] = provider_id
    _params['name'] = xname
    if api_key != null:
        _params['apiKey'] = api_key
    if from_name != null:
        _params['fromName'] = from_name
    if from_email != null:
        _params['fromEmail'] = from_email
    if reply_to_name != null:
        _params['replyToName'] = reply_to_name
    if reply_to_email != null:
        _params['replyToEmail'] = reply_to_email
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteProvider

    return await _call('post', _path, _headers, _params, model_script)


## Update a Resend provider by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param provider_id] [String]: Provider ID.[br]
## - [param xname] [String]: Provider name.[br]
## - [param enabled] [bool]: Set as enabled.[br]
## - [param api_key] [String]: Resend API key.[br]
## - [param from_name] [String]: Sender Name.[br]
## - [param from_email] [String]: Sender email address.[br]
## - [param reply_to_name] [String]: Name set in the Reply To field for the mail. Default value is Sender Name.[br]
## - [param reply_to_email] [String]: Email set in the Reply To field for the mail. Default value is Sender Email.[br]
##[br]
## Returns:[br]
## - [AppwriteProvider] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_resend_provider(provider_id: String, xname: Variant = null, enabled: Variant = null, api_key: Variant = null, from_name: Variant = null, from_email: Variant = null, reply_to_name: Variant = null, reply_to_email: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")
    if api_key != null and not api_key is String:
        return AppwriteException.new("Invalid type for parameter 'api_key'. Expected String.", 0, "argument_error", "")
    if from_name != null and not from_name is String:
        return AppwriteException.new("Invalid type for parameter 'from_name'. Expected String.", 0, "argument_error", "")
    if from_email != null and not from_email is String:
        return AppwriteException.new("Invalid type for parameter 'from_email'. Expected String.", 0, "argument_error", "")
    if reply_to_name != null and not reply_to_name is String:
        return AppwriteException.new("Invalid type for parameter 'reply_to_name'. Expected String.", 0, "argument_error", "")
    if reply_to_email != null and not reply_to_email is String:
        return AppwriteException.new("Invalid type for parameter 'reply_to_email'. Expected String.", 0, "argument_error", "")

    var _path := '/messaging/providers/resend/{providerId}'
    _path = _path.replace('{providerId}', str(provider_id))

    var _params := {}
    if xname != null:
        _params['name'] = xname
    if enabled != null:
        _params['enabled'] = enabled
    if api_key != null:
        _params['apiKey'] = api_key
    if from_name != null:
        _params['fromName'] = from_name
    if from_email != null:
        _params['fromEmail'] = from_email
    if reply_to_name != null:
        _params['replyToName'] = reply_to_name
    if reply_to_email != null:
        _params['replyToEmail'] = reply_to_email

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteProvider

    return await _call('patch', _path, _headers, _params, model_script)


## Create a new Sendgrid provider.[br]
##[br]
## Parameters:[br]
## - [param provider_id] [String]: Provider ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Provider name.[br]
## - [param api_key] [String]: Sendgrid API key.[br]
## - [param from_name] [String]: Sender Name.[br]
## - [param from_email] [String]: Sender email address.[br]
## - [param reply_to_name] [String]: Name set in the reply to field for the mail. Default value is sender name.[br]
## - [param reply_to_email] [String]: Email set in the reply to field for the mail. Default value is sender email.[br]
## - [param enabled] [bool]: Set as enabled.[br]
##[br]
## Returns:[br]
## - [AppwriteProvider] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_sendgrid_provider(provider_id: String, xname: String, api_key: Variant = null, from_name: Variant = null, from_email: Variant = null, reply_to_name: Variant = null, reply_to_email: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if api_key != null and not api_key is String:
        return AppwriteException.new("Invalid type for parameter 'api_key'. Expected String.", 0, "argument_error", "")
    if from_name != null and not from_name is String:
        return AppwriteException.new("Invalid type for parameter 'from_name'. Expected String.", 0, "argument_error", "")
    if from_email != null and not from_email is String:
        return AppwriteException.new("Invalid type for parameter 'from_email'. Expected String.", 0, "argument_error", "")
    if reply_to_name != null and not reply_to_name is String:
        return AppwriteException.new("Invalid type for parameter 'reply_to_name'. Expected String.", 0, "argument_error", "")
    if reply_to_email != null and not reply_to_email is String:
        return AppwriteException.new("Invalid type for parameter 'reply_to_email'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/messaging/providers/sendgrid'

    var _params := {}
    _params['providerId'] = provider_id
    _params['name'] = xname
    if api_key != null:
        _params['apiKey'] = api_key
    if from_name != null:
        _params['fromName'] = from_name
    if from_email != null:
        _params['fromEmail'] = from_email
    if reply_to_name != null:
        _params['replyToName'] = reply_to_name
    if reply_to_email != null:
        _params['replyToEmail'] = reply_to_email
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteProvider

    return await _call('post', _path, _headers, _params, model_script)


## Update a Sendgrid provider by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param provider_id] [String]: Provider ID.[br]
## - [param xname] [String]: Provider name.[br]
## - [param enabled] [bool]: Set as enabled.[br]
## - [param api_key] [String]: Sendgrid API key.[br]
## - [param from_name] [String]: Sender Name.[br]
## - [param from_email] [String]: Sender email address.[br]
## - [param reply_to_name] [String]: Name set in the Reply To field for the mail. Default value is Sender Name.[br]
## - [param reply_to_email] [String]: Email set in the Reply To field for the mail. Default value is Sender Email.[br]
##[br]
## Returns:[br]
## - [AppwriteProvider] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_sendgrid_provider(provider_id: String, xname: Variant = null, enabled: Variant = null, api_key: Variant = null, from_name: Variant = null, from_email: Variant = null, reply_to_name: Variant = null, reply_to_email: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")
    if api_key != null and not api_key is String:
        return AppwriteException.new("Invalid type for parameter 'api_key'. Expected String.", 0, "argument_error", "")
    if from_name != null and not from_name is String:
        return AppwriteException.new("Invalid type for parameter 'from_name'. Expected String.", 0, "argument_error", "")
    if from_email != null and not from_email is String:
        return AppwriteException.new("Invalid type for parameter 'from_email'. Expected String.", 0, "argument_error", "")
    if reply_to_name != null and not reply_to_name is String:
        return AppwriteException.new("Invalid type for parameter 'reply_to_name'. Expected String.", 0, "argument_error", "")
    if reply_to_email != null and not reply_to_email is String:
        return AppwriteException.new("Invalid type for parameter 'reply_to_email'. Expected String.", 0, "argument_error", "")

    var _path := '/messaging/providers/sendgrid/{providerId}'
    _path = _path.replace('{providerId}', str(provider_id))

    var _params := {}
    if xname != null:
        _params['name'] = xname
    if enabled != null:
        _params['enabled'] = enabled
    if api_key != null:
        _params['apiKey'] = api_key
    if from_name != null:
        _params['fromName'] = from_name
    if from_email != null:
        _params['fromEmail'] = from_email
    if reply_to_name != null:
        _params['replyToName'] = reply_to_name
    if reply_to_email != null:
        _params['replyToEmail'] = reply_to_email

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteProvider

    return await _call('patch', _path, _headers, _params, model_script)


## Create a new SMTP provider.[br]
##[br]
## Parameters:[br]
## - [param provider_id] [String]: Provider ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Provider name.[br]
## - [param host] [String]: SMTP hosts. Either a single hostname or multiple semicolon-delimited hostnames. You can also specify a different port for each host such as `smtp1.example.com:25;smtp2.example.com`. You can also specify encryption type, for example: `tls://smtp1.example.com:587;ssl://smtp2.example.com:465&quot;`. Hosts will be tried in order.[br]
## - [param port] [int]: The default SMTP server port.[br]
## - [param username] [String]: Authentication username.[br]
## - [param password] [String]: Authentication password.[br]
## - [param encryption] [String]: Encryption type. Can be omitted, &#039;ssl&#039;, or &#039;tls&#039;[br]
## - [param auto_tls] [bool]: Enable SMTP AutoTLS feature.[br]
## - [param mailer] [String]: The value to use for the X-Mailer header.[br]
## - [param from_name] [String]: Sender Name.[br]
## - [param from_email] [String]: Sender email address.[br]
## - [param reply_to_name] [String]: Name set in the reply to field for the mail. Default value is sender name.[br]
## - [param reply_to_email] [String]: Email set in the reply to field for the mail. Default value is sender email.[br]
## - [param enabled] [bool]: Set as enabled.[br]
##[br]
## Returns:[br]
## - [AppwriteProvider] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_smtp_provider(provider_id: String, xname: String, host: String, port: Variant = null, username: Variant = null, password: Variant = null, encryption: Variant = null, auto_tls: Variant = null, mailer: Variant = null, from_name: Variant = null, from_email: Variant = null, reply_to_name: Variant = null, reply_to_email: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if port != null and not port is int:
        return AppwriteException.new("Invalid type for parameter 'port'. Expected int.", 0, "argument_error", "")
    if username != null and not username is String:
        return AppwriteException.new("Invalid type for parameter 'username'. Expected String.", 0, "argument_error", "")
    if password != null and not password is String:
        return AppwriteException.new("Invalid type for parameter 'password'. Expected String.", 0, "argument_error", "")
    if encryption != null and not encryption is String:
        return AppwriteException.new("Invalid type for parameter 'encryption'. Expected String.", 0, "argument_error", "")
    if auto_tls != null and not auto_tls is bool:
        return AppwriteException.new("Invalid type for parameter 'auto_tls'. Expected bool.", 0, "argument_error", "")
    if mailer != null and not mailer is String:
        return AppwriteException.new("Invalid type for parameter 'mailer'. Expected String.", 0, "argument_error", "")
    if from_name != null and not from_name is String:
        return AppwriteException.new("Invalid type for parameter 'from_name'. Expected String.", 0, "argument_error", "")
    if from_email != null and not from_email is String:
        return AppwriteException.new("Invalid type for parameter 'from_email'. Expected String.", 0, "argument_error", "")
    if reply_to_name != null and not reply_to_name is String:
        return AppwriteException.new("Invalid type for parameter 'reply_to_name'. Expected String.", 0, "argument_error", "")
    if reply_to_email != null and not reply_to_email is String:
        return AppwriteException.new("Invalid type for parameter 'reply_to_email'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/messaging/providers/smtp'

    var _params := {}
    _params['providerId'] = provider_id
    _params['name'] = xname
    _params['host'] = host
    if port != null:
        _params['port'] = port
    if username != null:
        _params['username'] = username
    if password != null:
        _params['password'] = password
    if encryption != null:
        _params['encryption'] = encryption
    if auto_tls != null:
        _params['autoTLS'] = auto_tls
    if mailer != null:
        _params['mailer'] = mailer
    if from_name != null:
        _params['fromName'] = from_name
    if from_email != null:
        _params['fromEmail'] = from_email
    if reply_to_name != null:
        _params['replyToName'] = reply_to_name
    if reply_to_email != null:
        _params['replyToEmail'] = reply_to_email
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteProvider

    return await _call('post', _path, _headers, _params, model_script)


## Update a SMTP provider by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param provider_id] [String]: Provider ID.[br]
## - [param xname] [String]: Provider name.[br]
## - [param host] [String]: SMTP hosts. Either a single hostname or multiple semicolon-delimited hostnames. You can also specify a different port for each host such as `smtp1.example.com:25;smtp2.example.com`. You can also specify encryption type, for example: `tls://smtp1.example.com:587;ssl://smtp2.example.com:465&quot;`. Hosts will be tried in order.[br]
## - [param port] [int]: SMTP port.[br]
## - [param username] [String]: Authentication username.[br]
## - [param password] [String]: Authentication password.[br]
## - [param encryption] [String]: Encryption type. Can be &#039;ssl&#039; or &#039;tls&#039;[br]
## - [param auto_tls] [bool]: Enable SMTP AutoTLS feature.[br]
## - [param mailer] [String]: The value to use for the X-Mailer header.[br]
## - [param from_name] [String]: Sender Name.[br]
## - [param from_email] [String]: Sender email address.[br]
## - [param reply_to_name] [String]: Name set in the Reply To field for the mail. Default value is Sender Name.[br]
## - [param reply_to_email] [String]: Email set in the Reply To field for the mail. Default value is Sender Email.[br]
## - [param enabled] [bool]: Set as enabled.[br]
##[br]
## Returns:[br]
## - [AppwriteProvider] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_smtp_provider(provider_id: String, xname: Variant = null, host: Variant = null, port: Variant = null, username: Variant = null, password: Variant = null, encryption: Variant = null, auto_tls: Variant = null, mailer: Variant = null, from_name: Variant = null, from_email: Variant = null, reply_to_name: Variant = null, reply_to_email: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")
    if host != null and not host is String:
        return AppwriteException.new("Invalid type for parameter 'host'. Expected String.", 0, "argument_error", "")
    if port != null and not port is int:
        return AppwriteException.new("Invalid type for parameter 'port'. Expected int.", 0, "argument_error", "")
    if username != null and not username is String:
        return AppwriteException.new("Invalid type for parameter 'username'. Expected String.", 0, "argument_error", "")
    if password != null and not password is String:
        return AppwriteException.new("Invalid type for parameter 'password'. Expected String.", 0, "argument_error", "")
    if encryption != null and not encryption is String:
        return AppwriteException.new("Invalid type for parameter 'encryption'. Expected String.", 0, "argument_error", "")
    if auto_tls != null and not auto_tls is bool:
        return AppwriteException.new("Invalid type for parameter 'auto_tls'. Expected bool.", 0, "argument_error", "")
    if mailer != null and not mailer is String:
        return AppwriteException.new("Invalid type for parameter 'mailer'. Expected String.", 0, "argument_error", "")
    if from_name != null and not from_name is String:
        return AppwriteException.new("Invalid type for parameter 'from_name'. Expected String.", 0, "argument_error", "")
    if from_email != null and not from_email is String:
        return AppwriteException.new("Invalid type for parameter 'from_email'. Expected String.", 0, "argument_error", "")
    if reply_to_name != null and not reply_to_name is String:
        return AppwriteException.new("Invalid type for parameter 'reply_to_name'. Expected String.", 0, "argument_error", "")
    if reply_to_email != null and not reply_to_email is String:
        return AppwriteException.new("Invalid type for parameter 'reply_to_email'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/messaging/providers/smtp/{providerId}'
    _path = _path.replace('{providerId}', str(provider_id))

    var _params := {}
    if xname != null:
        _params['name'] = xname
    if host != null:
        _params['host'] = host
    if port != null:
        _params['port'] = port
    if username != null:
        _params['username'] = username
    if password != null:
        _params['password'] = password
    if encryption != null:
        _params['encryption'] = encryption
    if auto_tls != null:
        _params['autoTLS'] = auto_tls
    if mailer != null:
        _params['mailer'] = mailer
    if from_name != null:
        _params['fromName'] = from_name
    if from_email != null:
        _params['fromEmail'] = from_email
    if reply_to_name != null:
        _params['replyToName'] = reply_to_name
    if reply_to_email != null:
        _params['replyToEmail'] = reply_to_email
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteProvider

    return await _call('patch', _path, _headers, _params, model_script)


## Create a new Telesign provider.[br]
##[br]
## Parameters:[br]
## - [param provider_id] [String]: Provider ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Provider name.[br]
## - [param from] [String]: Sender Phone number. Format this number with a leading &#039;+&#039; and a country code, e.g., +16175551212.[br]
## - [param customer_id] [String]: Telesign customer ID.[br]
## - [param api_key] [String]: Telesign API key.[br]
## - [param enabled] [bool]: Set as enabled.[br]
##[br]
## Returns:[br]
## - [AppwriteProvider] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_telesign_provider(provider_id: String, xname: String, from: Variant = null, customer_id: Variant = null, api_key: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if from != null and not from is String:
        return AppwriteException.new("Invalid type for parameter 'from'. Expected String.", 0, "argument_error", "")
    if customer_id != null and not customer_id is String:
        return AppwriteException.new("Invalid type for parameter 'customer_id'. Expected String.", 0, "argument_error", "")
    if api_key != null and not api_key is String:
        return AppwriteException.new("Invalid type for parameter 'api_key'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/messaging/providers/telesign'

    var _params := {}
    _params['providerId'] = provider_id
    _params['name'] = xname
    if from != null:
        _params['from'] = from
    if customer_id != null:
        _params['customerId'] = customer_id
    if api_key != null:
        _params['apiKey'] = api_key
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteProvider

    return await _call('post', _path, _headers, _params, model_script)


## Update a Telesign provider by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param provider_id] [String]: Provider ID.[br]
## - [param xname] [String]: Provider name.[br]
## - [param enabled] [bool]: Set as enabled.[br]
## - [param customer_id] [String]: Telesign customer ID.[br]
## - [param api_key] [String]: Telesign API key.[br]
## - [param from] [String]: Sender number.[br]
##[br]
## Returns:[br]
## - [AppwriteProvider] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_telesign_provider(provider_id: String, xname: Variant = null, enabled: Variant = null, customer_id: Variant = null, api_key: Variant = null, from: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")
    if customer_id != null and not customer_id is String:
        return AppwriteException.new("Invalid type for parameter 'customer_id'. Expected String.", 0, "argument_error", "")
    if api_key != null and not api_key is String:
        return AppwriteException.new("Invalid type for parameter 'api_key'. Expected String.", 0, "argument_error", "")
    if from != null and not from is String:
        return AppwriteException.new("Invalid type for parameter 'from'. Expected String.", 0, "argument_error", "")

    var _path := '/messaging/providers/telesign/{providerId}'
    _path = _path.replace('{providerId}', str(provider_id))

    var _params := {}
    if xname != null:
        _params['name'] = xname
    if enabled != null:
        _params['enabled'] = enabled
    if customer_id != null:
        _params['customerId'] = customer_id
    if api_key != null:
        _params['apiKey'] = api_key
    if from != null:
        _params['from'] = from

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteProvider

    return await _call('patch', _path, _headers, _params, model_script)


## Create a new Textmagic provider.[br]
##[br]
## Parameters:[br]
## - [param provider_id] [String]: Provider ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Provider name.[br]
## - [param from] [String]: Sender Phone number. Format this number with a leading &#039;+&#039; and a country code, e.g., +16175551212.[br]
## - [param username] [String]: Textmagic username.[br]
## - [param api_key] [String]: Textmagic apiKey.[br]
## - [param enabled] [bool]: Set as enabled.[br]
##[br]
## Returns:[br]
## - [AppwriteProvider] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_textmagic_provider(provider_id: String, xname: String, from: Variant = null, username: Variant = null, api_key: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if from != null and not from is String:
        return AppwriteException.new("Invalid type for parameter 'from'. Expected String.", 0, "argument_error", "")
    if username != null and not username is String:
        return AppwriteException.new("Invalid type for parameter 'username'. Expected String.", 0, "argument_error", "")
    if api_key != null and not api_key is String:
        return AppwriteException.new("Invalid type for parameter 'api_key'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/messaging/providers/textmagic'

    var _params := {}
    _params['providerId'] = provider_id
    _params['name'] = xname
    if from != null:
        _params['from'] = from
    if username != null:
        _params['username'] = username
    if api_key != null:
        _params['apiKey'] = api_key
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteProvider

    return await _call('post', _path, _headers, _params, model_script)


## Update a Textmagic provider by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param provider_id] [String]: Provider ID.[br]
## - [param xname] [String]: Provider name.[br]
## - [param enabled] [bool]: Set as enabled.[br]
## - [param username] [String]: Textmagic username.[br]
## - [param api_key] [String]: Textmagic apiKey.[br]
## - [param from] [String]: Sender number.[br]
##[br]
## Returns:[br]
## - [AppwriteProvider] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_textmagic_provider(provider_id: String, xname: Variant = null, enabled: Variant = null, username: Variant = null, api_key: Variant = null, from: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")
    if username != null and not username is String:
        return AppwriteException.new("Invalid type for parameter 'username'. Expected String.", 0, "argument_error", "")
    if api_key != null and not api_key is String:
        return AppwriteException.new("Invalid type for parameter 'api_key'. Expected String.", 0, "argument_error", "")
    if from != null and not from is String:
        return AppwriteException.new("Invalid type for parameter 'from'. Expected String.", 0, "argument_error", "")

    var _path := '/messaging/providers/textmagic/{providerId}'
    _path = _path.replace('{providerId}', str(provider_id))

    var _params := {}
    if xname != null:
        _params['name'] = xname
    if enabled != null:
        _params['enabled'] = enabled
    if username != null:
        _params['username'] = username
    if api_key != null:
        _params['apiKey'] = api_key
    if from != null:
        _params['from'] = from

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteProvider

    return await _call('patch', _path, _headers, _params, model_script)


## Create a new Twilio provider.[br]
##[br]
## Parameters:[br]
## - [param provider_id] [String]: Provider ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Provider name.[br]
## - [param from] [String]: Sender Phone number. Format this number with a leading &#039;+&#039; and a country code, e.g., +16175551212.[br]
## - [param account_sid] [String]: Twilio account secret ID.[br]
## - [param auth_token] [String]: Twilio authentication token.[br]
## - [param enabled] [bool]: Set as enabled.[br]
##[br]
## Returns:[br]
## - [AppwriteProvider] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_twilio_provider(provider_id: String, xname: String, from: Variant = null, account_sid: Variant = null, auth_token: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if from != null and not from is String:
        return AppwriteException.new("Invalid type for parameter 'from'. Expected String.", 0, "argument_error", "")
    if account_sid != null and not account_sid is String:
        return AppwriteException.new("Invalid type for parameter 'account_sid'. Expected String.", 0, "argument_error", "")
    if auth_token != null and not auth_token is String:
        return AppwriteException.new("Invalid type for parameter 'auth_token'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/messaging/providers/twilio'

    var _params := {}
    _params['providerId'] = provider_id
    _params['name'] = xname
    if from != null:
        _params['from'] = from
    if account_sid != null:
        _params['accountSid'] = account_sid
    if auth_token != null:
        _params['authToken'] = auth_token
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteProvider

    return await _call('post', _path, _headers, _params, model_script)


## Update a Twilio provider by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param provider_id] [String]: Provider ID.[br]
## - [param xname] [String]: Provider name.[br]
## - [param enabled] [bool]: Set as enabled.[br]
## - [param account_sid] [String]: Twilio account secret ID.[br]
## - [param auth_token] [String]: Twilio authentication token.[br]
## - [param from] [String]: Sender number.[br]
##[br]
## Returns:[br]
## - [AppwriteProvider] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_twilio_provider(provider_id: String, xname: Variant = null, enabled: Variant = null, account_sid: Variant = null, auth_token: Variant = null, from: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")
    if account_sid != null and not account_sid is String:
        return AppwriteException.new("Invalid type for parameter 'account_sid'. Expected String.", 0, "argument_error", "")
    if auth_token != null and not auth_token is String:
        return AppwriteException.new("Invalid type for parameter 'auth_token'. Expected String.", 0, "argument_error", "")
    if from != null and not from is String:
        return AppwriteException.new("Invalid type for parameter 'from'. Expected String.", 0, "argument_error", "")

    var _path := '/messaging/providers/twilio/{providerId}'
    _path = _path.replace('{providerId}', str(provider_id))

    var _params := {}
    if xname != null:
        _params['name'] = xname
    if enabled != null:
        _params['enabled'] = enabled
    if account_sid != null:
        _params['accountSid'] = account_sid
    if auth_token != null:
        _params['authToken'] = auth_token
    if from != null:
        _params['from'] = from

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteProvider

    return await _call('patch', _path, _headers, _params, model_script)


## Create a new Vonage provider.[br]
##[br]
## Parameters:[br]
## - [param provider_id] [String]: Provider ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Provider name.[br]
## - [param from] [String]: Sender Phone number. Format this number with a leading &#039;+&#039; and a country code, e.g., +16175551212.[br]
## - [param api_key] [String]: Vonage API key.[br]
## - [param api_secret] [String]: Vonage API secret.[br]
## - [param enabled] [bool]: Set as enabled.[br]
##[br]
## Returns:[br]
## - [AppwriteProvider] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_vonage_provider(provider_id: String, xname: String, from: Variant = null, api_key: Variant = null, api_secret: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if from != null and not from is String:
        return AppwriteException.new("Invalid type for parameter 'from'. Expected String.", 0, "argument_error", "")
    if api_key != null and not api_key is String:
        return AppwriteException.new("Invalid type for parameter 'api_key'. Expected String.", 0, "argument_error", "")
    if api_secret != null and not api_secret is String:
        return AppwriteException.new("Invalid type for parameter 'api_secret'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/messaging/providers/vonage'

    var _params := {}
    _params['providerId'] = provider_id
    _params['name'] = xname
    if from != null:
        _params['from'] = from
    if api_key != null:
        _params['apiKey'] = api_key
    if api_secret != null:
        _params['apiSecret'] = api_secret
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteProvider

    return await _call('post', _path, _headers, _params, model_script)


## Update a Vonage provider by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param provider_id] [String]: Provider ID.[br]
## - [param xname] [String]: Provider name.[br]
## - [param enabled] [bool]: Set as enabled.[br]
## - [param api_key] [String]: Vonage API key.[br]
## - [param api_secret] [String]: Vonage API secret.[br]
## - [param from] [String]: Sender number.[br]
##[br]
## Returns:[br]
## - [AppwriteProvider] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_vonage_provider(provider_id: String, xname: Variant = null, enabled: Variant = null, api_key: Variant = null, api_secret: Variant = null, from: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")
    if api_key != null and not api_key is String:
        return AppwriteException.new("Invalid type for parameter 'api_key'. Expected String.", 0, "argument_error", "")
    if api_secret != null and not api_secret is String:
        return AppwriteException.new("Invalid type for parameter 'api_secret'. Expected String.", 0, "argument_error", "")
    if from != null and not from is String:
        return AppwriteException.new("Invalid type for parameter 'from'. Expected String.", 0, "argument_error", "")

    var _path := '/messaging/providers/vonage/{providerId}'
    _path = _path.replace('{providerId}', str(provider_id))

    var _params := {}
    if xname != null:
        _params['name'] = xname
    if enabled != null:
        _params['enabled'] = enabled
    if api_key != null:
        _params['apiKey'] = api_key
    if api_secret != null:
        _params['apiSecret'] = api_secret
    if from != null:
        _params['from'] = from

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteProvider

    return await _call('patch', _path, _headers, _params, model_script)


## Get a provider by its unique ID.[br]
##[br]
##[br]
## Parameters:[br]
## - [param provider_id] [String]: Provider ID.[br]
##[br]
## Returns:[br]
## - [AppwriteProvider] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_provider(provider_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/messaging/providers/{providerId}'
    _path = _path.replace('{providerId}', str(provider_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteProvider

    return await _call('get', _path, _headers, _params, model_script)


## Delete a provider by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param provider_id] [String]: Provider ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_provider(provider_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/messaging/providers/{providerId}'
    _path = _path.replace('{providerId}', str(provider_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Get the provider activity logs listed by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param provider_id] [String]: Provider ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Only supported methods are limit and offset[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteLogList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_provider_logs(provider_id: String, queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/messaging/providers/{providerId}/logs'
    _path = _path.replace('{providerId}', str(provider_id))

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteLogList

    return await _call('get', _path, _headers, _params, model_script)


## Get the subscriber activity logs listed by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param subscriber_id] [String]: Subscriber ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Only supported methods are limit and offset[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteLogList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_subscriber_logs(subscriber_id: String, queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/messaging/subscribers/{subscriberId}/logs'
    _path = _path.replace('{subscriberId}', str(subscriber_id))

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteLogList

    return await _call('get', _path, _headers, _params, model_script)


## Get a list of all topics from the current Appwrite project.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, description, emailTotal, smsTotal, pushTotal[br]
## - [param search] [String]: Search term to filter your list results. Max length: 256 chars.[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteTopicList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_topics(queries: Variant = null, search: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if search != null and not search is String:
        return AppwriteException.new("Invalid type for parameter 'search'. Expected String.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/messaging/topics'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if search != null:
        _params['search'] = search
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteTopicList

    return await _call('get', _path, _headers, _params, model_script)


## Create a new topic.[br]
##[br]
## Parameters:[br]
## - [param topic_id] [String]: Topic ID. Choose a custom Topic ID or a new Topic ID.[br]
## - [param xname] [String]: Topic Name.[br]
## - [param subscribe] [Array]: An array of role strings with subscribe permission. By default all users are granted with any subscribe permission. [learn more about roles](https://appwrite.io/docs/permissions#permission-roles). Maximum of 100 roles are allowed, each 64 characters long.[br]
##[br]
## Returns:[br]
## - [AppwriteTopic] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_topic(topic_id: String, xname: String, subscribe: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if subscribe != null and not subscribe is Array:
        return AppwriteException.new("Invalid type for parameter 'subscribe'. Expected Array.", 0, "argument_error", "")

    var _path := '/messaging/topics'

    var _params := {}
    _params['topicId'] = topic_id
    _params['name'] = xname
    if subscribe != null:
        _params['subscribe'] = subscribe

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteTopic

    return await _call('post', _path, _headers, _params, model_script)


## Get a topic by its unique ID.[br]
##[br]
##[br]
## Parameters:[br]
## - [param topic_id] [String]: Topic ID.[br]
##[br]
## Returns:[br]
## - [AppwriteTopic] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_topic(topic_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/messaging/topics/{topicId}'
    _path = _path.replace('{topicId}', str(topic_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteTopic

    return await _call('get', _path, _headers, _params, model_script)


## Update a topic by its unique ID.[br]
##[br]
##[br]
## Parameters:[br]
## - [param topic_id] [String]: Topic ID.[br]
## - [param xname] [String]: Topic Name.[br]
## - [param subscribe] [Array]: An array of role strings with subscribe permission. By default all users are granted with any subscribe permission. [learn more about roles](https://appwrite.io/docs/permissions#permission-roles). Maximum of 100 roles are allowed, each 64 characters long.[br]
##[br]
## Returns:[br]
## - [AppwriteTopic] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_topic(topic_id: String, xname: Variant = null, subscribe: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")
    if subscribe != null and not subscribe is Array:
        return AppwriteException.new("Invalid type for parameter 'subscribe'. Expected Array.", 0, "argument_error", "")

    var _path := '/messaging/topics/{topicId}'
    _path = _path.replace('{topicId}', str(topic_id))

    var _params := {}
    if xname != null:
        _params['name'] = xname
    if subscribe != null:
        _params['subscribe'] = subscribe

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteTopic

    return await _call('patch', _path, _headers, _params, model_script)


## Delete a topic by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param topic_id] [String]: Topic ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_topic(topic_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/messaging/topics/{topicId}'
    _path = _path.replace('{topicId}', str(topic_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Get the topic activity logs listed by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param topic_id] [String]: Topic ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Only supported methods are limit and offset[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteLogList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_topic_logs(topic_id: String, queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/messaging/topics/{topicId}/logs'
    _path = _path.replace('{topicId}', str(topic_id))

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteLogList

    return await _call('get', _path, _headers, _params, model_script)


## Get a list of all subscribers from the current Appwrite project.[br]
##[br]
## Parameters:[br]
## - [param topic_id] [String]: Topic ID. The topic ID subscribed to.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: targetId, topicId, userId, providerType[br]
## - [param search] [String]: Search term to filter your list results. Max length: 256 chars.[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteSubscriberList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_subscribers(topic_id: String, queries: Variant = null, search: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if search != null and not search is String:
        return AppwriteException.new("Invalid type for parameter 'search'. Expected String.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/messaging/topics/{topicId}/subscribers'
    _path = _path.replace('{topicId}', str(topic_id))

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if search != null:
        _params['search'] = search
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteSubscriberList

    return await _call('get', _path, _headers, _params, model_script)


## Create a new subscriber.[br]
##[br]
## Parameters:[br]
## - [param topic_id] [String]: Topic ID. The topic ID to subscribe to.[br]
## - [param subscriber_id] [String]: Subscriber ID. Choose a custom Subscriber ID or a new Subscriber ID.[br]
## - [param target_id] [String]: Target ID. The target ID to link to the specified Topic ID.[br]
##[br]
## Returns:[br]
## - [AppwriteSubscriber] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_subscriber(topic_id: String, subscriber_id: String, target_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/messaging/topics/{topicId}/subscribers'
    _path = _path.replace('{topicId}', str(topic_id))

    var _params := {}
    _params['subscriberId'] = subscriber_id
    _params['targetId'] = target_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteSubscriber

    return await _call('post', _path, _headers, _params, model_script)


## Get a subscriber by its unique ID.[br]
##[br]
##[br]
## Parameters:[br]
## - [param topic_id] [String]: Topic ID. The topic ID subscribed to.[br]
## - [param subscriber_id] [String]: Subscriber ID.[br]
##[br]
## Returns:[br]
## - [AppwriteSubscriber] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_subscriber(topic_id: String, subscriber_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/messaging/topics/{topicId}/subscribers/{subscriberId}'
    _path = _path.replace('{topicId}', str(topic_id))
    _path = _path.replace('{subscriberId}', str(subscriber_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteSubscriber

    return await _call('get', _path, _headers, _params, model_script)


## Delete a subscriber by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param topic_id] [String]: Topic ID. The topic ID subscribed to.[br]
## - [param subscriber_id] [String]: Subscriber ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_subscriber(topic_id: String, subscriber_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/messaging/topics/{topicId}/subscribers/{subscriberId}'
    _path = _path.replace('{topicId}', str(topic_id))
    _path = _path.replace('{subscriberId}', str(subscriber_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)

