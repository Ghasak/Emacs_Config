# Remote Connection in EMACS

Essentially, there are two ways to connect to remote servers:

1. A `Tramp Mode` for connecting the Emacs session to the
   remote server. TRAMP (Transparent Remote Access, Multiple Protocols) is a
   package for editing remote files, similar to AngeFtp or efs.

2. Using the `sshfs` utility, which extends the connection by specifying a
   directory on your local that will share remote files, allowing you to edit
   and modify them..

## SSHFS Utilities:

This is a filesystem client based on the SSH File Transfer Protocol. Since most
SSH servers already support this protocol it is very easy to set up: i.e. on the
server side there's nothing to do. On the client side mounting the filesystem is
as easy as logging into the server with ssh.

## How To Use SSHFS on macOS

WRITTEN BY PETER GIRNUS

- Using sshfs is a great way to mount a remote drive from AWS, Azure, or any
  remote machine to your local mac. Installing sshfs is a relatively
  straightforward process.

### Prerequisites & Installation

- Be sure that you can SSH to your target machine using SSH keys. If you’re
  remote machine is a Windows machine you may need to setup SSH.

- Download and Install the OSXFuse and SSHFS packages as admin.

Create a local folder to access your remote filesystem.

```sh
mkdir /tmp/sshfs
```

### Mount Filesystem

- Example usage of sshfs.

```sh
sshfs username@remote:/remote/directory /mount/point
```

### Unmount Filesystem

- If you cant eject the drive in finder can force the unmount.

```sh
diskutil umount force /mount/point
```

### Debugging Connection Issues

- Sometimes you may want a more verbose output when trying to mount a drive with
  sshfs. This can help you diagnose connection-related issues etc.

```sh
sshfs -odebug,sshfs_debug,loglevel=debug username@remote:/remote/directory /mount/point
```

### Want to learn how to use SSHFS on Windows?

If you’d like to comprehensive tutorial on how to setup SSHFS on Windows you can
follow this tutorial in which I go through the downloading and installation of
SSHFS on Windows.

## REFERENCES

- [TrampMode in Emacs](https://www.emacswiki.org/emacs/TrampMode#toc14)
- [remote files with emacs and ssh](https://stackoverflow.com/questions/20624024/what-is-the-best-way-to-open-remote-files-with-emacs-and-ssh)
- [osxfuse](https://github.com/osxfuse)
- [sshfs from osxfuse](https://github.com/osxfuse/sshfs)
- [How to use ssfs on macOS](https://www.petergirnus.com/blog/how-to-use-sshfs-on-macos)
