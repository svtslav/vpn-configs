# Настройка OpenVPN-сервера

## OpenVPN сервер для клиентов

Конфигурационный файл: [server.conf](openvpn/server.conf)

Сервер работает на 443 порту (HTTPS) по протоколу UDP

## OpenVPN сервер для роутеров MikroTik

Конфигурационный файл: [server-mikrotik.conf](openvpn/server-mikrotik.conf)

Сервер работает на 993 порту (IMAP) по протоколу TCP

## Генерация ключа и сертификата для сервера

```
sudo easyrsa build-server-full <server_name> nopass
```

## Запуск OpenVPN сервера

```
sudo systemctl start openvpn@server
```

```
sudo systemctl stop openvpn@server
```

```
sudo systemctl restart openvpn@server
```

