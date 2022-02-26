# Дневник программиста

Мой собственный проект, предназначен для записи опыта работы (полезный ссылки, наблюдения, исправления ошибок и т.п.)

## Что под "капотом"

* Ruby 3.0.3
* Rails 7
* Для сбори assets использовал esbuild.
* Bootstrap
* как всегда PostgreSQL для БД

## Для запуска

нужны yarn, node.
Выполняем команды:
bundle, rails css:install:bootstrap, yarn build:css, yarn build.
Cтолкнулся с проблемой старой версии node.js, при обновлении которого мне было сказано что у меня установлено самая новейшая версия. Решение нашел через 
[install node js](https://losst.ru/ustanovka-node-js-ubuntu-18-04)

