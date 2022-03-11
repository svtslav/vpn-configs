# Настройка OpenVPN-сервера

Приведены настройки сервера для операционной системы Debian.

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
