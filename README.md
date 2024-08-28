# 📇 Contatinho-API

Esse projeto é uma API REST que utiliza o [Google Maps](https://developers.google.com/maps/documentation/javascript/examples/geocoding-simple#maps_geocoding_simple-typescript) e o [Via CEP](https://viacep.com.br/). Tem como propósito permitir cadastrar, editar e remover contatos em uma lista (como uma agenda). Além disso, cada contato cadastrado exibe a latitude e longitude com base nos dados informados.

Minha ideia é desenvolver o frontend posteriormente (com Vue) para consumir esta API e exibir a localização de cada contato em um mapa.

## Tecnologias
- Ruby 3.2.2
- Rails 7.2.1
- Postgres 16.4
- Docker

## Como executar o projeto

Altere o nome do arquivo `.env.example` para `.env`. Lembrando que você pode alterar as configurações do arquivo `.env` como preferir.

Em seguida execute o build:
```bash
make build
```

E por último execute o projeto:
```bash
make run
```

## Outros comandos

Acessar o bash do container da aplicação
```bash
make bash
```
