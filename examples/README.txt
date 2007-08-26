This directory contains examples of using the Perl bindings
for OGRE. To run the examples, you need to have two config files
in the current directory: plugins.cfg and resources.cfg.
plugins.cfg might be a pointer to a system-wide file;
for example, on Ubuntu you should `ln -s /etc/OGRE/plugins.cfg`.
resources.cfg is just taken from the Samples directory in OGRE,
but I put it here also. For resources.cfg, you also need to copy
all the Samples/Media/ directory from OGRE 1.4.3 into ogrenew-1.4.3/
in this directory (look in resources.cfg, you can change the names
if you want).

So far, there's only one example:
- robot.pl: very minimal, just shows a robot that's been rotated
  and scaled a bit (taken from one of the basic OGRE tutorials;
  if you're not familiar with the tutorials, probably should do
  them before trying this)
