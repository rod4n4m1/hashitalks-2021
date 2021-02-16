vault login $VAULT_ROOT_TOKEN

vault policy write my-policy my-policy.hcl

vault write auth/approle/role/my-role secret_id_ttl="720h"  token_ttl="12h"  token_max_tll="12h"  policies="my-policy"

vault read auth/approle/role/my-role/role-id

vault write -f auth/approle/role/my-role/secret-id
