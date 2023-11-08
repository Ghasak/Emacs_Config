# Server with Emacs

In the following documentations we will explain the exact behavior for the
`server` in emacs.

## Emacs Server Concept

1. Run first emacs `server` `daemon` in a given name

```sh
emacs --daemon=ghasak_server_1
```

This will create a `server` with a name `ghasak_server_1` which is located on
my `macOS` at `/var/folders/3j/p9vdk4jd065g5y416bvbj4fh0000gn/T//emacs501/`

2. Check that you are running this server in background using

```sh
pgrep -u "$USER" -x Emacs-arm64-11 --bg-daemon
```

3. Use the `emacsclient` to fire a client for your emacs which can run using the socket you created above

```sh
emacsclient -c -n -q --socket-name=ghasak_server_1
```

## Startup with Emacs

I got configured `Spacemacs` to handle if there is no server running, then run
one (called server) the socket is located of course at same directory (for macOS
ARM 64) I use

```shell
/var/folders/3j/p9vdk4jd065g5y416bvbj4fh0000gn/T/emacs501
```

with a name `server`.

- To check if the server is running you can run

1. If you use the version of `Emacs.app` from `brew install --cask emacs-mac-spacemacs-icon` it called (Emacs Mac Port version) from
   [here](https://github.com/railwaycat/homebrew-emacsmacport).

```shell
pgrep -u "$USER" -x Emacs
```

2. If you use the version of `Emacs.app` from `brew install --cask emacs`

```shell
pgrep -u "$USER" -x Emacs-arm64-11 --bg-daemon
```

## How to know the socket location

In my `Emacs Mac Port` version the name of the running processor is `Emacs` so
I use (read
[here](https://stackoverflow.com/questions/23148787/why-emacsclient-cant-find-socket-after-executing-emacs-daemon))

```shell
╭─ gmbp   GMacBookPro on ~/Desktop/devCode   
├─ﮧ INSERT 
╰─ socket_file=$(lsof -c Emacs | grep server | tr -s " " | cut -d' ' -f8) && echo $socket_file
/var/folders/3jjj/p9vdk45y416bvbj4fh0gn/T/emacs501/server
```

## Stop Server

If you want to turn-off the emacs sever, you have several options. I use
`fkill` command to locate the `server` such as (for the emacs mac-port
version). For example the server is running under the process ID `8610` and can
be shown as

```shell
ps -aux | grep Emacs
 501  8610  7873   0  5:13PM ttys000    1:41.40 /Applications/Emacs.app/Contents/MacOS/Emacs .

```

you can also read:
[here](https://www.emacswiki.org/emacs/EmacsAsDaemon#:~:text=EmacsMsWindowsIntegration%20for%20details.-,Stopping%20the%20Emacs%20Daemon,the%20associated%20emacs%20server%20instance.)

```shell
emacsclient -e '(kill-emacs)'
```

- Or using

```shell
kill -9 $(ps aux | grep Emacs | grep -v grep | awk '{print $2}')
```
