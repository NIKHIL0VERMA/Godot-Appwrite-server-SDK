# Getting Started

The Appwrite SDK for Headless Godot automatically intializes itself using values from .env. You can also set them at runtime using the `set_endpoint()`, `set_project()`, `set_key()` and `set_self_signed()` methods.

Refer to [Configuration](configuration.md) guide for detailed information on how to configure the SDK.

## Requirements

- Godot 4.x
- An Appwrite Cloud or self-hosted Appwrite server

## Installation

1. Open the AssetLib tab inside the Godot 4 editor.
2. Search for Appwrite server SDK.
3. Download and install plugin.
4. Enable the plugin from Project -> Project Settings -> Plugins.

## Create an Appwrite Project
1. Sign in to your Appwrite Console.
2. Create a API key.
3. Fill details
4. Select the Scopes for this API key.
5. Copy the **Endpoint URL** and **API Key** from API info section.

## Configure the SDK
Configure the SDK using either of the following methods:
* Recommended: Create a `.env` file at root containing you Appwrite configuration.
* Alternative: Set the values at runtime.

Refer to [Configuration](configuration.md) guide for detailed information on how to configure the SDK.