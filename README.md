# Niu Foods Challenge

## Introduccion

Este repositorio almacena el codigo que resuelve la problematica presentada en el desafio.

Un pequeño alcance es que posee pocos commits, el motivo es simple, se me apagó el computador y el historial de GIT se corrompió. El repositorio lo tenía almacenado solamente de manera local, entonces no pude corregirlo haciendo `git pull`, ni `git rebase`, ni nada por el estilo :(.

Es primera vez que me sucede, siempre que tengo un proyecto personal o desafío para alguna empresa, lo dejo en local hasta que ya está casi listo y ahí recién publico, pero desde ahora, como moraleja de este accidente, subiré a Github el repositorio apenas haga el `Initial commit`. Lo siento si esto significa algún inconveniente.

## Requisitos

[Ruby on Rails](https://gorails.com/setup/windows/11), [Node.js](https://nodejs.org/en), [Redis](https://redis.io/docs/latest/operate/oss_and_stack/install/install-redis/install-redis-on-linux/), [Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/install) (opcional si es que se quiere levantar desde Windows), [PostgreSQL](https://www.postgresql.org/).

Si es que tienes [Docker](https://www.docker.com/products/docker-desktop/), el proceso es mucho mas sencillo, no deberas instalar nada de lo anterior, ya que todo se manejara a nivel de contenedor.

## Instrucciones

En primer lugar realizar `git clone` de este proyecto, luego de posicionarse en el directorio del proyecto (usando `cd niu_foods`), ejecutar `bundle` para instalar todas las dependencias especificadas en `Gemfile`, y posteriormente podemos ejecutar `bin/rails db:setup` para inicializar la base de datos y poblarla con seeds.

Este proyecto además hace uso de `Redis` como DB en memoria para acompañar al backend de `Sidekiq`, por lo que debe ser instalado antes de levantar el servidor.

Una vez teniendo todo lo necesario, podemos ejecutar `bin/dev` para levantar el servidor local.

Para levantar el proyecto sin Docker probablemente sera necesario retocar algunas configuraciones que usan variables de entorno, como `config/database.yml` por ejemplo.

## Docker

Si deseas usar Docker, posicionate en la raiz del proyecto, ejecuta `docker compose build`, luego `cp example.env .env` para copiar nuestras variables de entorno, luego `docker compose run --rm rails bash` para entrar en la consola del contenedor `rails`, ejecutamos `bundle` (esto deberia ser rapido considerando que se realiza bundle al momento de construir el Dockerfile), y finalmente `bin/rails db:setup`.
