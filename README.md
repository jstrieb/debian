# Debian

These scripts and configuration files will build a Debian ISO tailor-made for
me. In particular, the generated ISOs are configured to work on an Asus X205T
laptop.


# Building

To build a bootable ISO with all of my custom configurations that will work on
an Asus X205T, clone the repository and run `make`.

``` bash
git clone https://github.com/jstrieb/debian
cd debian
make
```

Alternatively, build the image in a GitHub Actions workflow by manually running
the workflow and connecting to the runner via `ssh` with the address that is
given. Then run `make` in the repository directory. Afterwards, `scp` the file
to your local machine.

On Windows, I load the ISO onto a USB drive with [Rufus](https://rufus.ie/en/).
When using Rufus, I have it load the data in "raw" mode, rather than having it
unpack the ISO. On Linux, `dd` is probably good enough, since this makes
[hybrid](https://www.debian.org/CD/live/) ISOs by default.


# History

I have an Asus X205T netbook. Since it requires a 32-bit bootloader despite
being a 64-bit processor, many Linux distributions (and other operating
systems) don't boot in their default configuration. This includes the versions
of Debian downloadable from the official site. It also includes OpenBSD, which
I spent a while trying (and failing) to set up.

Eventually, my complicated set of scripts to build a custom Debian ISO became
this. Using the included scripts and configuration, it is now possible to build
an ISO that works on my Asus X205T and comes fully loaded with everything I
want. This includes a suite of programs I use (and none I don't), and all of my
custom configurations and dotfiles.

Though it is likely too specific to me to be of immediate use to anyone, maybe
this repo will be helpful to someone, someday.

