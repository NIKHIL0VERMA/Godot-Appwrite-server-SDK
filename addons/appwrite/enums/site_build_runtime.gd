## Enum: SITEBUILDRUNTIME

const NODE_14_5 = "node-14.5"
const NODE_16_0 = "node-16.0"
const NODE_18_0 = "node-18.0"
const NODE_19_0 = "node-19.0"
const NODE_20_0 = "node-20.0"
const NODE_21_0 = "node-21.0"
const NODE_22 = "node-22"
const NODE_23 = "node-23"
const NODE_24 = "node-24"
const NODE_25 = "node-25"
const PHP_8_0 = "php-8.0"
const PHP_8_1 = "php-8.1"
const PHP_8_2 = "php-8.2"
const PHP_8_3 = "php-8.3"
const PHP_8_4 = "php-8.4"
const RUBY_3_0 = "ruby-3.0"
const RUBY_3_1 = "ruby-3.1"
const RUBY_3_2 = "ruby-3.2"
const RUBY_3_3 = "ruby-3.3"
const RUBY_3_4 = "ruby-3.4"
const RUBY_4_0 = "ruby-4.0"
const PYTHON_3_8 = "python-3.8"
const PYTHON_3_9 = "python-3.9"
const PYTHON_3_10 = "python-3.10"
const PYTHON_3_11 = "python-3.11"
const PYTHON_3_12 = "python-3.12"
const PYTHON_3_13 = "python-3.13"
const PYTHON_3_14 = "python-3.14"
const PYTHON_ML_3_11 = "python-ml-3.11"
const PYTHON_ML_3_12 = "python-ml-3.12"
const PYTHON_ML_3_13 = "python-ml-3.13"
const DENO_1_21 = "deno-1.21"
const DENO_1_24 = "deno-1.24"
const DENO_1_35 = "deno-1.35"
const DENO_1_40 = "deno-1.40"
const DENO_1_46 = "deno-1.46"
const DENO_2_0 = "deno-2.0"
const DENO_2_5 = "deno-2.5"
const DENO_2_6 = "deno-2.6"
const DART_2_15 = "dart-2.15"
const DART_2_16 = "dart-2.16"
const DART_2_17 = "dart-2.17"
const DART_2_18 = "dart-2.18"
const DART_2_19 = "dart-2.19"
const DART_3_0 = "dart-3.0"
const DART_3_1 = "dart-3.1"
const DART_3_3 = "dart-3.3"
const DART_3_5 = "dart-3.5"
const DART_3_8 = "dart-3.8"
const DART_3_9 = "dart-3.9"
const DART_3_10 = "dart-3.10"
const DART_3_11 = "dart-3.11"
const DART_3_12 = "dart-3.12"
const DOTNET_6_0 = "dotnet-6.0"
const DOTNET_7_0 = "dotnet-7.0"
const DOTNET_8_0 = "dotnet-8.0"
const DOTNET_10 = "dotnet-10"
const JAVA_8_0 = "java-8.0"
const JAVA_11_0 = "java-11.0"
const JAVA_17_0 = "java-17.0"
const JAVA_18_0 = "java-18.0"
const JAVA_21_0 = "java-21.0"
const JAVA_22 = "java-22"
const JAVA_25 = "java-25"
const SWIFT_5_5 = "swift-5.5"
const SWIFT_5_8 = "swift-5.8"
const SWIFT_5_9 = "swift-5.9"
const SWIFT_5_10 = "swift-5.10"
const SWIFT_6_2 = "swift-6.2"
const KOTLIN_1_6 = "kotlin-1.6"
const KOTLIN_1_8 = "kotlin-1.8"
const KOTLIN_1_9 = "kotlin-1.9"
const KOTLIN_2_0 = "kotlin-2.0"
const KOTLIN_2_3 = "kotlin-2.3"
const CPP_17 = "cpp-17"
const CPP_20 = "cpp-20"
const BUN_1_0 = "bun-1.0"
const BUN_1_1 = "bun-1.1"
const BUN_1_2 = "bun-1.2"
const BUN_1_3 = "bun-1.3"
const GO_1_23 = "go-1.23"
const GO_1_24 = "go-1.24"
const GO_1_25 = "go-1.25"
const GO_1_26 = "go-1.26"
const RUST_1_83 = "rust-1.83"
const STATIC_1 = "static-1"
const FLUTTER_3_24 = "flutter-3.24"
const FLUTTER_3_27 = "flutter-3.27"
const FLUTTER_3_29 = "flutter-3.29"
const FLUTTER_3_32 = "flutter-3.32"
const FLUTTER_3_35 = "flutter-3.35"
const FLUTTER_3_38 = "flutter-3.38"
const FLUTTER_3_41 = "flutter-3.41"
const FLUTTER_3_44 = "flutter-3.44"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "node-14.5",
                "node-16.0",
                "node-18.0",
                "node-19.0",
                "node-20.0",
                "node-21.0",
                "node-22",
                "node-23",
                "node-24",
                "node-25",
                "php-8.0",
                "php-8.1",
                "php-8.2",
                "php-8.3",
                "php-8.4",
                "ruby-3.0",
                "ruby-3.1",
                "ruby-3.2",
                "ruby-3.3",
                "ruby-3.4",
                "ruby-4.0",
                "python-3.8",
                "python-3.9",
                "python-3.10",
                "python-3.11",
                "python-3.12",
                "python-3.13",
                "python-3.14",
                "python-ml-3.11",
                "python-ml-3.12",
                "python-ml-3.13",
                "deno-1.21",
                "deno-1.24",
                "deno-1.35",
                "deno-1.40",
                "deno-1.46",
                "deno-2.0",
                "deno-2.5",
                "deno-2.6",
                "dart-2.15",
                "dart-2.16",
                "dart-2.17",
                "dart-2.18",
                "dart-2.19",
                "dart-3.0",
                "dart-3.1",
                "dart-3.3",
                "dart-3.5",
                "dart-3.8",
                "dart-3.9",
                "dart-3.10",
                "dart-3.11",
                "dart-3.12",
                "dotnet-6.0",
                "dotnet-7.0",
                "dotnet-8.0",
                "dotnet-10",
                "java-8.0",
                "java-11.0",
                "java-17.0",
                "java-18.0",
                "java-21.0",
                "java-22",
                "java-25",
                "swift-5.5",
                "swift-5.8",
                "swift-5.9",
                "swift-5.10",
                "swift-6.2",
                "kotlin-1.6",
                "kotlin-1.8",
                "kotlin-1.9",
                "kotlin-2.0",
                "kotlin-2.3",
                "cpp-17",
                "cpp-20",
                "bun-1.0",
                "bun-1.1",
                "bun-1.2",
                "bun-1.3",
                "go-1.23",
                "go-1.24",
                "go-1.25",
                "go-1.26",
                "rust-1.83",
                "static-1",
                "flutter-3.24",
                "flutter-3.27",
                "flutter-3.29",
                "flutter-3.32",
                "flutter-3.35",
                "flutter-3.38",
                "flutter-3.41",
                "flutter-3.44",
            ]