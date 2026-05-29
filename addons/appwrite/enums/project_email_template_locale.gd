## Enum: PROJECTEMAILTEMPLATELOCALE

const AF = "af"
const AR_AE = "ar-ae"
const AR_BH = "ar-bh"
const AR_DZ = "ar-dz"
const AR_EG = "ar-eg"
const AR_IQ = "ar-iq"
const AR_JO = "ar-jo"
const AR_KW = "ar-kw"
const AR_LB = "ar-lb"
const AR_LY = "ar-ly"
const AR_MA = "ar-ma"
const AR_OM = "ar-om"
const AR_QA = "ar-qa"
const AR_SA = "ar-sa"
const AR_SY = "ar-sy"
const AR_TN = "ar-tn"
const AR_YE = "ar-ye"
const AS = "as"
const AZ = "az"
const BE = "be"
const BG = "bg"
const BH = "bh"
const BN = "bn"
const BS = "bs"
const CA = "ca"
const CS = "cs"
const CY = "cy"
const DA = "da"
const DE = "de"
const DE_AT = "de-at"
const DE_CH = "de-ch"
const DE_LI = "de-li"
const DE_LU = "de-lu"
const EL = "el"
const EN = "en"
const EN_AU = "en-au"
const EN_BZ = "en-bz"
const EN_CA = "en-ca"
const EN_GB = "en-gb"
const EN_IE = "en-ie"
const EN_JM = "en-jm"
const EN_NZ = "en-nz"
const EN_TT = "en-tt"
const EN_US = "en-us"
const EN_ZA = "en-za"
const EO = "eo"
const ES = "es"
const ES_AR = "es-ar"
const ES_BO = "es-bo"
const ES_CL = "es-cl"
const ES_CO = "es-co"
const ES_CR = "es-cr"
const ES_DO = "es-do"
const ES_EC = "es-ec"
const ES_GT = "es-gt"
const ES_HN = "es-hn"
const ES_MX = "es-mx"
const ES_NI = "es-ni"
const ES_PA = "es-pa"
const ES_PE = "es-pe"
const ES_PR = "es-pr"
const ES_PY = "es-py"
const ES_SV = "es-sv"
const ES_UY = "es-uy"
const ES_VE = "es-ve"
const ET = "et"
const EU = "eu"
const FA = "fa"
const FI = "fi"
const FO = "fo"
const FR = "fr"
const FR_BE = "fr-be"
const FR_CA = "fr-ca"
const FR_CH = "fr-ch"
const FR_LU = "fr-lu"
const GA = "ga"
const GD = "gd"
const HE = "he"
const HI = "hi"
const HR = "hr"
const HU = "hu"
const ID = "id"
const IS = "is"
const IT = "it"
const IT_CH = "it-ch"
const JA = "ja"
const JI = "ji"
const KO = "ko"
const KU = "ku"
const LT = "lt"
const LV = "lv"
const MK = "mk"
const ML = "ml"
const MS = "ms"
const MT = "mt"
const NB = "nb"
const NE = "ne"
const NL = "nl"
const NL_BE = "nl-be"
const NN = "nn"
const NO = "no"
const PA = "pa"
const PL = "pl"
const PT = "pt"
const PT_BR = "pt-br"
const RM = "rm"
const RO = "ro"
const RO_MD = "ro-md"
const RU = "ru"
const RU_MD = "ru-md"
const SB = "sb"
const SK = "sk"
const SL = "sl"
const SQ = "sq"
const SR = "sr"
const SV = "sv"
const SV_FI = "sv-fi"
const TH = "th"
const TN = "tn"
const TR = "tr"
const TS = "ts"
const UA = "ua"
const UR = "ur"
const VE = "ve"
const VI = "vi"
const XH = "xh"
const ZH_CN = "zh-cn"
const ZH_HK = "zh-hk"
const ZH_SG = "zh-sg"
const ZH_TW = "zh-tw"
const ZU = "zu"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "af",
                "ar-ae",
                "ar-bh",
                "ar-dz",
                "ar-eg",
                "ar-iq",
                "ar-jo",
                "ar-kw",
                "ar-lb",
                "ar-ly",
                "ar-ma",
                "ar-om",
                "ar-qa",
                "ar-sa",
                "ar-sy",
                "ar-tn",
                "ar-ye",
                "as",
                "az",
                "be",
                "bg",
                "bh",
                "bn",
                "bs",
                "ca",
                "cs",
                "cy",
                "da",
                "de",
                "de-at",
                "de-ch",
                "de-li",
                "de-lu",
                "el",
                "en",
                "en-au",
                "en-bz",
                "en-ca",
                "en-gb",
                "en-ie",
                "en-jm",
                "en-nz",
                "en-tt",
                "en-us",
                "en-za",
                "eo",
                "es",
                "es-ar",
                "es-bo",
                "es-cl",
                "es-co",
                "es-cr",
                "es-do",
                "es-ec",
                "es-gt",
                "es-hn",
                "es-mx",
                "es-ni",
                "es-pa",
                "es-pe",
                "es-pr",
                "es-py",
                "es-sv",
                "es-uy",
                "es-ve",
                "et",
                "eu",
                "fa",
                "fi",
                "fo",
                "fr",
                "fr-be",
                "fr-ca",
                "fr-ch",
                "fr-lu",
                "ga",
                "gd",
                "he",
                "hi",
                "hr",
                "hu",
                "id",
                "is",
                "it",
                "it-ch",
                "ja",
                "ji",
                "ko",
                "ku",
                "lt",
                "lv",
                "mk",
                "ml",
                "ms",
                "mt",
                "nb",
                "ne",
                "nl",
                "nl-be",
                "nn",
                "no",
                "pa",
                "pl",
                "pt",
                "pt-br",
                "rm",
                "ro",
                "ro-md",
                "ru",
                "ru-md",
                "sb",
                "sk",
                "sl",
                "sq",
                "sr",
                "sv",
                "sv-fi",
                "th",
                "tn",
                "tr",
                "ts",
                "ua",
                "ur",
                "ve",
                "vi",
                "xh",
                "zh-cn",
                "zh-hk",
                "zh-sg",
                "zh-tw",
                "zu",
            ]