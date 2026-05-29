extends "../utils/service.gd"
## The Teams service allows you to group users of your project and to enable them to share read and write access to your project resources


## Get a list of all the teams in which the current user is a member. You can use the parameters to filter your results.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, total, billingPlan[br]
## - [param search] [String]: Search term to filter your list results. Max length: 256 chars.[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteTeamList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list(queries: Variant = null, search: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if search != null and not search is String:
        return AppwriteException.new("Invalid type for parameter 'search'. Expected String.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/teams'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if search != null:
        _params['search'] = search
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteTeamList

    return await _call('get', _path, _headers, _params, model_script)


## Create a new team. The user who creates the team will automatically be assigned as the owner of the team. Only the users with the owner role can invite new members, add new owners and delete or update the team.[br]
##[br]
## Parameters:[br]
## - [param team_id] [String]: Team ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Team name. Max length: 128 chars.[br]
## - [param roles] [Array]: Array of strings. Use this param to set the roles in the team for the user who created it. The default role is **owner**. A role can be any string. Learn more about [roles and permissions](https://appwrite.io/docs/permissions). Maximum of 100 roles are allowed, each 32 characters long.[br]
##[br]
## Returns:[br]
## - [AppwriteTeam] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create(team_id: String, xname: String, roles: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if roles != null and not roles is Array:
        return AppwriteException.new("Invalid type for parameter 'roles'. Expected Array.", 0, "argument_error", "")

    var _path := '/teams'

    var _params := {}
    _params['teamId'] = team_id
    _params['name'] = xname
    if roles != null:
        _params['roles'] = roles

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteTeam

    return await _call('post', _path, _headers, _params, model_script)


## Get a team by its ID. All team members have read access for this resource.[br]
##[br]
## Parameters:[br]
## - [param team_id] [String]: Team ID.[br]
##[br]
## Returns:[br]
## - [AppwriteTeam] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func xget(team_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/teams/{teamId}'
    _path = _path.replace('{teamId}', str(team_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteTeam

    return await _call('get', _path, _headers, _params, model_script)


## Update the team&#039;s name by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param team_id] [String]: Team ID.[br]
## - [param xname] [String]: New team name. Max length: 128 chars.[br]
##[br]
## Returns:[br]
## - [AppwriteTeam] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_name(team_id: String, xname: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/teams/{teamId}'
    _path = _path.replace('{teamId}', str(team_id))

    var _params := {}
    _params['name'] = xname

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteTeam

    return await _call('put', _path, _headers, _params, model_script)


## Delete a team using its ID. Only team members with the owner role can delete the team.[br]
##[br]
## Parameters:[br]
## - [param team_id] [String]: Team ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete(team_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/teams/{teamId}'
    _path = _path.replace('{teamId}', str(team_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Get the team activity logs list by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param team_id] [String]: Team ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Only supported methods are limit and offset[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteLogList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_logs(team_id: String, queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/teams/{teamId}/logs'
    _path = _path.replace('{teamId}', str(team_id))

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteLogList

    return await _call('get', _path, _headers, _params, model_script)


## Use this endpoint to list a team&#039;s members using the team&#039;s ID. All team members have read access to this endpoint. Hide sensitive attributes from the response by toggling membership privacy in the Console.[br]
##[br]
## Parameters:[br]
## - [param team_id] [String]: Team ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: userId, teamId, invited, joined, confirm, roles[br]
## - [param search] [String]: Search term to filter your list results. Max length: 256 chars.[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteMembershipList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_memberships(team_id: String, queries: Variant = null, search: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if search != null and not search is String:
        return AppwriteException.new("Invalid type for parameter 'search'. Expected String.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/teams/{teamId}/memberships'
    _path = _path.replace('{teamId}', str(team_id))

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if search != null:
        _params['search'] = search
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteMembershipList

    return await _call('get', _path, _headers, _params, model_script)


## Invite a new member to join your team. Provide an ID for existing users, or invite unregistered users using an email or phone number. If initiated from a Client SDK, Appwrite will send an email or sms with a link to join the team to the invited user, and an account will be created for them if one doesn&#039;t exist. If initiated from a Server SDK, the new member will be added automatically to the team.[br]
##[br]
##You only need to provide one of a user ID, email, or phone number. Appwrite will prioritize accepting the user ID &gt; email &gt; phone number if you provide more than one of these parameters.[br]
##[br]
##Use the `url` parameter to redirect the user from the invitation email to your app. After the user is redirected, use the [Update Team Membership Status](https://appwrite.io/docs/references/cloud/client-web/teams#updateMembershipStatus) endpoint to allow the user to accept the invitation to the team. [br]
##[br]
##Please note that to avoid a [Redirect Attack](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.md) Appwrite will accept the only redirect URLs under the domains you have added as a platform on the Appwrite Console.[br]
##[br]
##[br]
## Parameters:[br]
## - [param team_id] [String]: Team ID.[br]
## - [param roles] [Array]: Array of strings. Use this param to set the user roles in the team. A role can be any string. Learn more about [roles and permissions](https://appwrite.io/docs/permissions). Maximum of 100 roles are allowed, each 81 characters long.[br]
## - [param email] [String]: Email of the new team member.[br]
## - [param user_id] [String]: ID of the user to be added to a team.[br]
## - [param phone] [String]: Phone number. Format this number with a leading &#039;+&#039; and a country code, e.g., +16175551212.[br]
## - [param url] [String]: URL to redirect the user back to your app from the invitation email. This parameter is not required when an API key is supplied. Only URLs from hostnames in your project platform list are allowed. This requirement helps to prevent an [open redirect](https://cheatsheetseries.owasp.org/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.html) attack against your project API.[br]
## - [param xname] [String]: Name of the new team member. Max length: 128 chars.[br]
##[br]
## Returns:[br]
## - [AppwriteMembership] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_membership(team_id: String, roles: Array, email: Variant = null, user_id: Variant = null, phone: Variant = null, url: Variant = null, xname: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if email != null and not email is String:
        return AppwriteException.new("Invalid type for parameter 'email'. Expected String.", 0, "argument_error", "")
    if user_id != null and not user_id is String:
        return AppwriteException.new("Invalid type for parameter 'user_id'. Expected String.", 0, "argument_error", "")
    if phone != null and not phone is String:
        return AppwriteException.new("Invalid type for parameter 'phone'. Expected String.", 0, "argument_error", "")
    if url != null and not url is String:
        return AppwriteException.new("Invalid type for parameter 'url'. Expected String.", 0, "argument_error", "")
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")

    var _path := '/teams/{teamId}/memberships'
    _path = _path.replace('{teamId}', str(team_id))

    var _params := {}
    if email != null:
        _params['email'] = email
    if user_id != null:
        _params['userId'] = user_id
    if phone != null:
        _params['phone'] = phone
    _params['roles'] = roles
    if url != null:
        _params['url'] = url
    if xname != null:
        _params['name'] = xname

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteMembership

    return await _call('post', _path, _headers, _params, model_script)


## Get a team member by the membership unique id. All team members have read access for this resource. Hide sensitive attributes from the response by toggling membership privacy in the Console.[br]
##[br]
## Parameters:[br]
## - [param team_id] [String]: Team ID.[br]
## - [param membership_id] [String]: Membership ID.[br]
##[br]
## Returns:[br]
## - [AppwriteMembership] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_membership(team_id: String, membership_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/teams/{teamId}/memberships/{membershipId}'
    _path = _path.replace('{teamId}', str(team_id))
    _path = _path.replace('{membershipId}', str(membership_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteMembership

    return await _call('get', _path, _headers, _params, model_script)


## Modify the roles of a team member. Only team members with the owner role have access to this endpoint. Learn more about [roles and permissions](https://appwrite.io/docs/permissions).[br]
##[br]
##[br]
## Parameters:[br]
## - [param team_id] [String]: Team ID.[br]
## - [param membership_id] [String]: Membership ID.[br]
## - [param roles] [Array]: An array of strings. Use this param to set the user&#039;s roles in the team. A role can be any string. Learn more about [roles and permissions](https://appwrite.io/docs/permissions). Maximum of 100 roles are allowed, each 81 characters long.[br]
##[br]
## Returns:[br]
## - [AppwriteMembership] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_membership(team_id: String, membership_id: String, roles: Array) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/teams/{teamId}/memberships/{membershipId}'
    _path = _path.replace('{teamId}', str(team_id))
    _path = _path.replace('{membershipId}', str(membership_id))

    var _params := {}
    _params['roles'] = roles

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteMembership

    return await _call('patch', _path, _headers, _params, model_script)


## This endpoint allows a user to leave a team or for a team owner to delete the membership of any other team member. You can also use this endpoint to delete a user membership even if it is not accepted.[br]
##[br]
## Parameters:[br]
## - [param team_id] [String]: Team ID.[br]
## - [param membership_id] [String]: Membership ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_membership(team_id: String, membership_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/teams/{teamId}/memberships/{membershipId}'
    _path = _path.replace('{teamId}', str(team_id))
    _path = _path.replace('{membershipId}', str(membership_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Use this endpoint to allow a user to accept an invitation to join a team after being redirected back to your app from the invitation email received by the user.[br]
##[br]
##If the request is successful, a session for the user is automatically created.[br]
##[br]
##[br]
## Parameters:[br]
## - [param team_id] [String]: Team ID.[br]
## - [param membership_id] [String]: Membership ID.[br]
## - [param user_id] [String]: User ID.[br]
## - [param secret] [String]: Secret key.[br]
##[br]
## Returns:[br]
## - [AppwriteMembership] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_membership_status(team_id: String, membership_id: String, user_id: String, secret: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/teams/{teamId}/memberships/{membershipId}/status'
    _path = _path.replace('{teamId}', str(team_id))
    _path = _path.replace('{membershipId}', str(membership_id))

    var _params := {}
    _params['userId'] = user_id
    _params['secret'] = secret

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteMembership

    return await _call('patch', _path, _headers, _params, model_script)


## Get the team&#039;s shared preferences by its unique ID. If a preference doesn&#039;t need to be shared by all team members, prefer storing them in [user preferences](https://appwrite.io/docs/references/cloud/client-web/account#getPrefs).[br]
##[br]
## Parameters:[br]
## - [param team_id] [String]: Team ID.[br]
##[br]
## Returns:[br]
## - [AppwritePreferences] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_prefs(team_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/teams/{teamId}/prefs'
    _path = _path.replace('{teamId}', str(team_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwritePreferences

    return await _call('get', _path, _headers, _params, model_script)


## Update the team&#039;s preferences by its unique ID. The object you pass is stored as is and replaces any previous value. The maximum allowed prefs size is 64kB and throws an error if exceeded.[br]
##[br]
## Parameters:[br]
## - [param team_id] [String]: Team ID.[br]
## - [param prefs] [Dictionary]: Prefs key-value JSON object.[br]
##[br]
## Returns:[br]
## - [AppwritePreferences] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_prefs(team_id: String, prefs: Dictionary) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/teams/{teamId}/prefs'
    _path = _path.replace('{teamId}', str(team_id))

    var _params := {}
    _params['prefs'] = prefs

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwritePreferences

    return await _call('put', _path, _headers, _params, model_script)

