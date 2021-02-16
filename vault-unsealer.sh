#!/bin/bash
source process-vault.env

vault operator unseal $VAULT_UNSEAL_KEY1
vault operator unseal $VAULT_UNSEAL_KEY3
vault operator unseal $VAULT_UNSEAL_KEY6
