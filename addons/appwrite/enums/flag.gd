## Enum: FLAG

const AFGHANISTAN = "af"
const ANGOLA = "ao"
const ALBANIA = "al"
const ANDORRA = "ad"
const UNITED_ARAB_EMIRATES = "ae"
const ARGENTINA = "ar"
const ARMENIA = "am"
const ANTIGUA_AND_BARBUDA = "ag"
const AUSTRALIA = "au"
const AUSTRIA = "at"
const AZERBAIJAN = "az"
const BURUNDI = "bi"
const BELGIUM = "be"
const BENIN = "bj"
const BURKINA_FASO = "bf"
const BANGLADESH = "bd"
const BULGARIA = "bg"
const BAHRAIN = "bh"
const BAHAMAS = "bs"
const BOSNIA_AND_HERZEGOVINA = "ba"
const BELARUS = "by"
const BELIZE = "bz"
const BOLIVIA = "bo"
const BRAZIL = "br"
const BARBADOS = "bb"
const BRUNEI_DARUSSALAM = "bn"
const BHUTAN = "bt"
const BOTSWANA = "bw"
const CENTRAL_AFRICAN_REPUBLIC = "cf"
const CANADA = "ca"
const SWITZERLAND = "ch"
const CHILE = "cl"
const CHINA = "cn"
const COTE_DIVOIRE = "ci"
const CAMEROON = "cm"
const DEMOCRATIC_REPUBLIC_OF_THE_CONGO = "cd"
const REPUBLIC_OF_THE_CONGO = "cg"
const COLOMBIA = "co"
const COMOROS = "km"
const CAPE_VERDE = "cv"
const COSTA_RICA = "cr"
const CUBA = "cu"
const CYPRUS = "cy"
const CZECH_REPUBLIC = "cz"
const GERMANY = "de"
const DJIBOUTI = "dj"
const DOMINICA = "dm"
const DENMARK = "dk"
const DOMINICAN_REPUBLIC = "do"
const ALGERIA = "dz"
const ECUADOR = "ec"
const EGYPT = "eg"
const ERITREA = "er"
const SPAIN = "es"
const ESTONIA = "ee"
const ETHIOPIA = "et"
const FINLAND = "fi"
const FIJI = "fj"
const FRANCE = "fr"
const MICRONESIA_FEDERATED_STATES_OF = "fm"
const GABON = "ga"
const UNITED_KINGDOM = "gb"
const GEORGIA = "ge"
const GHANA = "gh"
const GUINEA = "gn"
const GAMBIA = "gm"
const GUINEA_BISSAU = "gw"
const EQUATORIAL_GUINEA = "gq"
const GREECE = "gr"
const GRENADA = "gd"
const GUATEMALA = "gt"
const GUYANA = "gy"
const HONDURAS = "hn"
const CROATIA = "hr"
const HAITI = "ht"
const HUNGARY = "hu"
const INDONESIA = "id"
const INDIA = "in"
const IRELAND = "ie"
const IRAN_ISLAMIC_REPUBLIC_OF = "ir"
const IRAQ = "iq"
const ICELAND = "is"
const ISRAEL = "il"
const ITALY = "it"
const JAMAICA = "jm"
const JORDAN = "jo"
const JAPAN = "jp"
const KAZAKHSTAN = "kz"
const KENYA = "ke"
const KYRGYZSTAN = "kg"
const CAMBODIA = "kh"
const KIRIBATI = "ki"
const SAINT_KITTS_AND_NEVIS = "kn"
const SOUTH_KOREA = "kr"
const KUWAIT = "kw"
const LAO_PEOPLES_DEMOCRATIC_REPUBLIC = "la"
const LEBANON = "lb"
const LIBERIA = "lr"
const LIBYA = "ly"
const SAINT_LUCIA = "lc"
const LIECHTENSTEIN = "li"
const SRI_LANKA = "lk"
const LESOTHO = "ls"
const LITHUANIA = "lt"
const LUXEMBOURG = "lu"
const LATVIA = "lv"
const MOROCCO = "ma"
const MONACO = "mc"
const MOLDOVA = "md"
const MADAGASCAR = "mg"
const MALDIVES = "mv"
const MEXICO = "mx"
const MARSHALL_ISLANDS = "mh"
const NORTH_MACEDONIA = "mk"
const MALI = "ml"
const MALTA = "mt"
const MYANMAR = "mm"
const MONTENEGRO = "me"
const MONGOLIA = "mn"
const MOZAMBIQUE = "mz"
const MAURITANIA = "mr"
const MAURITIUS = "mu"
const MALAWI = "mw"
const MALAYSIA = "my"
const NAMIBIA = "na"
const NIGER = "ne"
const NIGERIA = "ng"
const NICARAGUA = "ni"
const NETHERLANDS = "nl"
const NORWAY = "no"
const NEPAL = "np"
const NAURU = "nr"
const NEW_ZEALAND = "nz"
const OMAN = "om"
const PAKISTAN = "pk"
const PANAMA = "pa"
const PERU = "pe"
const PHILIPPINES = "ph"
const PALAU = "pw"
const PAPUA_NEW_GUINEA = "pg"
const POLAND = "pl"
const FRENCH_POLYNESIA = "pf"
const NORTH_KOREA = "kp"
const PORTUGAL = "pt"
const PARAGUAY = "py"
const QATAR = "qa"
const ROMANIA = "ro"
const RUSSIA = "ru"
const RWANDA = "rw"
const SAUDI_ARABIA = "sa"
const SUDAN = "sd"
const SENEGAL = "sn"
const SINGAPORE = "sg"
const SOLOMON_ISLANDS = "sb"
const SIERRA_LEONE = "sl"
const EL_SALVADOR = "sv"
const SAN_MARINO = "sm"
const SOMALIA = "so"
const SERBIA = "rs"
const SOUTH_SUDAN = "ss"
const SAO_TOME_AND_PRINCIPE = "st"
const SURINAME = "sr"
const SLOVAKIA = "sk"
const SLOVENIA = "si"
const SWEDEN = "se"
const ESWATINI = "sz"
const SEYCHELLES = "sc"
const SYRIA = "sy"
const CHAD = "td"
const TOGO = "tg"
const THAILAND = "th"
const TAJIKISTAN = "tj"
const TURKMENISTAN = "tm"
const TIMOR_LESTE = "tl"
const TONGA = "to"
const TRINIDAD_AND_TOBAGO = "tt"
const TUNISIA = "tn"
const TURKEY = "tr"
const TUVALU = "tv"
const TANZANIA = "tz"
const UGANDA = "ug"
const UKRAINE = "ua"
const URUGUAY = "uy"
const UNITED_STATES = "us"
const UZBEKISTAN = "uz"
const VATICAN_CITY = "va"
const SAINT_VINCENT_AND_THE_GRENADINES = "vc"
const VENEZUELA = "ve"
const VIETNAM = "vn"
const VANUATU = "vu"
const SAMOA = "ws"
const YEMEN = "ye"
const SOUTH_AFRICA = "za"
const ZAMBIA = "zm"
const ZIMBABWE = "zw"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "af",
                "ao",
                "al",
                "ad",
                "ae",
                "ar",
                "am",
                "ag",
                "au",
                "at",
                "az",
                "bi",
                "be",
                "bj",
                "bf",
                "bd",
                "bg",
                "bh",
                "bs",
                "ba",
                "by",
                "bz",
                "bo",
                "br",
                "bb",
                "bn",
                "bt",
                "bw",
                "cf",
                "ca",
                "ch",
                "cl",
                "cn",
                "ci",
                "cm",
                "cd",
                "cg",
                "co",
                "km",
                "cv",
                "cr",
                "cu",
                "cy",
                "cz",
                "de",
                "dj",
                "dm",
                "dk",
                "do",
                "dz",
                "ec",
                "eg",
                "er",
                "es",
                "ee",
                "et",
                "fi",
                "fj",
                "fr",
                "fm",
                "ga",
                "gb",
                "ge",
                "gh",
                "gn",
                "gm",
                "gw",
                "gq",
                "gr",
                "gd",
                "gt",
                "gy",
                "hn",
                "hr",
                "ht",
                "hu",
                "id",
                "in",
                "ie",
                "ir",
                "iq",
                "is",
                "il",
                "it",
                "jm",
                "jo",
                "jp",
                "kz",
                "ke",
                "kg",
                "kh",
                "ki",
                "kn",
                "kr",
                "kw",
                "la",
                "lb",
                "lr",
                "ly",
                "lc",
                "li",
                "lk",
                "ls",
                "lt",
                "lu",
                "lv",
                "ma",
                "mc",
                "md",
                "mg",
                "mv",
                "mx",
                "mh",
                "mk",
                "ml",
                "mt",
                "mm",
                "me",
                "mn",
                "mz",
                "mr",
                "mu",
                "mw",
                "my",
                "na",
                "ne",
                "ng",
                "ni",
                "nl",
                "no",
                "np",
                "nr",
                "nz",
                "om",
                "pk",
                "pa",
                "pe",
                "ph",
                "pw",
                "pg",
                "pl",
                "pf",
                "kp",
                "pt",
                "py",
                "qa",
                "ro",
                "ru",
                "rw",
                "sa",
                "sd",
                "sn",
                "sg",
                "sb",
                "sl",
                "sv",
                "sm",
                "so",
                "rs",
                "ss",
                "st",
                "sr",
                "sk",
                "si",
                "se",
                "sz",
                "sc",
                "sy",
                "td",
                "tg",
                "th",
                "tj",
                "tm",
                "tl",
                "to",
                "tt",
                "tn",
                "tr",
                "tv",
                "tz",
                "ug",
                "ua",
                "uy",
                "us",
                "uz",
                "va",
                "vc",
                "ve",
                "vn",
                "vu",
                "ws",
                "ye",
                "za",
                "zm",
                "zw",
            ]