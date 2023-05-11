# Emacs Startup - Configurations

Starting with the `Emacs` to make it runs faster I use the following
Configurations. I install `Emacs` using `Homebrew`. Current version is

```shell
command emacs --version
GNU Emacs 28.2 Copyright (C)
2022 Free Software Foundation, Inc. GNU Emacs comes with ABSOLUTELY NO
WARRANTY. You may redistribute copies of GNU Emacs under the terms of the GNU
General Public License. For more information about these matters, see the file
named COPYING.
```

## Startupt Script for Daemon
In this module I will use the `AppleScript` to startup a `Daemon` on startup
and it will work on background.

- Create at home directory `~/myAppleScripts` and use `AppleScript` app with
  the following code

```AppleScript
try
	tell application "Terminal"
		do shell script
"/opt/homebrew/bin/emacs --daemon"
	end tell
	display notification "Emacs
daemon started successfully at startup." with title "Startup script"
on error
errMsg
	display dialog "An error occurred Emacs is not running ...: " &
errMsg
end try
```

- Export the code above using `Export` button as an `Apple` application. Name
  the application as `Emacs Daemon`.
- Go to `Setting` in `macOS` and under `login items` add the application to the
  startup `Emacs Daemon`.

- Now, you can either restart or just logout then login to get the `Daemon Emacs` working in background.
- You can check if its working by running


```shell
ps aux | grep Emacs
## or
pgrep -u "$USER" -x Emacs-arm64-11 --bg-daemon

```
The process of the silent `Daemon Emacs` for my machine is labeled as

```shell
gmbp  61548   0.0  1.0 xxxxxxx xxxxxxx   ??  Ss    6:40PM   0:30.07 /Applications/Emacs.app/Contents/MacOS/Emacs-arm64-11 --bg-daemon=
```


## Script to startup Emacs Daemon
Beside of the `AppleScript` above, I also have added a script to start the
`Emacs Daemon` in terminal using `bash-scripting` with a name `gmacs`. The
script here works for the `macOS` `arm64-11`. you can just change this later
for `Intel` base CPU.


```bash
#!/usr/bin/env bash

# check if emacs daemon is already running
# Tested under the macOS arm64-11
if pgrep -u "$USER" -x Emacs-arm64-11 --bg-daemon > /dev/null; then
    # emacs daemon is already running, launch instance in given directory
    if [ -z "$1" ]; then
        # no file specified, open empty instance
        emacsclient -c . &
    else
        # file specified, open instance with file
        emacsclient -c "$1" &
    fi
else
    # emacs daemon is not running, start it and launch instance
    if [ -z "$1" ]; then
        # no file specified, open empty instance
        /opt/homebrew/bin/emacs --daemon && emacsclient -c . &
    else
        # file specified, open instance with file
        /opt/homebrew/bin/emacs --daemon && emacsclient -c . "$1" &
    fi
fi
```

## Create also Alias
The `alias` here is attached to `~/.aliases` file that will allow me to run
`Emacs` instance using the `Emacs` keyword. If you want to run the original
`Emacs` application by skipping the `alias` you can use `command emacs` or
`/opt/homebrew/bin/emacs`.

```bash

#####################################################################
#                   Emacs client Startup
#####################################################################
# Starting server using: emacs --daemon
# -c for open a new window
# -a alternative, if no client is opened alerady reterive to pure emacs
#alias emacs="emacsclient -c -a 'emacs' &"


function emacs(){
  if [ ! "$#" -gt 0 ]; then
        emacsclient -c -a 'emacs' &
        return 1;
    else
        emacsclient -c -a 'emacs' $1 &
        return 0;
  fi
    }
```
## Configurations for SpaceEmacs

This will allow you to restart the `Emacs` session using the keybinding
`<leader>qr` without closing the server. You will need:
- `dotspacemacs-enable-server t` and also `dotspacemacs-presistent-server t`

```emacs-lisp
   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
```
