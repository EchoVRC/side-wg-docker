# WireGuard Docker Container

Переменные окружения:

- `PORT` — Порт (по умолчанию: 51820)
- `SERVER_PRIVATE_KEY` — Приватный ключ сервера (обязательно)
- `ADDRESS` — Адрес сервера (по умолчанию: 169.254.0.1/24)
- `CLIENT_PUBLIC_KEY` — Публичный ключ клиента (обязательно)
- `CLIENT_SHARED_KEY` — Шаред ключ клиента (опционально)
- `CLIENT_ALLOWED_IP` — Разрешенный IP (по умолчанию: 169.254.0.2/32)
- `MTU` — MTU (по умолчанию: 1420)
- `PERSISTENT_KEEPALIVE` — Keepalive (по умолчанию: 10)

Пример:

```bash
docker run -e SERVER_PRIVATE_KEY="ваш_ключ" -e CLIENT_PUBLIC_KEY="ключ_клиента" имя_контейнера
```

!!! НЕ ПРЕДОСТАВЛЯЕТ MASQUERADE ТРАФИКА !!! 
!!! ЭТО SIDE КОНТЕЙНЕР !!!