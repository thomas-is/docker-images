# SAK - Swiss Army Knife

## TL;TR

```
docker run --rm -it \
  --network some_attachable_network \
  -v ~/.ssh:/root/.ssh:ro \    # if needed
  -v $(pwd):/host \            # if needed
  0lfi/sak
```

This image is meant to be used **interactively**, its default `CMD` is a login
shell (`sh -l`).

