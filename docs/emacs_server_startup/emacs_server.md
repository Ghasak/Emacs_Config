# Server with Emacs
In the following documentations we will explain the exact behavior for the `server` in emacs.


## Emacs Server Concept

1. Run first emacs `server` `daemon` in a given name

```shell
emacs --daemon=ghasak_server_1
```
This will create a `server` with a name `ghasak_server_1` which is located on
my `macOS` at `/var/folders/3j/p9vdk4jd065g5y416bvbj4fh0000gn/T//emacs501/`


2. Check that you are running this server in background using


```shell
pgrep -u "$USER" -x Emacs-arm64-11 --bg-daemon
```


3. Use the `emacsclient` to fire a client for your emacs which can run using the socket you created above

```shell
emacsclient -c -n -q --socket-name=ghasak_server_1
```
