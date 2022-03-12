# Настройка OpenVPN-сервера

Приведены настройки сервера для операционной системы Debian.

## Установка easyrsa

## Генерация ключа dh.pem Диффи Хельмана

Генерация ключа может занять несколько минут. 

## Генерация сертификата и приватного ключа сервера

Команда для генерации самоподписанного сертификата и ключа сервера

```
build-server-full server nopass
```

В данном примере `server` имя будущего сервера OpenVPN.

Перенос ключа и сертификата сервера на один уровень с файлом конфигурации

Файл [_server.conf](openvpn/_server.conf) содержит стандартные настройки сервера OpenVPN из документации `/usr/share/doc/openvpn/examples/sample-config-files/server.conf.gz`.

## OpenVPN сервер для клиентов

Конфигурационный файл: [server.conf](openvpn/server.conf)

Сервер работает на 443 порту (HTTPS) по протоколу UDP.

### Запуск, перезагрузка, остановка и просмотр статуса сервера

Запуск OpenVPN сервера:
```
sudo systemctl start openvpn@server
```

Остановка OpenVPN сервера:
```
sudo systemctl stop openvpn@server
```

Перезапуск OpenVPN сервера:
```
sudo systemctl restart openvpn@server
```

Просмотр статуса OpenVPN сервера:
```
sudo systemctl status openvpn@server
```
Для выхода необходимо набрать `:q`.

## OpenVPN сервер для роутеров MikroTik

Конфигурационный файл: [server-mikrotik.conf](openvpn/server-mikrotik.conf)

Сервер работает на 993 порту (IMAP) по протоколу TCP.

### Запуск, перезагрузка, остановка и просмотр статуса сервера

Запуск OpenVPN сервера:
```
sudo systemctl start openvpn@server-mikrotik
```

Остановка OpenVPN сервера:
```
sudo systemctl stop openvpn@server-mikrotik
```

Перезапуск OpenVPN сервера:
```
sudo systemctl restart openvpn@server-mikrotik
```

Просмотр статуса OpenVPN сервера:
```
sudo systemctl status openvpn@server-mikrotik
```
Для выхода необходимо набрать `:q`.

## Генерация ключа и сертификата для сервера

```
sudo easyrsa build-server-full <server_name> nopass
```

## Создание клиентов OpenVPN

Для создания клиентов написан bash-скрипт [make-client.sh](openvpn/make-client.sh).

```
cd /etc/openvpn
sudo ./make-client.sh <client_name> [mikrotik]
```

Скрипт `make-client.sh` создадёт директорию для каждого клиента `/etc/openvpn/clients/<client_name>/` и размещает в ней:
1. Сертификат клиента `<client_name>.crt`.
2. Приватный ключ клиента `<client_name>.key`.
3. Сертификат центра сертификации `ca.crt`.
4. Файл для подключения к OpenVPN серверу `<client_name>.ovpn`.

В скрипте предусмотрен флаг `mikrotik` для создания конфигурационного файла клиента OpenVPN для роутеров MikroTik.

По умолчанию скрипт создаст обычный файл конфигурации.

Файл [_client.conf](openvpn/_client.conf) – шаблон обычного конфигурационного файла клиента OpenVPN.

Файл [_mikrotik.conf](openvpn/_mikrotik_.conf) – шаблон конфигурационного файла клиента OpenVPN для роутеров MikroTik.

## Полезные ссылки
1. https://www.digitalocean.com/community/tutorials/how-to-set-up-an-openvpn-server-on-debian-10
2. https://interface31.ru/tech_it/2019/10/nastroyka-dvuh-i-bolee-openvpn-serverov-na-odnom-servere.html
