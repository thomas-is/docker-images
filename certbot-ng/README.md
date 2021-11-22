# certbot-ng

## TL;TR

```
docker run --rm -it \
  -v /etc/letsencrypt:/etc/letsencrypt
  -p 80:80 \
  certbot-ng \
  certbot certonly --nginx -d mydomain.org
```

## Integration

I usually have other instances of `nginx` which route everything on my
cluster. For each domains, the `/.well-known/acme-challenge` is simply routed on
a certbot-ng instance with a bind mounted `/etc/letsencrypt`.

