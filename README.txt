Perl-Ogre version 0.24
======================

This is a Perl binding for OGRE, Object-Oriented Graphics Rendering Engine,
a C++ library found at http://www.ogre3d.org/ .

The wrapping is currently incomplete, but we're now able to run
OGRE's "Basic Tutorial" 3 and 5 in Perl (see examples/README.txt).

There is no documentation yet, which is no doubt frustrating.


DEPENDENCIES

Only version 1.4.3 (the current latest release as of late August) of OGRE
is currently supported (it's the version I have installed), so you need
to install that either by building from source or by installing
a package. If you use Ubuntu, I have some notes below that might help.

1.4.4 will probably work also, just I haven't tried it.

Makefile.PL uses pkg-config to get information about the libraries and header
files needed to build against OGRE, so you should be able to do this:

  pkg-config --libs OGRE
  pkg-config --cflags OGRE
  pkg-config --modversion OGRE

The last one should say at least 1.4.3.

The C++ compiler used by default is `g++`, but you can specify a different
C++ compiler by setting the CXX environmental variable. Anything more,
and you'll have to hack at Makefile.PL.

It would be a good idea to make sure you also have installed CEGUI, OIS,
libdevil, and nVidia Cg, if those aren't already installed. This Perl module
currently only provides support for OGRE and OIS, however; I might wrap
CEGUI some day, the goal being to run OGRE's samples and tutorials from
Perl. (The tutorials and documentation for OGRE are excellent.
I highly recommend going through them before trying this Perl wrapper.)
The reason I recommend installing those libraries, is mainly just so
you can run the (C++) tutorials.

If you want to run most of scripts under examples/ , you'll need to
install OIS ( http://search.cpan.org/ ). Note that there's apparently
an incompatibility between versions 0.99_rc1 (which I have installed)
and 1.0.0 of libois, in particular in xs/InputManager.xs you might
get two methods failing to work: s/numJoysticks/numJoySticks/
and s/numKeyBoards/numKeyboards/. I'll try to get that worked around
soon.


INSTALLATION

To install this module, do the usual:

   perl Makefile.PL
   make
   make test
   make install

You might have to edit Makefile.PL to get it to work for your system.
If so, please let me know.


INSTALLING OGRE UNDER UBUNTU

As of the time of writing this (Aug 20, 2007), the current release
of Ubuntu, Feisty Fawn, has a package for version 1.2.5 of OGRE,
whereas this Perl module require version 1.4.3. There are a couple of ways
to go about installing 1.4.3.

First of all, be sure to uninstall any previous version of Ogre that
you have installed. Otherwise, you might run into this problem:
http://www.ogre3d.org/phpBB2/viewtopic.php?t=30497&view=next&sid=ce193664e1d3d7c4af509e6f4e2718c6

After that's out of the way, you can do one of the following:

1) upgrade early to the next version of Ubuntu, Gutsy Gibbon,
which is not yet released officially. This version has a package for
version 1.4.3, and this is how I did it on my particular system.
(DISCLAIMER: I take no responsibility for your system if it breaks.
In fact, I wouldn't recommend this approach, as I've had some
instabilities in my system.) :

  -- upgrading from feisty to gutsy
  # cp /etc/apt/sources.list{,-feisty}
  # sed -ie 's/feisty/gutsy/g' /etc/apt/sources.list

  # apt-get update
  # apt-get dist-upgrade
  (this might take a few iterations, and there can be bugs;
   it will also take a very long time (1.5 hrs for me))

  -- installing ogre, et al
  # apt-get install libogre-dev libogre14
  # apt-get install nvidia-cg-toolkit 

  (you'll want these too, if they're not already installed)
  # apt-get install libcegui-mk2-doc libcegui-mk2-dev libcegui-mk2-1
  # apt-get install libois1 libois-dev
  # apt-get install libdevil-dev libdevil1c2

Note: these package names are as of when I installed them.
The names might change.

2) backport the package from Gutsy Gibbon to Feisty Fawn.
Good luck with that. (Let me know how it's done.)

3) create your own package by building from source. Check out:
http://www.ogre3d.org/wiki/index.php/FromSourceUbuntu
Again, good luck with that.


COPYRIGHT AND LICENCE

Please report any bugs/suggestions to <slanning@cpan.org>.

Copyright 2007, Scott Lanning. All rights reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

Beware that OGRE itself is under an LGPL license. See http://www.ogre3d.org/
for more (and probably more accurate) information.
