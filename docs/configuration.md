# Configuration

There are two way to config the sdk.

## Runtime configuration
Supported methods:

- set_endpoint(endpoint: String) -> Variant
- add_header(key: String, value: String) -> RefCounted
- set_self_signed(status: bool = true) -> RefCounted
- set_project(value: String) -> RefCounted
- set_key(value: String) -> RefCounted
- set_jwt(value: String) -> RefCounted
- set_locale(value: String) -> RefCounted
- set_session(value: String) -> RefCounted
- set_forwarded_user_agent(value: String) -> RefCounted
- set_dev_key(value: String) -> RefCounted
- set_cookie(value: String) -> RefCounted
- set_impersonate_user_id(value: String) -> RefCounted
- set_impersonate_user_email(value: String) -> RefCounted
- set_impersonate_user_phone(value: String) -> RefCounted

### Example Usage

```gdscript
extends Node

func _ready():
    Appwrite.set_endpoint('<API Endpoint>')
```

## Environment Variables
Copy the downloaded `.env.example` to `res://.env` and fill in the values.

Supported variables:

- APPWRITE_ENDPOINT
- APPWRITE_SELF_SIGNED
- APPWRITE_PROJECT
- APPWRITE_KEY
- APPWRITE_JWT
- APPWRITE_LOCALE
- APPWRITE_SESSION
- APPWRITE_FORWARDEDUSERAGENT
- APPWRITE_DEVKEY
- APPWRITE_COOKIE
- APPWRITE_IMPERSONATEUSERID
- APPWRITE_IMPERSONATEUSEREMAIL
- APPWRITE_IMPERSONATEUSERPHONE
