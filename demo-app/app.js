// Use strict mode
"use strict";
// I can do this programmatically, but I'm lazy ;-)
const RoleId = process.env.APPROLE_ROLE_ID;
const SecretId = process.env.APPROLE_SECRET_ID;

const Vault = require('hashi-vault-js');
const fs = require('fs');

const vault = new Vault( {
    https: true,
    cert: './certs/client.crt',
    key: './certs/client.key',
    cacert: './certs/ca.crt',
    baseUrl: 'https://127.0.0.1:8200/v1',
    rootPath: 'secrets',
    timeout: 2000,
    proxy: false
});

let apiToken = "";
let secrets = "";

try {
  secrets = JSON.parse(fs.readFileSync('./secrets.json', 'utf-8'));
  console.log('Secrets have been read from file!');
} catch(fsError) {
  console.error('FS Error: ',fsError);
}

vault.healthCheck().then((status) => {

  if (!status.sealed) {
    console.log('Vault status: ', status);

    vault.loginWithAppRole(RoleId, SecretId).then((data) => {
      apiToken = data.client_token;
      console.log('API Token: ', apiToken);

      secrets.forEach((secret) => {
        // console.log(secret);
        vault.createKVSecret(apiToken, secret.label, secret.pairs).then(() => {

          vault.listKVSecrets(apiToken).then((data) => {
            console.log('Stored keys: ',data);
          });

          vault.readKVSecret(apiToken,secret.label).then((data) => {
            console.log('KVs for '+secret.label+': ',data);
          });

        }).catch((createError) => {
          console.error('KV creation error: ', createError);
        });
      });

    }).catch((loginError) => {
      console.error('Login error: \n',loginError);
    });

  }

}).catch((healthError) => {
  console.error('Health Check error: \n',healthError);
});
