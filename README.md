# HashiTalks 2021


## Informações do evento

* Date: `02/17/2021`
* Time: `16:30 GMT / 13:00 h BRT`
* Register/ Agenda: [Link](https://hashi.co/hashitalks2021)
* Live stream: [Link](https://youtu.be/AjBj-M5WuyE)

## Conteúdo

* `cert`
  * TLS certificates used to connect to the Vault server

* `config`
  * `my-policy.hcl`
    * Vault policy used to configure `AppRole`
  * `vault.json`
    * Vault configuration used in the demo

* `demo-app`
  * Application used in the demo
  * Execution: `npm start`

* `docker`
  * `docker-compose.yaml`
  * Docker compose YAML file used to run Vault 1.6.0
  * `run-container.sh`
  * Script to run the container from the compose file

* `vault-unsealer.sh`
  * Commands used to open (_unseal_) the vault


## Artifacts

* `hashi-vault-js` helper library
  * Latest version: `0.4.0`
  * Documentation: [Link](https://www.npmjs.com/package/hashi-vault-js)
  * GitHub: [Link](https://github.com/rod4n4m1/hashi-vault-js)
  * Installation: `npm install hashi-vault-js --save`

* Servidor HashiCorp Vault
  * Docker image: `vault:1.6.2`
  * Location: [Link](https://hub.docker.com/_/vault)
