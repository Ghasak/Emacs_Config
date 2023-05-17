# Setting up Emacs daemon on OS X

Tired of waiting for emacs to start on OS X? This step by step guide will
teach you how to install the latest version of emacs and configure it to start
in the background (daemon mode) and use `emacsclient` as your main editor.

## Install Homebrew

First you'll need to install the [Homebrew package manager][brew] if yo
haven't already. It is amazing.

[brew]: http://orestis.gr/blog/2009/09/04/homebrew-new-mac-os-x-package-manager/

## Install Cocoa Emacs

    brew install emacs --cocoa
    open $(brew --prefix)/Cellar/emacs/HEAD/

Drag the Emacs Application to your Applications folder

## Create the daemon application

Open the AppleScript editor and paste the following:

>     tell application "Terminal"
>     do shell script "/Applications/Emacs.app/Contents/MacOS/Emacs --daemon"
>     endtell

Save this as an Application called "Emacs Daemon" in your Applications folder

### Add as a login item

Goto `System Preferences > Accounts`

* With your user name selected, click on the `Login Items` tab
* Click on the plus sign
* Browse to your applications folder and find "Emacs Daemon"
* Don't worry about the "hide" checkbox, since it the dock icon disappears
  naturally

## Create the client application

Open the AppleScript editor and paste the following:

>     tell application "Terminal"
>     do shell script "/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c"
>     endtell

Save this as an Application called "Emacs Client" in your Applications folder.

### Giving the client application a proper icon

Using the Finder, navigate to your Application folder and right click on your
Emacs application (not the client or daemon), and click on `Show Package
Contents` Do the same for the Emacs Client application

Copy the `Emacs.icns` file from `Contents/Resources` of the Emacs application to
the `Contents/Resources` of the Emacs Client application Delete `applet.icns`
and rename `Emacs.icns` to `applet.icns` in the Emacs Client application.

### Hiding the dock icon for Emacs while Emacs Client is running

* Again, navigate to your Application folder and right click on your Emacs
  application (not the client or daemon), and click on `Show Package Contents`
* Open the `Info.plist` using the Propertly List Editor
* Click `Add Child`
* Set the key `NSUIElement`
* Set the value to `1`


## Reference
- [How to start Emacs Daemon Server in macOS](https://gist.githubusercontent.com/redinger/1394910/raw/c0dc6877c158a13760212dbe10b4abb32ae3c4f8/Emacs.md)
