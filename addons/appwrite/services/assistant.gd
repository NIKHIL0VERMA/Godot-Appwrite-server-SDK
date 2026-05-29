extends "../utils/service.gd"
## Service class.


## Send a prompt to the AI assistant and receive a response. This endpoint allows you to interact with Appwrite&#039;s AI assistant by sending questions or prompts and receiving helpful responses in real-time through a server-sent events stream. [br]
##[br]
## Parameters:[br]
## - [param prompt] [String]: Prompt. A string containing questions asked to the AI assistant.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func chat(prompt: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/console/assistant'

    var _params := {}
    _params['prompt'] = prompt

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('post', _path, _headers, _params, model_script)

