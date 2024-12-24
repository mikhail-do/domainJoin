# domainJoin
Automate adding computers to a domain

## Requirements
- Domain service *Active Directory*
- *Login* and *Password* of the account that is used to add devices to the domain

## Installation
1. Download the repository
2. Place the folder with files in a hidden but accessible folder
3. Change the data in the ***example.config.json*** file (variable description below)
4. Rename the ***example.config.json*** file to ***config.json***

```
example.config.json:

    DOMAIN_NAME - domain name
    USER_NAME - account name that has rights to add to the domain
    USER_PASSWORD - password of the account that has rights to add to the domain
    DNS_ADDRESSES - account name that has rights to add to the domain
```

## Usage
1. On the computer that needs to be added to the domain, open the location of the folder with the downloaded files
2. Run the script ***JoinDomain.bat***
3. Follow the instructions



---
---
---



# domainJoin
Автоматизация добавления компьютеров в домен

## Требования
- Доменная служба *Active Directory*
- *Логин* и *Пароль* учётной записи, которая предназначена для добавления устройств в домен

## Устновка
1. Скачать репозиторий
2. Разместить папку с файлами в скрытой, но доступной папке
3. Изменить данные в файле ***example.config.json*** (описание переменных ниже)
4. Переименовать файл ***example.config.json*** в ***config.json***


```
example.config.json:

    DOMAIN_NAME - имя домена
    USER_NAME - имя учётной записи, которая имеет права добавления в домен
    USER_PASSWORD - пароль учётной записи, которая имеет права добавления в домен
    DNS_ADDRESSES - имя учётной записи, которая имеет права добавления в домен
```

## Использование
1. На компьютере, который нужно добавить в домен, открываем расположение папки со скачанными файлами
2. Запускаем скрипт ***JoinDomain.bat*** 
3. Следуем инструкциям
