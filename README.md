# Niu Foods Challenge

## Introduccion

Este repositorio almacena el codigo que resuelve la problematica presentada en el desafio.

Un pequeño alcance es que posee pocos commits, el motivo es simple, se me apagó el computador y el historial de GIT se corrompió. El repositorio lo tenía almacenado solamente de manera local, entonces no pude corregirlo haciendo `git pull`, ni `git rebase`, ni nada por el estilo :(.

Es primera vez que me sucede, siempre que tengo un proyecto personal o desafío para alguna empresa, lo dejo en local hasta que ya está casi listo y ahí recién publico, pero desde ahora, como moraleja de este accidente, subiré a Github el repositorio apenas haga el `Initial commit`. Lo siento si esto significa algún inconveniente.

## Requisitos

[Ruby on Rails](https://gorails.com/setup/windows/11), [Node.js](https://nodejs.org/en), [Redis](https://redis.io/docs/latest/operate/oss_and_stack/install/install-redis/install-redis-on-linux/), [Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/install) (opcional si es que se quiere levantar desde Windows).

## Instrucciones

En primer lugar realizar `git clone` de este proyecto, luego de posicionarse en el directorio del proyecto (usando `cd niu_foods`), ejecutar `bundle` para instalar todas las dependencias especificadas en `Gemfile`, y posteriormente podemos ejecutar `bin/rails db:setup` para inicializar la base de datos y correr las seeds.

Este proyecto además hace uso de `Redis` como DB en memoria para acompañar al backend de `Sidekiq`, por lo que debe ser instalado antes de levantar el servidor.

Una vez teniendo todo lo necesario, podemos ejecutar `bin/dev` para levantar el servidor local.
