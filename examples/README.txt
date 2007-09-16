This directory contains examples of using the Perl bindings
for OGRE. To run the examples, you need to have two config files
in the current directory: plugins.cfg and resources.cfg.
plugins.cfg might be a pointer to a system-wide file;
for example, on Ubuntu you should `ln -s /etc/OGRE/plugins.cfg`.
resources.cfg is just taken from the Samples directory in OGRE,
but I put it here also. For resources.cfg, you also need to copy
all the Samples/Media/ directory from OGRE 1.4.3 into ogrenew-1.4.3/
in this directory (look in resources.cfg, you can change the names
if you want):

  mkdir -p ogrenew-1.4.3/Samples/Media
  cp -r /tmp/ogrenew-1.4.3/Samples/Media/* ogrenew-1.4.3/Samples/Media/

(That's like 26MB, so I can't distribute it on CPAN. :)

Here are brief descriptions of the examples.

- robot.pl: very minimal, just shows a robot that's been rotated
  and scaled a bit (taken from one of the basic OGRE tutorials;
  if you're not familiar with the tutorials, probably should do
  them before trying this)

- ninja.pl: another minimal demo, this time using OIS to handle input
  (just exiting the application when ESC is pressed), and the robot
  is replaced by a cool-looking ninja under different lighting

- listeningninja.pl: same cool ninja scene, but showing how to implement
  a FrameListener to handle user input (e.g. keyboard)

- buffered.pl: demo of buffered input handling, this implements OGRE's
  "Basic Tutorial 5"

- sky.pl: demo of Terrain, Sky, and Fog, this implements OGRE's
  "Basic Tutorial 3"

- animate.pl: watch the robot walk
  (note: this is still a little incomplete, so the robot will "moonwalk"
   once he reaches the first waypoint - I have to wrap a few more Node
   and Quaternion methods, and fix some overloaded operators)

- wx.pl: this is NOT WORKING YET, but if it were it should show how
  to make wxPerl work with Ogre. I think the problem is more that
  the example I copied it from doesn't work, rather than the Perl
  version per se. (It's segfaulting after failing a GDK_IS_DRAWABLE
  assertion, I'm guessing because the window isn't fully "realized".
  But I can't really tell.)
