# How I run Emacs in Client/Server Mode Under MacOS

Many articles are available about running Emacs in client/server mode. However,
when I tried to do it in my particular environment (macOS 11.0.1 Big Sur, using
zsh), some tweaks were still needed. So I figured that it’s probably useful to
document my setup.

In macOS, the Emacs executable is `/Applications/Emacs.app/Contents/MacOS/Emacs`.
To run Emacs in its regular (non-server) operation mode, I defined two shell
commands in .zshrc: emacs runs Emacs in GUI mode in a macOS window, whereas
emacsnw runs Emacs in text mode within the terminal. I started by defining emacs
as an alias similar to emacsnw, but the problem was that it’s easy to forget the
& to put it running in the background, so I had to rewrite it as a function.

```bash
function emacs() { /Applications/Emacs.app/Contents/MacOS/Emacs $@ &; }
alias emacsnw="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
```
- I used to use emacsnw exclusively, because I thought that managing an addition
macOS window was a hassle. However, I eventually decided to switch to the GUI
mode because I liked how org-mode documents are rendered in GUI mode. The
problem with the emacs shell command, though, was that if I use it to open a
second document, a new instance of Emacs would be launched. What I wanted was
for the running Emacs to open a new buffer. This was when I realized that I
should investigate the client/server mode.

To start the Emacs server, it is possible to ask macOS to launch the Emacs
daemon automatically when the user logs in (see here). However, I never found
this to be useful. Instead, I decided to use the Emacs client to start the
server, if it cannot detect a running Emacs. It should be simple enough to
implement, but the Emacs client
(`/Applications/Emacs.app/Contents/MacOS/bin/emacsclient`) seems to have problems
locating the server from time to time. So I use a shell script emacsserver to
locate the socket associated with Emacs:

`lsof -c Emacs | grep server | tr -s " " | cut -d' ' -f8 ` The unix command lsof
lists all the files opened by a process. If Emacs server is already running,
this script returns the socket file. Otherwise, it returns nothing. I put this
script in ~/bin.

The next step is easy. I use a shell script called ec (which stands for emacs
client) to evoke Emacs. If ec detects a socket file (meaning that the server is
running), it tells the server to open a new file. Otherwise, it launches Emacs
and starts the server:

```bash
#!/bin/zsh
socket_file=$(~/bin/emacsserver)
emacs=/Applications/Emacs.app/Contents/MacOS/Emacs
emacsclient=/Applications/Emacs.app/Contents/MacOS/bin/emacsclient

if [[ $socket_file == "" ]]; then
echo "starting Emacs server..."
$emacs --chdir $PWD --execute "(server-start)" $@ &
else
$emacsclient -n $@ --socket-name $socket_file
fi
```
- Another associated issue was that I wanted to tell git to use Emacs rather
  than vi. For this purpose, I don’t need the server so I just added the
  following to .zshenv:

```bash
export VISUAL="/Applications/Emacs/Contents/MacOS/Emacs -nw"
export EDITOR="/Applications/Emacs/Contents/MacOS/Emacs -nw"
```

## REFERENCES
- [emacs_clientserver](https://www.hhyu.org/posts/emacs_clientserver/)
