path "my-role/*" {
  capabilities = ["create","read","update","delete","list"]
}

path "my-role/data/*" {
  capabilities = ["create","read","update","delete"]
}

path "my-role/delete/*" {
  capabilities = ["update"]
}

path "my-role/undelete/*" {
    capabilities = ["update"]
}

path "my-role/destroy/*" {
    capabilities = ["update"]
}

path "my-role/metadata/*" {
    capabilities = ["delete","list","read"]
}

path "/auth/approle/role/my-role" {
capabilities = ["update"]
  allowed_parameters = {
        "token_ttl" = []
  }
}

path "/auth/approle/role/my-role/secret-id" {
    capabilities = ["create", "read", "update", "delete", "list"]
}

path "/auth/approle/role/my-role/secret-id/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}

path "/auth/approle/role/my-role/secret-id-accessor" {
    capabilities = ["create", "read", "update", "delete", "list"]
}

path "/auth/approle/role/my-role/secret-id-accessor/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}

path "secret*" {
  capabilities = [ "create", "read", "update", "delete", "list" ]
}
