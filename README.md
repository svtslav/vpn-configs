# Настройка OpenVPN-сервера

Приведены настройки сервера для операционной системы Debian.

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

## Полезные ссылки
1. https://www.digitalocean.com/community/tutorials/how-to-set-up-an-openvpn-server-on-debian-10
2. https://interface31.ru/tech_it/2019/10/nastroyka-dvuh-i-bolee-openvpn-serverov-na-odnom-servere.html
