extends "../utils/service.gd"
## The GraphQL API allows you to query and mutate your Appwrite server using GraphQL.


## Execute a GraphQL mutation.[br]
##[br]
## Parameters:[br]
## - [param query] [Dictionary]: The query or queries to execute.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func query(query: Dictionary) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/graphql'

    var _params := {}
    _params['query'] = query

    var _headers := {
        'x-sdk-graphql': 'true',
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = null


    return await _call('post', _path, _headers, _params, model_script)


## Execute a GraphQL mutation.[br]
##[br]
## Parameters:[br]
## - [param query] [Dictionary]: The query or queries to execute.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func mutation(query: Dictionary) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/graphql/mutation'

    var _params := {}
    _params['query'] = query

    var _headers := {
        'x-sdk-graphql': 'true',
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = null


    return await _call('post', _path, _headers, _params, model_script)

