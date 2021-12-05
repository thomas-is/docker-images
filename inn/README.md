# INN

Early experimental INN-2.6 image.

## TL;TR

Use `test.sh` to build and pop a shell into a `dev-inn` image.

## Testing

A valid hostname is required to perform `make install`. Therefore `hostname`
**must** be set at runtime (`--hostname`) and `make install` is performed at
entrypoint (which is really ugly - but it works).

```bash
./test.sh innd -f
```
once `innd` is running
```bash
telnet localhost 119
```
will answer a 502
```
502 You have no permission to talk.  Goodbye!
```
