# dump-autoload
autoloading the dump from the server and then uploading it to the docker container

First start

`make init`

`make load`

after first start

`make load`

adding an alias for zsh to bash write `.bashrc`

```
echo "dump ()
{
   make load -C ${PWD}
}

dump-import ()
{
   make import -C ${PWD}
}

dump-add ()
{
   make add-project -C ${PWD}
}" >> ~/.zshrc


source ~/.zshrc
```

Теперь можно запускать в любом директории  с командой `dump`  и добавлять новые проекта командой `dump-add` или загружать `dump-import` локальные дампы.


Команды:

`make add`  - добавления проекта

`make import` - импорт локального дампа 

`make load` - загрузка дампа с сервера и последущая его загрузка в контейнер
