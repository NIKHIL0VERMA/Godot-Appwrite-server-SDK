extends "../utils/service.gd"
## The Locale service allows you to customize your app based on your users&#039; location.


## Get the current user location based on IP. Returns an object with user country code, country name, continent name, continent code, ip address and suggested currency. You can use the locale header to get the data in a supported language.[br]
##[br]
##([IP Geolocation by DB-IP](https://db-ip.com))[br]
##[br]
## Returns:[br]
## - [AppwriteLocale] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func xget() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/locale'

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteLocale


    return await _call('get', _path, _headers, _params, model_script)


## List of all locale codes in [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes).[br]
##[br]
## Returns:[br]
## - [AppwriteLocaleCodeList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_codes() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/locale/codes'

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteLocaleCodeList


    return await _call('get', _path, _headers, _params, model_script)


## List of all continents. You can use the locale header to get the data in a supported language.[br]
##[br]
## Returns:[br]
## - [AppwriteContinentList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_continents() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/locale/continents'

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteContinentList


    return await _call('get', _path, _headers, _params, model_script)


## List of all countries. You can use the locale header to get the data in a supported language.[br]
##[br]
## Returns:[br]
## - [AppwriteCountryList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_countries() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/locale/countries'

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteCountryList


    return await _call('get', _path, _headers, _params, model_script)


## List of all countries that are currently members of the EU. You can use the locale header to get the data in a supported language.[br]
##[br]
## Returns:[br]
## - [AppwriteCountryList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_countries_eu() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/locale/countries/eu'

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteCountryList


    return await _call('get', _path, _headers, _params, model_script)


## List of all countries phone codes. You can use the locale header to get the data in a supported language.[br]
##[br]
## Returns:[br]
## - [AppwritePhoneList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_countries_phones() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/locale/countries/phones'

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwritePhoneList


    return await _call('get', _path, _headers, _params, model_script)


## List of all currencies, including currency symbol, name, plural, and decimal digits for all major and minor currencies. You can use the locale header to get the data in a supported language.[br]
##[br]
## Returns:[br]
## - [AppwriteCurrencyList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_currencies() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/locale/currencies'

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteCurrencyList


    return await _call('get', _path, _headers, _params, model_script)


## List of all languages classified by ISO 639-1 including 2-letter code, name in English, and name in the respective language.[br]
##[br]
## Returns:[br]
## - [AppwriteLanguageList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_languages() -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/locale/languages'

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteLanguageList


    return await _call('get', _path, _headers, _params, model_script)

