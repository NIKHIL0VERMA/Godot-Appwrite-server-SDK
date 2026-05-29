Create a new topic.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.messaging.create_topic(
        '<TOPIC_ID>',
        '<NAME>',
        ["any"] # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteTopic:
        print(result.to_dict())
```