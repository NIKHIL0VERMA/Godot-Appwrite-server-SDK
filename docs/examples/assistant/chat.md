Send a prompt to the AI assistant and receive a response. This endpoint allows you to interact with Appwrite&#039;s AI assistant by sending questions or prompts and receiving helpful responses in real-time through a server-sent events stream. 
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.assistant.chat(
        '<PROMPT>'
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is Variant:
        print(result.to_dict())
```