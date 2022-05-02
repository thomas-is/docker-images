# ng-php7

## TL;TR

Display `phpinfo()` on <http://localhost:8080>:
```sh
docker run -d --rm -p 8080:80 0lfi/ng-php8
```

Serve `/some/contents` on <http://localhost:8080>:
```sh
docker run -d --rm \
  -v /some/contents:/srv \
  -p 8080:80 \
  0lfi/ng-php8
```

## Environment variables

- `FPM_USER`
  - user `php-fpm` will run as
  - `nobody` (default)
  - can be set as `root` (**use at your own risk**)

- `LOG_FORMAT`
  - `main` (default)
  - `proxy` to display forwarded IP first in nginx logs

