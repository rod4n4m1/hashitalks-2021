vault login $VAULT_ROOT_TOKEN

# Enable AppRole auth method for the app
vault auth enable approle

# Enable KV v2 secret engine for the app
vault secrets enable kv-v2

vault policy write my-policy my-policy.hcl

vault write auth/approle/role/my-role secret_id_ttl="720h"  token_ttl="12h"  token_max_tll="12h"  policies="my-policy"

vault read auth/approle/role/my-role/role-id

vault write -f auth/approle/role/my-role/secret-id
