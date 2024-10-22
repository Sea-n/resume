#let secret_data = toml("secrets.toml")
#let secret(key) = {
    secret_data.at(key, default: "<REDACTED>")
}
