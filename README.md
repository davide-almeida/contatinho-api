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

Em seguida execute o setup:
```bash
make setup
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

Monitorar o container da aplicação (attach)
```bash
make attach
```

## Variáveis de ambiente
Por questão de segurança os valores das variáveis de ambiente não estão neste repositório, sendo assim, vou informar apenas sem os valores para facilitar o entendimento, caso alguém queira baixar este repositório para teste/estudo terá que configurar as variáveis.
Para isso, é necessário primeiro remover o arquivo `config/credentials.yml.enc`. Em seguida, gerar o arquivo `config/master.key` com o comando `bin/rails credentials:edit` e logo após editar `config/credentials.yml.enc` com o comando `EDITOR='vim' rails credentials:edit`.

| Variável de Ambiente | Descrição |
|-|-|
| devise_jwt_secret_key | Token gerado pelo [jwt-devise](https://github.com/waiting-for-dev/devise-jwt) para controle dos tokens de autenticação |
| mail_user | Endereço de email utilizado no reenvio de senha do User |
| mail_password | Senha do email utilizado no reenvio de senha do User |
| google_maps_key | Utilizada para acessar o serviço do google maps. Pode ser gerada no [GCC](https://cloud.google.com/cloud-console?hl=pt-BR) |

## Modelagem do banco de dados
![image](https://github.com/user-attachments/assets/f4e4c4a5-dea5-4ffb-9635-22bd291589ba)
